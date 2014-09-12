package bluehairedlawyer

import org.springframework.dao.DataIntegrityViolationException

/**
 * AccountController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AccountController {

	//static scaffold = Account
	
	def index() {
		redirect(action: "list", params: params)
	}
	
	def search() {
		
		println "search: " + params
		
		def fromDate
		def toDate
		
		try {
			fromDate = Date.parse("MM/dd/yyyy", params.accountDateFrom)
			toDate = Date.parse("MM/dd/yyyy", params.accountDateTo)
			
			fromDate.clearTime()
			toDate[Calendar.HOUR_OF_DAY] = 23
			toDate[Calendar.MINUTE] = 59
			toDate[Calendar.SECOND] = 59
		} catch(Exception ignored) {
			println "ERROR"
		}

		
		def criteria = Account.createCriteria()
		def results = criteria.list {
			if (fromDate && toDate)
				between("paymentDate", fromDate, toDate)
			and {
				isNotNull("paidValue")
			}
		}
		
		def debit = 0
		def credit = 0
		
		
		println results
		
		results.each {
			if(it.operationType == OperationType.DEBIT)
				debit += it.paidValue
			if(it.operationType == OperationType.CREDIT)
				credit += it.paidValue
		}
		
		def total = credit - debit
		
		render(template: "transactionsList", model: [accountInstanceList : results, accountInstanceTotal: results.size(), sumOfDebits: debit, sumOfCredits: credit, total: total])
	}
	
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		if (!params.fromDate || !params.toDate) {
			params.fromDate = (new Date() -30).format('MM/dd/yyyy')
			params.toDate = new Date().format('MM/dd/yyyy')
		}
		
		
		def fromDate
		def toDate
		
		try {
			fromDate = Date.parse("MM/dd/yyyy", params.fromDate)
			toDate = Date.parse("MM/dd/yyyy", params.toDate)
			
			fromDate.clearTime()
			toDate[Calendar.HOUR_OF_DAY] = 23
			toDate[Calendar.MINUTE] = 59
			toDate[Calendar.SECOND] = 59
		} catch(Exception ignored) {
			println "ERROR"
		}
		
		def criteria = Account.createCriteria()
		def results = criteria.list {
			if (fromDate && toDate)
				between("paymentDate", fromDate, toDate)
			and {
				isNotNull("paidValue")
			}
		}
		
		def debit = 0
		def credit = 0
		
		
		println results
		
		results.each {
			if(it.operationType == OperationType.DEBIT)
				debit += it.paidValue
			if(it.operationType == OperationType.CREDIT)
				credit += it.paidValue
		}
		
		def total = credit - debit
		
		[accountInstanceList : results, accountInstanceTotal: results.size(), sumOfDebits: debit, sumOfCredits: credit, total: total]
		
		//[accountInstanceList: Account.list(params), accountInstanceTotal: Account.count()]
		
		
	}
	
	def create = {  
		println params 
		def accountTypeList = []
		AccountType.findAll().each {
			if(it == AccountType.CLIENT_EXPENSE || it == AccountType.OFFICE_EXPENSE)
				accountTypeList.add(it)
		}
		
		[accountInstance: new Account(params), 
			lawsuitsId: params.lawsuitsId,
			accountType: accountTypeList]
	}

	def save = {
		def accountInstance = new Account(params)
		
		def lawsuitInstance = Lawsuits.get(params.lawsuitsId)
		
		accountInstance.lawsuit = lawsuitInstance

		println accountInstance.accountType
		
		//accountInstance.accountType = AccountType.findByValue(params.accountType)
		
		if(accountInstance.accountType == AccountType.CLIENT_EXPENSE ||
			accountInstance.accountType == AccountType.OFFICE_EXPENSE) {
			accountInstance.operationType = OperationType.DEBIT
			
			accountInstance.code = "Despesas Processuais"
		}
		else {
			accountInstance.code = "Honorarios"
		}

		// TODO allow inspection screen to set the time
		if (!accountInstance.save(flush: true)) {
			render(view: "create", model: [accountInstance: accountInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'account.label', default: 'account'),
			accountInstance.id
		])
		
		redirect(controller: "lawsuits", action: "show", id: lawsuitInstance.id)
	}
	
	def addPayment = {
		
		println "addPayment: " + params
		
		def account = Account.get(params.accountId)
		
		account.properties = params
		account.operationType = OperationType.CREDIT
		account.client = account.lawsuit.client
		println account.bank
		def bank = Bank.findById(account.bank.id)
		
		bank.currentBalance += account.paidValue
		
		if (!account.save(flush: true)) {
			render(view: "edit", model: [accountInstance: account])
			return
		}

		redirect(controller: "lawsuits", action: "show", params: [id: account.lawsuit.id])
	}
	
	def addTransaction = {
		println "* addTransaction ${params}"
		
		render (view: "_addTransaction")
	}
	
	def saveTransaction = {
		
		println "addPayment: " + params
		
		def account = new Account(params)
		account.date = account.paymentDate
		account.value = account.paidValue
		account.accountType = AccountType.CURRENT
		
		
		def bank = Bank.findById(account.bank.id)
		
		if(account.operationType == OperationType.CREDIT)
			bank.currentBalance += account.paidValue
		else
			bank.currentBalance -= account.paidValue
		
		if (!account.save(flush: true)) {
			render(view: "edit", model: [accountInstance: account])
			return
		}
		redirect(action: "list", params: params)
	}
	
	def delete() {
		
		println "account delete " + params
		
		def accountInstance = Account.get(params.id)
		
		if (!accountInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Item'), params.id])
			redirect(action: "list")
			return
		}

		try {
			accountInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'account.label', default: 'Item'), params.id])
			
			if(params.backToLawsuit)
				redirect(action: "show", controller: "lawsuits", params:[id: accountInstance.lawsuit.id, activeTab: 'tab2'])
			else
				redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			redirect(action: "show", id: params.id)
		}
	}
	
	def show() {
		
		println "account show " + params
		
		def accountInstance = Account.get(params.id)
		if (!accountInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'acount.label', default: 'Item'), params.id])
			redirect(action: "list")
			return
		}
		
		[accountInstance: accountInstance, backToLawsuit: params.backToLawsuit]
	}
	
}

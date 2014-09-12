package bluehairedlawyer

import org.springframework.dao.DataIntegrityViolationException

import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;

/**
 * LawsuitsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class LawsuitsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [lawsuitsInstanceList: Lawsuits.list(params), lawsuitsInstanceTotal: Lawsuits.count()]
    }

    def create() {
        [lawsuitsInstance: new Lawsuits(params)]
    }

    def save() {
        def lawsuitsInstance = new Lawsuits(params)
        if (!lawsuitsInstance.save(flush: true)) {
            render(view: "create", model: [lawsuitsInstance: lawsuitsInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), lawsuitsInstance.id])
        redirect(action: "show", id: lawsuitsInstance.id)
    }

    def show() {
        def lawsuitsInstance = Lawsuits.get(params.id)
		
		def honorariumInstance = Account.findAllByLawsuitAndAccountType(lawsuitsInstance, AccountType.HONORARIUM)
		def costInstance = Account.findAllByLawsuitAndAccountTypeInList(lawsuitsInstance, [AccountType.CLIENT_EXPENSE, AccountType.OFFICE_EXPENSE])
		
        if (!lawsuitsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), params.id])
            redirect(action: "list")
            return
        }

        [lawsuitsInstance: lawsuitsInstance, honorariumList: honorariumInstance?.toList(), costList: costInstance?.toList()]
    }

    def edit() {
        def lawsuitsInstance = Lawsuits.get(params.id)
        if (!lawsuitsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), params.id])
            redirect(action: "list")
            return
        }

        [lawsuitsInstance: lawsuitsInstance]
    }

    def update() {
        def lawsuitsInstance = Lawsuits.get(params.id)
        if (!lawsuitsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (lawsuitsInstance.version > version) {
                lawsuitsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lawsuits.label', default: 'Lawsuits')] as Object[],
                          "Another user has updated this Lawsuits while you were editing")
                render(view: "edit", model: [lawsuitsInstance: lawsuitsInstance])
                return
            }
        }

        lawsuitsInstance.properties = params

        if (!lawsuitsInstance.save(flush: true)) {
            render(view: "edit", model: [lawsuitsInstance: lawsuitsInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), lawsuitsInstance.id])
        redirect(action: "show", id: lawsuitsInstance.id)
    }

    def delete() {
        def lawsuitsInstance = Lawsuits.get(params.id)
        if (!lawsuitsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), params.id])
            redirect(action: "list")
            return
        }

        try {
            lawsuitsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lawsuits.label', default: 'Lawsuits'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def addPayment() {
		println "* addPayment ${params}"
		def account = Account.get(params.accountId)
		
		account.paymentDate = new Date()
		account.paidValue = account.value

		render (view: "_addPayment", model: [accountInstance: account])
	}
}

package bluehairedlawyer

import java.util.Date;

class Account {
			
	Date date
	String description
	String code
	String subCode
	String observations
	BigDecimal value
	Date paymentDate
	BigDecimal paidValue
	
	String parcelNumber
	Date expirationDate
	
	AccountType accountType
	OperationType operationType
	
	Person client
	Bank bank
	Lawsuits lawsuit
	
    static constraints = {
		code(nullable: true, blank:true)
		subCode(nullable: true, blank:true)
		operationType(nullable: true, blank:true)
		client(nullable: true, blank:true)
		bank(nullable: true, blank:true)
		lawsuit(nullable: true, blank:true)
		accountType(nullable: true, blank:true)
		paymentDate(nullable: true, blank:true)
		paidValue(nullable: true, blank:true)
		expirationDate(nullable: true, blank:true)
		observations(nullable: true, blank:true)
		parcelNumber(nullable: true, blank:true)
    }
}

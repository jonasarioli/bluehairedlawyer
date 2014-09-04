package bluehairedlawyer

import cr.co.arquetipos.currencies.Money
import java.util.Date;

class Account {

	enum Type {
		CREDIT, DEBIT
	}
	
	enum AccountType {
		HONORARIUM, CLIENT_EXPENSE, OFFICE_EXPENSE, CURRENT
	}
	
	static belongsTo = [lawsuit: Lawsuits, bank: Bank]
	
	Date date
	String Description
	String code
	String subCode
	String observations
	Type type	
	AccountType account
	BigDecimal value
	
	String parcelNumber
	Date expirationDate
			
	static embedded = ['money']
	
    static constraints = {
    }
}

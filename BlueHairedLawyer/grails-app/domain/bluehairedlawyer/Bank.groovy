package bluehairedlawyer

class Bank {

	String name
	String agency
	String currentAccount
	BigDecimal initialBalance
	BigDecimal currentBalance
	
    static constraints = {
    }
	
	String toString(){ return "${name}"}
}

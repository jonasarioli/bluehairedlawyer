package bluehairedlawyer

class Lawsuits {
	
	String number
	
	static belongsTo = [client : Person]
	static hasMany = [accounts : Account] 
    static constraints = {
		number(blank: false)
    }
	
	String toString(){ return "${number}"}
}

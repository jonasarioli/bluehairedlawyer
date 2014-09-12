package bluehairedlawyer

class Phone {

	String phoneNumber
	String extension
	String contactPerson

	static belongsTo = [person: Person]
	
    static constraints = {
		phoneNumber(blank: false, size: 10..15)
    }
	
	String toString(){ return "${phoneNumber}"}
}

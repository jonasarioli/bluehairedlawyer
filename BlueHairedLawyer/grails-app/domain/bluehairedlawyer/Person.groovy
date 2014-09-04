package bluehairedlawyer

class Person {

    String name;
    String docNumber;
	String email;
	

    static hasMany = [addresses: Address, phones: Phone]

    static constraints = {
        name(blank: false)
        docNumber(blank: false, size: 11..18)
    }
}

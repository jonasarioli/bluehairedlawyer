package bluehairedlawyer

class Person {

	String name;
	String docNumber;
	String email;

	//Address address
	static hasMany = [addresses: Address, phones: Phone, lawsuits: Lawsuits]

	static constraints = {
		name(blank: false)
		docNumber(blank: false, cpfCnpj:true, , size: 14..18)
	}
	String toString(){ return "${name}"}
}

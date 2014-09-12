package bluehairedlawyer

class Address {

    String streetAddress;
	String number;
    String city;
    BrazilianStates state;
	String district;
    String zipCode;

    //Date moveInDate;
    //Date moveOutDate;
	static transients = [ '_deleted' ]
    static belongsTo = [person: Person]

    static constraints = {
        streetAddress(blank: false)
		number(blank: false)
        city(blank: false)
		district(blank: false)
        state(blank: false)
        zipCode(blank: false)
        /*moveInDate(nullable: false, max:  new Date())
        moveOutDate(nullable: true, validator: { val, obj ->
            val?.after(obj.moveInDate)
        })*/
    }
	
	String toString(){ return "${streetAddress}, ${number}. ${district} - ${zipCode}. ${city} - ${state}"}
}

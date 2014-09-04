package bluehairedlawyer

class Address {

    String streetAddress;
	String number;
    String city;
    String state;
	String district;
    String zipCode;

    //Date moveInDate;
    //Date moveOutDate;

    static belongsTo = [person: Person]

    static constraints = {
        streetAddress(blank: false)
		number(blank: false)
        city(blank: false)
		district(blank: false)
        state(blank: false, size: 2..2)
        zipCode(blank: false, size: 8..8, validator: {val, obj -> val?.isNumber()})
        /*moveInDate(nullable: false, max:  new Date())
        moveOutDate(nullable: true, validator: { val, obj ->
            val?.after(obj.moveInDate)
        })*/
    }
}

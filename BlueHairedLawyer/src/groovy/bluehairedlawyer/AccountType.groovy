package bluehairedlawyer

public enum AccountType {

	HONORARIUM("Honorario"), 
	CLIENT_EXPENSE("Despesa do cliente"), 
	OFFICE_EXPENSE("Despesa do escritorio"), 
	CURRENT("Despesas gerais")
	
	private final String value

	AccountType(String value) {
		this.value = value
	}

	public String value() {
		return this.value
	}
	
	//String toString(){ return "${value}"}
	
	String getKey() { name() }
}

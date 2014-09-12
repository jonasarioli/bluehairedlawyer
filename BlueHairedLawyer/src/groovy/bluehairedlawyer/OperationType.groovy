package bluehairedlawyer

public enum OperationType {

	CREDIT("Credito"),
	DEBIT("Debito")

	private final String value

	OperationType(String value) {
		this.value = value
	}

	public String value() {
		return this.value
	}
	
	String toString(){ return "${value}"}
}

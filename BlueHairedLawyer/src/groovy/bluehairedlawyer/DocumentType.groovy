package bluehairedlawyer

public enum DocumentType {

	CPF("CPF"),
	CNPJ("CNPJ")
	

	private final String value

	DocumentType(String value) {
		this.value = value
	}

	public String value() {
		return this.value
	}
}

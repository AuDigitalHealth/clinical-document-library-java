package au.gov.nehta.model.cda.common.person;

public enum PersonNameUseEnum {
	LEGAL( "L", "(R1) Legal" ), LICENSE( "C", "(R1) License" ), NEW_BORN( "NB", "New Born" ), ARTIST_STAGE( "A", "(R1) Artist/Stage" ), MAIDEN_NAME( "M", "(R2) Maiden Name" ), PSEUDONYM( "P",
			"(R1) Pseudonym" );

	private String code;
	private String descriptor;

	PersonNameUseEnum( String code, String descriptor ) {
		this.code = code;
		this.descriptor = descriptor;
	}

	public String getCode() {
		return this.code;
	}

	public String getDescriptor() {
		return descriptor;
	}
}

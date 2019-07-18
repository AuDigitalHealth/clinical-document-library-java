package au.gov.nehta.model.cda.common.org;

public enum OrganizationNameUseEnum {
	ORGANIZATIONAL_UNIT_SECTION_DIVISION_NAME( "ORGU", "Organizational unit/section/division name" ), SERVICE_LOCATION_NAME( "ORGS", "Service location name" ), BUSINESS_NAME( "ORGB", "Business name" ), LOCALLY_USED_NAME(
			"ORGL", "Locally used name" ), ABBREVIATED_NAME( "ORGA", "Abbreviated name" ), ENTERPRISE_NAME( "ORGE", "Enterprise name" ), OTHER( "ORGX", "Other" ), UNKNOWN( "ORGY", "Unknown" );

	private String code;
	private String descriptor;

	OrganizationNameUseEnum( String code, String descriptor ) {
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

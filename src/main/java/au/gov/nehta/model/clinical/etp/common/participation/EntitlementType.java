package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.types.EnumTuple;

public enum EntitlementType implements EnumTuple {
	MEDICARE_BENEFITS( "1", "Medicare Benefits" ), PENSIONER_CONCESSION( "2", "Pensioner Concession" ), COMMONWEALTH_SENIORS_HEALTH_CONCESSION( "3", "Commonwealth Seniors Health Concession" ), HEALTHCARE_CONCESSION(
			"4", "Healthcare Concession" ), REPATRIATION_HEALTH_GOLD_BENEFITS( "5", "Repatriation Health Gold Benefits" ), REPATRIATION_HEALTH_WHITE_BENEFITS( "6",
			"Repatriation Health White Benefits" ), REPATRIATION_HEALTH_ORANGE_BENEFITS( "7", "Repatriation Health Orange Benefits" ), SAFETY_NET_CONCESSION( "8", "Safety Net Concession" ), SAFETY_NET_ENTITLEMENT(
			"9", "Safety Net ParticipantEntitlement" ), MEDICARE_PRESCRIBER_NUMBER( "10", "Medicare Prescriber Number" ), MEDICARE_PHARMACY_APPROVAL_NUMBER( "11", "Medicare Pharmacy Approval Number" );

	private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16047";
	private final String CODE_SYSTEM_NAME = "NCTIS ParticipantEntitlement Type Values";
	private final String CODE_SYSTEM_VERSION = "2010";
	private final String code;
	private final String descriptor;

	EntitlementType( String code, String descriptor ) {
		this.code = code;
		this.descriptor = descriptor;
	}

	public String getCode() {
		return code;
	}

	public String getDescriptor() {
		return descriptor;
	}

	public String getOriginalText() {
		return descriptor;
	}

	public String getCodeSystem() {
		return CODE_SYSTEM;
	}

	public String getCodeSystemName() {
		return CODE_SYSTEM_NAME;
	}

	public String getCodeSystemVersion() {
		return CODE_SYSTEM_VERSION;
	}

	public String getDisplayName() {
		return descriptor;
	}

	public boolean hasDisplayName() {
		return true;
	}
}

package au.gov.nehta.builder.common;

import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.ED;

public class EntitlementTypeCodeSet {
    private static final String NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16047";
    private static final String NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME = "NCTIS Entitlement Type Values";

    private static final String MEDICARE_BENEFITS_DISPLAY_NAME = "Medicare Benefits";
    private static final String MEDICARE_BENEFITS_CODE = "1";
    public static final CD MEDICARE_BENEFITS = new CD();

    private static final String PENSIONER_CONCESSION_DISPLAY_NAME = "Pensioner Concession";
    private static final String PENSIONER_CONCESSION_CODE = "2";
    public static final CD PENSIONER_CONCESSION = new CD();

    private static final String COMMONWEALTH_SENIORS_HEALTH_CONCESSION_DISPLAY_NAME = "Commonwealth Seniors Health Concession";
    private static final String COMMONWEALTH_SENIORS_HEALTH_CONCESSION_CODE = "3";
    public static final CD COMMONWEALTH_SENIORS_HEALTH_CONCESSION = new CD();

    private static final String HEALTH_CARE_CONCESSION_DISPLAY_NAME = "Health Care Concession";
    private static final String HEALTH_CARE_CONCESSION_CODE = "4";
    public static final CD HEALTH_CARE_CONCESSION = new CD();

    private static final String REPATRIATION_HEALTH_GOLD_BENEFITS_DISPLAY_NAME = "Repatriation Health Gold Benefits";
    private static final String REPATRIATION_HEALTH_GOLD_BENEFITS_CODE = "5";
    public static final CD REPATRIATION_HEALTH_GOLD_BENEFITS = new CD();

    private static final String REPATRIATION_HEALTH_WHITE_BENEFITS_DISPLAY_NAME = "Repatriation Health White Benefits";
    private static final String REPATRIATION_HEALTH_WHITE_BENEFITS_CODE = "6";
    public static final CD REPATRIATION_HEALTH_WHITE_BENEFITS = new CD();

    private static final String REPATRIATION_HEALTH_ORANGE_BENEFITS_DISPLAY_NAME = "Repatriation Health Orange Benefits";
    private static final String REPATRIATION_HEALTH_ORANGE_BENEFITS_CODE = "7";
    public static final CD REPATRIATION_HEALTH_ORANGE_BENEFITS = new CD();

    private static final String SAFETY_NET_CONCESSION_DISPLAY_NAME = "Safety Net Concession";
    private static final String SAFETY_NET_CONCESSION_CODE = "8";
    public static final CD SAFETY_NET_CONCESSION = new CD();

    private static final String SAFETY_NET_ENTITLEMENT_DISPLAY_NAME = "Safety Net ParticipantEntitlement";
    private static final String SAFETY_NET_ENTITLEMENT_CODE = "9";
    public static final CD SAFETY_NET_ENTITLEMENT = new CD();

    private static final String MEDICARE_PRESCRIBER_NUMBER_DISPLAY_NAME = "Medicare Prescriber Number";
    private static final String MEDICARE_PRESCRIBER_NUMBER_CODE = "10";
    public static final CD MEDICARE_PRESCRIBER_NUMBER = new CD();

    private static final String MEDICARE_PHARMACY_APPROVAL_NUMBER_DISPLAY_NAME = "Medicare Pharmacy Approval Number";
    private static final String MEDICARE_PHARMACY_APPROVAL_NUMBER_CODE = "11";
    public static final CD MEDICARE_PHARMACY_APPROVAL_NUMBER = new CD();

    public static final ED MEDICARE_BENEFITS_ORIGINAL_TEXT = new ED();

    static {

        MEDICARE_BENEFITS_ORIGINAL_TEXT.getContent().add("Medicare Benefits");

        MEDICARE_BENEFITS.setDisplayName(MEDICARE_BENEFITS_DISPLAY_NAME);
        MEDICARE_BENEFITS.setCode(MEDICARE_BENEFITS_CODE);
        MEDICARE_BENEFITS.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        MEDICARE_BENEFITS.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);
        MEDICARE_BENEFITS.setOriginalText(MEDICARE_BENEFITS_ORIGINAL_TEXT);

        PENSIONER_CONCESSION.setDisplayName(PENSIONER_CONCESSION_DISPLAY_NAME);
        PENSIONER_CONCESSION.setCode(PENSIONER_CONCESSION_CODE);
        PENSIONER_CONCESSION.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        PENSIONER_CONCESSION.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        COMMONWEALTH_SENIORS_HEALTH_CONCESSION.setDisplayName(COMMONWEALTH_SENIORS_HEALTH_CONCESSION_DISPLAY_NAME);
        COMMONWEALTH_SENIORS_HEALTH_CONCESSION.setCode(COMMONWEALTH_SENIORS_HEALTH_CONCESSION_CODE);
        COMMONWEALTH_SENIORS_HEALTH_CONCESSION.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        COMMONWEALTH_SENIORS_HEALTH_CONCESSION.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        HEALTH_CARE_CONCESSION.setDisplayName(HEALTH_CARE_CONCESSION_DISPLAY_NAME);
        HEALTH_CARE_CONCESSION.setCode(HEALTH_CARE_CONCESSION_CODE);
        HEALTH_CARE_CONCESSION.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        HEALTH_CARE_CONCESSION.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        REPATRIATION_HEALTH_GOLD_BENEFITS.setDisplayName(REPATRIATION_HEALTH_GOLD_BENEFITS_DISPLAY_NAME);
        REPATRIATION_HEALTH_GOLD_BENEFITS.setCode(REPATRIATION_HEALTH_GOLD_BENEFITS_CODE);
        REPATRIATION_HEALTH_GOLD_BENEFITS.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        REPATRIATION_HEALTH_GOLD_BENEFITS.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        REPATRIATION_HEALTH_WHITE_BENEFITS.setDisplayName(REPATRIATION_HEALTH_WHITE_BENEFITS_DISPLAY_NAME);
        REPATRIATION_HEALTH_WHITE_BENEFITS.setCode(REPATRIATION_HEALTH_WHITE_BENEFITS_CODE);
        REPATRIATION_HEALTH_WHITE_BENEFITS.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        REPATRIATION_HEALTH_WHITE_BENEFITS.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        REPATRIATION_HEALTH_ORANGE_BENEFITS.setDisplayName(REPATRIATION_HEALTH_ORANGE_BENEFITS_DISPLAY_NAME);
        REPATRIATION_HEALTH_ORANGE_BENEFITS.setCode(REPATRIATION_HEALTH_ORANGE_BENEFITS_CODE);
        REPATRIATION_HEALTH_ORANGE_BENEFITS.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        REPATRIATION_HEALTH_ORANGE_BENEFITS.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        SAFETY_NET_CONCESSION.setDisplayName(SAFETY_NET_CONCESSION_DISPLAY_NAME);
        SAFETY_NET_CONCESSION.setCode(SAFETY_NET_CONCESSION_CODE);
        SAFETY_NET_CONCESSION.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        SAFETY_NET_CONCESSION.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        SAFETY_NET_ENTITLEMENT.setDisplayName(SAFETY_NET_ENTITLEMENT_DISPLAY_NAME);
        SAFETY_NET_ENTITLEMENT.setCode(SAFETY_NET_ENTITLEMENT_CODE);
        SAFETY_NET_ENTITLEMENT.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        SAFETY_NET_ENTITLEMENT.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        MEDICARE_PRESCRIBER_NUMBER.setDisplayName(MEDICARE_PRESCRIBER_NUMBER_DISPLAY_NAME);
        MEDICARE_PRESCRIBER_NUMBER.setCode(MEDICARE_PRESCRIBER_NUMBER_CODE);
        MEDICARE_PRESCRIBER_NUMBER.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        MEDICARE_PRESCRIBER_NUMBER.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);

        MEDICARE_PHARMACY_APPROVAL_NUMBER.setDisplayName(MEDICARE_PHARMACY_APPROVAL_NUMBER_DISPLAY_NAME);
        MEDICARE_PHARMACY_APPROVAL_NUMBER.setCode(MEDICARE_PHARMACY_APPROVAL_NUMBER_CODE);
        MEDICARE_PHARMACY_APPROVAL_NUMBER.setCodeSystemName(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM_NAME);
        MEDICARE_PHARMACY_APPROVAL_NUMBER.setCodeSystem(NCTIS_ENTITLEMENT_TYPE_VALUES_CODE_SYSTEM);
    }

    public static CD convert(EntitlementType etpEntitlementType) {

        CD entitlementType = null;

        switch (etpEntitlementType) {
            case MEDICARE_BENEFITS: {
                entitlementType = EntitlementTypeCodeSet.MEDICARE_BENEFITS;
                break;
            }
            case PENSIONER_CONCESSION: {
                entitlementType = EntitlementTypeCodeSet.PENSIONER_CONCESSION;
                break;
            }
            case COMMONWEALTH_SENIORS_HEALTH_CONCESSION: {
                entitlementType = EntitlementTypeCodeSet.COMMONWEALTH_SENIORS_HEALTH_CONCESSION;
                break;
            }
            case HEALTHCARE_CONCESSION: {
                entitlementType = EntitlementTypeCodeSet.HEALTH_CARE_CONCESSION;
                break;
            }
            case REPATRIATION_HEALTH_GOLD_BENEFITS: {
                entitlementType = EntitlementTypeCodeSet.REPATRIATION_HEALTH_GOLD_BENEFITS;
                break;
            }
            case REPATRIATION_HEALTH_WHITE_BENEFITS: {
                entitlementType = EntitlementTypeCodeSet.REPATRIATION_HEALTH_WHITE_BENEFITS;
                break;
            }
            case REPATRIATION_HEALTH_ORANGE_BENEFITS: {
                entitlementType = EntitlementTypeCodeSet.REPATRIATION_HEALTH_ORANGE_BENEFITS;
                break;
            }
            case SAFETY_NET_CONCESSION: {
                entitlementType = EntitlementTypeCodeSet.SAFETY_NET_CONCESSION;
                break;
            }
            case SAFETY_NET_ENTITLEMENT: {
                entitlementType = EntitlementTypeCodeSet.SAFETY_NET_ENTITLEMENT;
                break;
            }
            case MEDICARE_PRESCRIBER_NUMBER: {
                entitlementType = EntitlementTypeCodeSet.MEDICARE_PRESCRIBER_NUMBER;
                break;
            }
            case MEDICARE_PHARMACY_APPROVAL_NUMBER: {
                entitlementType = EntitlementTypeCodeSet.MEDICARE_PHARMACY_APPROVAL_NUMBER;
                break;
            }
        }

        return entitlementType;
    }
}

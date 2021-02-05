package au.gov.nehta.builder.common;

import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;

public class SectionEntryCodeSet {

    public static final CE PHARMACIST_SHARED_MEDICINES_LIST = LOINC_CE(
            "Pharmacist Shared Medicines List", "56445-0");
    public static final CE DISCHARGE_SUMMARY = LOINC_CE(
            "Discharge Summarization Note", "18842-5");
    public static final CE SERVICE_REFERRAL = LOINC_CE(
            "Referral note", "57133-1");
    public static final CE ADVANCE_CARE_DIRECTIVE = NCTIS_CE(
            "Advance Care Directive Custodian Record", "100.16696");
    public static final CE E_REFERRAL = LOINC_CE("Referral note", "57133-1");
    public static final CE ADVANCE_CARE_PLANNING = NCTIS_CE(
            "Advance Care Information", "100.16975");
    public static final CE GOALS_OF_CARE = NCTIS_CE(
            "Advance Care Information", "100.16975");

    private static final String NCTIS_DATA_COMPONENTS_CODE_SYSTEM = "1.2.36.1.2001.1001.101";
    private static final String NCTIS_DATA_COMPONENTS_CODE_SYSTEM_NAME = "NCTIS Data Components";

    private static final String LOINC_CODE_SYSTEM = "2.16.840.1.113883.6.1";
    private static final String LOINC_CODE_SYSTEM_NAME = "LOINC";

    public static final CD ADDITIONAL_COMMENTS = NCTIS(
            "Additional Comments", "103.16044");
    public static final CE ADMINISTRATIVE_OBSERVATIONS =
            NCTIS_CE("Administrative Observations", "102.16080");
    public static final CE AGE = NCTIS_CE("Age", "103.20109");
    public static final CE AGE_ACCURACY_INDICATOR = NCTIS_CE(
            "Age Accuracy Indicator", "103.16279");
    public static final CE BIRTH_PLURALITY = NCTIS_CE("Birth Plurality", "103.16249");

    //    private static final String RACF_CODE_SYSTEM_NAME = "RACF Id";
    //    private static final String RACF_DISPLAY_NAME = "To be determined";
    //    private static final String RACF_ID_CODE = "1.2.36.1.2001.1005.44";
    public static final CD RACF = cd("To be determined", null,
            "RACF Id", "1.2.36.1.2001.1005.44");

    public static final CD BRAND_SUBSTITUTION_OCCURRED =
            NCTIS("Brand Substitution Occurred", "103.16064");

    public static final CE DATE_OF_BIRTH_ACCURACY_INDICATOR =
            NCTIS_CE("Date of Birth Accuracy Indicator", "102.16234");

    public static final CE DATE_OF_DEATH_ACCURACY_INDICATOR =
            NCTIS_CE("Date of Death Accuracy Indicator", "102.16252");

    public static final CE SOURCE_OF_DEATH_CODE =
            NCTIS_CE("Source of Death Notification", "103.10243");

    public static final CE MOTHERS_MAIDEN_NAME =
            NCTIS_CE("Mother's Original Family Name", "103.10245");

    public static final CE DATE_OF_BIRTH_IS_CALCULATED_FROM_AGE =
            NCTIS_CE("Date of Birth is Calculated From Age", "103.16233");

    public static final CD DATE_TIME_PRESCRIPTION_EXPIRES =
            NCTIS("DateTime Prescription Expires", "103.10104");

    public static final CD DISPENSE = NCTIS("Dispense", "102.10105");

    public static final CE DISPENSE_ITEM = NCTIS_CE("Dispense Item", "102.16211");

    public static final CE NPDR_DISPENSE_ITEM = NCTIS_CE("Dispense Item", "102.16210");
    public static final CE DISPENSE_RECORD = LOINC_CE("Medication Dispensed", "60593-1");
    public static final CE NPDR_DISPENSE_RECORD = NCTIS_CE(
            "PCEHR Dispense Record", "100.16765");
    public static final CD EARLY_SUPPLY_WITH_PHARMACEUTICAL_BENEFIT =
            NCTIS("Early Supply With Pharmaceutical Benefit", "103.16348");
    public static final CD FORMULA = NCTIS("Formula", "103.16272");
    public static final CD LABEL_INSTRUCTION = NCTIS("Label Instruction", "103.16109");
    public static final CE OBSERVATIONS = NCTIS_CE("Observations", "101.16280");
    public static final CD PBS_RPBS_AUTHORITY_APPROVAL_NUMBER =
            NCTIS("PBS/RPBS Authority Approval Number", "103.10159");
    public static final CD PBS_RPBS_AUTHORITY_PRESCRIPTION_NUMBER =
            NCTIS("PBS/RPBS Authority Prescription Number", "103.16719");
    public static final CD STREAMLINED_AUTHORITY_APPROVAL_NUMBER =
            NCTIS("Streamlined Authority Approval Number", "103.16718");
    public static final CE PRESCRIBER_INSTRUCTION_COMMUNICATION_MEDIUM =
            NCTIS_CE("Prescriber Instruction Communication Medium", "103.16297");
    public static final CE PRESCRIBER_INSTRUCTION_DETAIL =
            NCTIS_CE("Prescriber Instruction Detail", "102.16290");
    public static final CD PRESCRIBER_INSTRUCTION_SOURCE =
            NCTIS("Prescriber Instruction Source", "103.16295");
    public static final CE PRESCRIPTION = LOINC_CE("Prescription Document", "64287-6");

    public static final CE SHARED_HEALTH_SUMMARY = LOINC_CE("Patient summary", "60591-5");

    public static final CE EVENT_SUMMARY = LOINC_CE("Summary of episode note", "34133-9");

    public static final CE SPECIALIST_LETTER = LOINC_CE("Letter", "51852-2");

    public static final CE EREFERRAL_DOCUMENT = LOINC_CE("Referral note", "57133-1");

    public static final CE DIAGNOSTIC_IMAGING_REPORT =
            NCTIS_CE("Diagnostic Imaging Report", "100.16957");
    public static final CE DIAGNOSTIC_IMAGING_SECTION = NCTIS_CE(
            "DIAGNOSTIC IMAGING", "101.16945");
    public static final CE IMAGE_EXAMINATION_RESULT_SECTION =
            NCTIS_CE("Imaging Examination Result", "102.16145");

    public static final CE PATHOLOGY_RESULT_REPORT = NCTIS_CE(
            "Pathology Report", "100.32001");
    public static final CE PATHOLOGY_SECTION = NCTIS_CE("Pathology", "101.20018");
    public static final CE PATHOLOGY_TEST_RESULT_SECTION =
            NCTIS_CE("Pathology Test Result", "102.16144");

    public static final CE PRESCRIPTION_ITEM = NCTIS_CE("Prescription Item", "102.16211");
    public static final CE NPDR_PRESCRIPTION_ITEM =
            NCTIS_CE("PCEHR Prescription Record", "100.16764");
    public static final CD PRESCRIPTION_NOTE_DETAIL = NCTIS(
            "Prescription Note Detail", "102.16212");
    public static final CE PRESCRIPTION_REQUEST = NCTIS_CE(
            "Prescription Request", "100.16285");
    public static final CE PRESCRIPTION_REQUEST_ITEM =
            NCTIS_CE("Prescription Request Item", "102.16211");
    public static final CE QUALIFICATIONS = NCTIS_CE("Qualifications", "103.16268");
    public static final CD REASON_FOR_THERAPEUTIC_GOOD =
            NCTIS("Reason for Therapeutic Good", "103.10141");
    public static final CD REQUESTER_NOTE = NCTIS("Requester Note", "102.16212");
    public static final CD STATE_AUTHORITY_NUMBER = NCTIS(
            "State Authority Number", "103.16018");

    // NPDR wants TE
    // 4888 wants N
    //    protected static final String TE_SUBSTITUTION_PERMISSION_CODE = "TE";
    //    protected static final String N_SUBSTITUTION_PERMISSION_CODE = "N";
    //    protected static final String SUBSTITUTION_PERMISSION_CODE_SYSTEM =
    // "2.16.840.1.113883.5.1070";
    //    protected static final String SUBSTITUTION_PERMISSION_CODE_SYSTEM_NAME =
    // "HL7:SubstanceAdminSubstitution";
    //    protected static final String SUBSTITUTION_PERMISSION_DISPLAY_NAME = "Therapeutic";
    public static final CE TE_SUBSTITUTION =
            ce("Therapeutic", "TE", "HL7:SubstanceAdminSubstitution",
                    "2.16.840.1.113883.5.1070");
    public static final CE N_SUBSTITUTION =
            ce("Therapeutic", "N", "HL7:SubstanceAdminSubstitution",
                    "2.16.840.1.113883.5.1070");

    /**
     * Build a CD element
     */
    private static CD cd(String name, String code, String csName, String system) {
        CD cd = new CD();
        cd.setDisplayName(name);
        cd.setCode(code);
        cd.setCodeSystemName(csName);
        cd.setCodeSystem(system);
        return cd;
    }

    /**
     * Build a CE element
     */
    private static CE ce(String name, String code, String csName, String system) {
        CE ce = new CE();
        ce.setDisplayName(name);
        ce.setCode(code);
        ce.setCodeSystemName(csName);
        ce.setCodeSystem(system);
        return ce;
    }

    /**
     * Build a NCTIS CD element
     */
    private static CD NCTIS(String name, String code) {
        return cd(
                name, code, NCTIS_DATA_COMPONENTS_CODE_SYSTEM_NAME, NCTIS_DATA_COMPONENTS_CODE_SYSTEM);
    }

    /**
     * Build a NCTIS CE element
     */
    private static CE NCTIS_CE(String name, String code) {
        return ce(
                name, code, NCTIS_DATA_COMPONENTS_CODE_SYSTEM_NAME, NCTIS_DATA_COMPONENTS_CODE_SYSTEM);
    }

    private static CE LOINC_CE(String name, String code) {
        return ce(name, code, LOINC_CODE_SYSTEM_NAME, LOINC_CODE_SYSTEM);
    }
}

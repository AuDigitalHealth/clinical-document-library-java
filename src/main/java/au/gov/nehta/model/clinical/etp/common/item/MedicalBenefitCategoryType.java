package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.model.clinical.common.types.EnumTuple;

public enum MedicalBenefitCategoryType implements EnumTuple {
    PBS("1", "A subsidy under the Pharmaceutical Benefits Scheme1 applies to this item.", "PBS"),
    RPBS("2", "A subsidy under the Repatriation Pharmaceutical Benefits Scheme2 applies to this item.", "RPBS"),
    CTG("3", "A subsidy under the Closing the Gap-PBS Co-Payment Measure3 applies to this item.", "CTG"),
    NO_BENEFIT("9", "This item is not covered by a medical subsidy.", "No Benefit");

    private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.16095";
    private final String CODE_SYSTEM_NAME = "NEHTA";
    private final String CODE_SYSTEM_VERSION = "2010";
    private final String code;
    private final String descriptor;
    private final String alternativeCode;

    MedicalBenefitCategoryType(String code, String descriptor, String alternativeCode) {
        this.code = code;
        this.descriptor = descriptor;
        this.alternativeCode = alternativeCode;
    }

    public String getCode() {
        return code;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public String getAlternativeCode() {
        return alternativeCode;
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

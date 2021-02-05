package au.gov.nehta.model.cda.common.code;

public class LOINC extends CodeImpl implements Code {

    public static final String CODE_SYSTEM = "2.16.840.1.113883.6.1";
    public static final String CODE_SYSTEM_NAME = "LOINC";

    public LOINC(String code, String displayName) {
        super(code);
        setCodeSystem(CODE_SYSTEM);
        setCodeSystemName(CODE_SYSTEM_NAME);
        setDisplayName(displayName);
    }
}

package au.gov.nehta.model.cda.common.code;


public interface Code extends Coded {
    void setCode(String code);

    void addTranslation(Code code);

    void setCodeSystem(String codeSystem);

    void setCodeSystemName(String codeSystemName);

    void setDisplayName(String displayName);

    void setOriginalText(String originalText);

    void setCodeSystemVersion(String version);
}

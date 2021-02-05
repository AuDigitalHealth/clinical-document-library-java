package au.gov.nehta.model.cda.common.code;

import java.util.List;

public interface Coded {

    String HL7_CODE_SYSTEM = "Identifier Type (HL7)";

    String getCode();

    String getCodeSystem();

    String getCodeSystemName();

    String getCodeSystemVersion();

    String getDisplayName();

    String getOriginalText();

    List<Code> getTranslations();

    boolean isCoded();
}

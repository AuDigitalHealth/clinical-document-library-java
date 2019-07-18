package au.gov.nehta.model.cda.common.code;

import java.util.List;

public interface Coded  {
	public static final String HL7_CODE_SYSTEM = "Identifier Type (HL7)";
	public String getCode();
	public String getCodeSystem();
	public String getCodeSystemName();
	public String getCodeSystemVersion();
	public String getDisplayName();
	public String getOriginalText();
	public List<Code> getTranslations();
	public boolean isCoded();
	
}

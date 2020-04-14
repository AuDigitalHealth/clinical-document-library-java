package au.gov.nehta.model.cda.common.code;

public class PBSCode extends CodeImpl implements Code{
    public static final String CODE_SYSTEM = "1.2.36.1.2001.1005.22";
    public static final String CODE_SYSTEM_NAME = "Australian PBS Code";
    
    /**
     * Creates an PBS based Code element.<br>
     * 
     * Example: 
     * <pre>
     * Code amt = new PBSCode("1471K","FLUCONAZOLE");
     * <pre>
     * 
     * will produce the following Hl7 element
     * 
     * <code code="1471K" codeSystem="1.2.36.1.2001.1005.22" codeSystemName="Australian PBS Code" displayName="FLUCONAZOLE">
     * 
     * &lt;code code="1471K"
     *  codeSystem="1.2.36.1.2001.1005.22"
     *  codeSystemName="Australian PBS Code"
     *  displayName="FLUCONAZOLE"&gt;
     * 
     */
    public PBSCode(String code, String displayName){
        super(code);
        setCodeSystem( CODE_SYSTEM );
        setCodeSystemName( CODE_SYSTEM_NAME );
        setDisplayName( displayName );
    }
}

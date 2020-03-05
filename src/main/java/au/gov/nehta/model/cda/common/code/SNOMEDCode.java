package au.gov.nehta.model.cda.common.code;


public class SNOMEDCode extends CodeImpl implements Code {
    public static final String SNOMED_CODE_SYSTEM = "2.16.840.1.113883.6.96" ;
    public static final String SNOMED_CODE_SYSTEM_NAME =  "SNOMED CT" ;
   // public static final String SNOMED_CODE_SYSTEM_VERSION =  "20101130" ;
    
    private String codeSystemVersion;
    
    public SNOMEDCode(String code, String displayName){
        super(code);
        setCodeSystem( SNOMED_CODE_SYSTEM );
        setCodeSystemName( SNOMED_CODE_SYSTEM_NAME );
        setDisplayName( displayName );
    }
    
    public SNOMEDCode(String code){
        this(code, null);
    }

    public String getCodeSystemVersion() {
        return codeSystemVersion;
    }

    public void setCodeSystemVersion( String codeSystemVersion ) {
        this.codeSystemVersion = codeSystemVersion;
    }

}

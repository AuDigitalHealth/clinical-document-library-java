package au.gov.nehta.model.cda.common.code;

public class SNOMED_AU_Code extends SNOMEDCode implements Code {
    public static final String SNOMED_CODE_SYSTEM_NAME =  "SNOMED CT-AU" ;
    
    public SNOMED_AU_Code(String code, String displayName){
        super(code, displayName);
        
        //override the codesystem name to ct-au
        setCodeSystemName( SNOMED_CODE_SYSTEM_NAME );
    }
    
    public SNOMED_AU_Code(String code){
        super(code);
        
        //override the codesystem name to ct-au
        setCodeSystemName( SNOMED_CODE_SYSTEM_NAME );
    }

}

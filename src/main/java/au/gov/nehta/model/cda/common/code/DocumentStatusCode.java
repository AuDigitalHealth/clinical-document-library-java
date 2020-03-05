package au.gov.nehta.model.cda.common.code;


public class DocumentStatusCode extends CodeImpl implements Code {
    
    
    /*
     * 10.12 NCTIS: Admin Codes - Document Status
     */

    public final static String CODE_SYSTEM_NAME = "NCTIS Document Status Values";
    public final static String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.20104";
    
    public static final  DocumentStatusCode INTERIM = new DocumentStatusCode(DocumentStatus.INTERIM);
    public static final  DocumentStatusCode FINAL = new DocumentStatusCode(DocumentStatus.FINAL);
    public static final  DocumentStatusCode WITHDRAWN = new DocumentStatusCode(DocumentStatus.WITHDRAWN);
    
    
    
    public DocumentStatusCode(DocumentStatus code){
        setCodeSystem( CODE_SYSTEM );
        setCodeSystemName( CODE_SYSTEM_NAME );
        setCode( code.getCode() );
        setDisplayName( code.getDisplayName() );
    }
    
 
    
    public enum DocumentStatus{ 
        
        /*  10.12 NCTIS: Admin Codes - Document Status*/
        
            INTERIM("Interim", "I"),
            FINAL("Final","F"),
            WITHDRAWN("Withdrawn","W");
          
          
          String displayName;
          String code;
          
          DocumentStatus(String displayName, String code){
              this.displayName=displayName;
              this.code=code;
          }
          
          /**
           * @return the displayName
           */
          public String getDisplayName() {
              return displayName;
          }

          /**
           * @return the code
           */
          public String getCode() {
              return code;
          }
                   
      }


}

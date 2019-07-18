package au.gov.nehta.model.cda.common.code;


public class ResultStatusCode extends CodeImpl implements Coded {
    

    public final static String CODE_SYSTEM_NAME = "NCTIS Result Status Values";
    public final static String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16501";
    
    public static final  ResultStatusCode REGISTERED = new ResultStatusCode(ResultStatus.REGISTERED);
    public static final  ResultStatusCode INTERIM = new ResultStatusCode(ResultStatus.INTERIM);
    public static final  ResultStatusCode FINAL = new ResultStatusCode(ResultStatus.FINAL);
    public static final  ResultStatusCode AMENDED = new ResultStatusCode(ResultStatus.AMENDED);
    public static final  ResultStatusCode CANCELLED = new ResultStatusCode(ResultStatus.CANCELLED);
    
    
    
    public ResultStatusCode(ResultStatus code){
        setCodeSystem( CODE_SYSTEM );
        setCodeSystemName( CODE_SYSTEM_NAME );
        setCode( code.getCode() );
        setDisplayName( code.getDisplayName() );
    }
    
 
    
    public enum ResultStatus{ 
        REGISTERED("Registered","1"),
        INTERIM("Interim","2"),
        FINAL("Final","3"),
        AMENDED("Amended","4"),
        CANCELLED("Cancelled","5");
                
          
          String displayName;
          String code;
          
          ResultStatus(String displayName, String code){
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

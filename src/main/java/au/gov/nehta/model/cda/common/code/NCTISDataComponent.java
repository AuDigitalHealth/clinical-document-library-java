package au.gov.nehta.model.cda.common.code;

public class NCTISDataComponent extends CodeImpl implements Code {

	public static final String CODE_SYSTEM = "1.2.36.1.2001.1001.101" ;
	public static final String CODE_SYSTEM_NAME =  "NCTIS Data Components" ;
	
	
	public NCTISDataComponent(String code, String displayName){
		super(code);
		setCodeSystem( CODE_SYSTEM );
		setCodeSystemName( CODE_SYSTEM_NAME );
		setDisplayName( displayName );
	}


}

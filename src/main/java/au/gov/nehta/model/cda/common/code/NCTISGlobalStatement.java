package au.gov.nehta.model.cda.common.code;


/**
 * Specialised NCTIS code used for Exclusion statements
 * Includes some pre-canned codes for convenience
 *
 */
public class NCTISGlobalStatement extends NCTISDataComponent {

	
	
	private static final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16299";
	private static final String CODE_SYSTEM_NAME= "NCTIS Global Statement Values";
	
	
	public static final NCTISGlobalStatement NONE_KNOWN = new NCTISGlobalStatement("01", "None known");
	
	/** Provided for backwards compatibility, NotAsked should not be used as per CUP requirements **/
	public static final NCTISGlobalStatement NOT_ASKED = new NCTISGlobalStatement("02", "Not asked");
	public static final NCTISGlobalStatement NONE_SUPPLIED = new NCTISGlobalStatement("03", "None supplied");
	
	
	public NCTISGlobalStatement(String code, String displayName) {
		super(code, displayName);
		setCodeSystemName(CODE_SYSTEM_NAME);
		setCodeSystem(CODE_SYSTEM);
		
	}

}

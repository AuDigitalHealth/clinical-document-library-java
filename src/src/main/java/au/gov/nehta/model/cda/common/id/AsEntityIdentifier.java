package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface AsEntityIdentifier  extends UniqueIdentifier{
	public static final String CLASS_CODE_IDENT = "IDENT";
	public static final String PLC = "PLC";
	
	String getClassCode();
	String getAssigningAuthorityName();
	String getAssigningGeographicAreaName();
	String getAssigningGeographicAreaClassCode();
	Code getCode();

	void setRoot( String root );
	void setClassCode(String classCode);
	void setExtension( String extension );

	void setAssigningAuthorityName( String assigningAuthorityName );

	void setAssigningGeographicAreaName( String assigningGeographicAreaName );
	void setAssigningGeographicAreaClassCode( String assigningGeographicAreaClassCode);
	void setCode( Code code );
}

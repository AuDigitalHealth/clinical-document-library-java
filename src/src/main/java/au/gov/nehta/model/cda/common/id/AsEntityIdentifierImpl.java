package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

public class AsEntityIdentifierImpl extends UniqueIdentifierImpl implements AsEntityIdentifier {
    
   
    //Default values for the following fields
	private String classCode = AsEntityIdentifier.CLASS_CODE_IDENT;
	private String assigningGeographicAreaClassCode =AsEntityIdentifier.PLC;
	
	private String assigningGeographicAreaName;
	private Code code;
    

    public AsEntityIdentifierImpl() {  }
    
	public AsEntityIdentifierImpl( String root ) {
		super(root);
	}
	
	public AsEntityIdentifierImpl( String root, String extension ) {
	    super(root,extension);
    }

    @Override
    public String getClassCode() {
        return classCode;
    }

    @Override
    public String getAssigningGeographicAreaName() {
        return assigningGeographicAreaName;
    }

    @Override
    public void setAssigningGeographicAreaName( String assigningGeographicAreaName ) {
        this.assigningGeographicAreaName = assigningGeographicAreaName;
    }

    @Override
    public Code getCode() {
        return code;
    }

    @Override
    public void setCode( Code code ) {
        this.code = code;
    }

    @Override
    public String getAssigningGeographicAreaClassCode() {
        return assigningGeographicAreaClassCode;
    }

    @Override
    public void setAssigningGeographicAreaClassCode( String assigningGeographicAreaClassCode ) {
        this.assigningGeographicAreaClassCode = assigningGeographicAreaClassCode;
    }

    @Override
    public void setClassCode( String classCode ) {
        this.classCode = classCode;
    }


}

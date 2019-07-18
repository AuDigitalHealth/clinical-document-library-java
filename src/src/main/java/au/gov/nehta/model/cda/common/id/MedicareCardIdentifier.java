package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;

public class MedicareCardIdentifier extends AsEntityIdentifierImpl implements AsEntityIdentifier {
	private static final String ROOT_OID = "1.2.36.1.5001.1.0.7.1";
	private static final String IDENTIFIER_NAME = "Medicare Card Number";

	public MedicareCardIdentifier( String medicareCardNumber ) {
		ArgumentUtils.checkNotNull( medicareCardNumber, "medicareCardNumber" );
		if(medicareCardNumber.length() < 10){
		    throw new IllegalArgumentException(" Medicare card number must be at least 10 digits");
		}
		    
		    
		Code code = new CodeImpl( "MC" );
		code.setCodeSystemName( Code.HL7_CODE_SYSTEM );
		code.setCodeSystem( "2.16.840.1.113883.12.203" );

		setCode( code );
		setRoot(ROOT_OID);
		setExtension(medicareCardNumber);
		setAssigningAuthorityName( IDENTIFIER_NAME);
	}
}

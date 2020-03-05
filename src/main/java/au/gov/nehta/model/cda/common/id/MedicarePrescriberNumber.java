package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.common.utils.ArgumentUtils;

public class MedicarePrescriberNumber extends AsEntityIdentifierImpl implements AsEntityIdentifier {
    private static final String ROOT_OID = "1.2.36.174030967.0.3";
    private static final String IDENTIFIER_NAME = "Medicare Prescriber Number";

    public MedicarePrescriberNumber( String number ) {
        ArgumentUtils.checkNotNull( number, "MedicarePrescriberNumber" );
        
        if(number.length() !=  8){
            throw new IllegalArgumentException( "Prescriber Number should be 8 charachters" );
        }
        
        if(!Character.isLetter( number.charAt( 7 ))) {
            throw new IllegalArgumentException( "Prescriber Number should have an alpha character at 8th position" );
        }
        
        setRoot(ROOT_OID);
        setExtension(number);
        setAssigningAuthorityName( IDENTIFIER_NAME);
    }
}

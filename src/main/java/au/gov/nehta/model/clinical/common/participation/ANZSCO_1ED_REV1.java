package au.gov.nehta.model.clinical.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;

public class ANZSCO_1ED_REV1 extends CodeImpl implements Coded {
    public final String CODE_SYSTEM = "2.16.840.1.113883.13.62";
    
    public final String CODE_SYSTEM_NAME = "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1";
    

    public ANZSCO_1ED_REV1( String code, String displayName ) {
        ArgumentUtils.checkNotNull( code, "code" );

        setCode( code );
        setCodeSystem( CODE_SYSTEM );
        setCodeSystemName( CODE_SYSTEM_NAME );
        setDisplayName( displayName );
        
         
    }



     

}

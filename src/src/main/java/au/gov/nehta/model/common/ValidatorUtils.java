package au.gov.nehta.model.common;

import java.util.List;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;

public class ValidatorUtils {
    
    /**
     * Validate that a list of AsEntityIdentifier contains at least on IHI
     * 
     * @param entityIdentifiers AsEntityIdentifier's
     * @param fieldname the name of the field to reference in any error message
     */
    public static void atLeastOneIHI(final List<? extends AsEntityIdentifier> entityIdentifiers, String fieldname ) {
        boolean foundIHI=false;
        for(AsEntityIdentifier i : entityIdentifiers){
            if("IHI".equals( i.getAssigningAuthorityName() )){
                foundIHI=true;
                break;
            }
        }
        if(!foundIHI){
            throw new IllegalArgumentException(fieldname +" must contain at least one IHI");
        }
    }

}

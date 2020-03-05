package au.gov.nehta.builder.npdr.dispenserecord;

import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.npdr.DispenseRecordCdaModel;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseRecord;
import au.gov.nehta.model.common.ValidatorUtils;

/**
 * NPDR specific logic and validation 
 */
public class NPDRDispenseValidator {

    public static void check( DispenseRecordCdaModel cdaModel ) {
        
    }
    

    public static void check( DispenseRecord clinicalModel ) {
        
        //must have at least 1 IHI
        List<? extends AsEntityIdentifier> entityIdentifiers = clinicalModel.getContext().getSubjectOfCare().getEntityIdentifiers();
        String field = "Subject Of Care Entity Identifiers";
        ArgumentUtils.checkNotNullNorEmpty( entityIdentifiers, field  );
        ValidatorUtils.atLeastOneIHI( entityIdentifiers, field );
        
        
    }

 
}

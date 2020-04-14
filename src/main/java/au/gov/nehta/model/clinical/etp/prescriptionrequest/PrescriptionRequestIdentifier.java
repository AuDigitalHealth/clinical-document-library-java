package au.gov.nehta.model.clinical.etp.prescriptionrequest;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

public class PrescriptionRequestIdentifier extends UniqueIdentifierImpl implements UniqueIdentifier {
    public PrescriptionRequestIdentifier() {   }
    
    /**
     * A simple {@link UniqueIdentifier}
     * @param root          the root of the identifier, usually an oid value
     * @param extension     an extension of the identifier, may be null
     */
    public PrescriptionRequestIdentifier( String root, String extension ) {
        super( root, extension );
    }
}

package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipDocument;

/**
 * An object representing a CDA document being replaced 
 *
 */
public class ReplacementRelatedDocument extends RelatedDocumentImpl{

    /**
     * An object representing a CDA document being replace 
     * 
     * @param parentDocumentId this UniqueIdentifier of the document being replaced.
     * @param replacementSetID the SetID of the document being replaced, this should match the current cda setID
     * @param 
     */
    public ReplacementRelatedDocument(UniqueIdentifier parentDocumentId, UniqueIdentifier replacementSetID, int version){
        super(parentDocumentId, XActRelationshipDocument.RPLC);
        
        ArgumentUtils.checkNotNull( replacementSetID, "Replacement Document replacementSetID" );
        this.setSetId( replacementSetID );
        this.setVersionNumber( version );
        
    }
    
   
   
}

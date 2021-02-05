package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipDocument;

/**
 * An object representing a CDA document being transformed
 */
public class TransformRelatedDocument extends RelatedDocumentImpl {

    /**
     * An object representing a CDA document being transformed
     *
     * @param parentDocumentId this UniqueIdentifier of the document being transformed.
     * @param replacementSetID the SetID of the document being replaced, this should match the current cda setID
     * @param version          the version number of the document
     */
    public TransformRelatedDocument(UniqueIdentifier parentDocumentId, UniqueIdentifier replacementSetID, int version) {
        super(parentDocumentId, XActRelationshipDocument.XFRM);

//        ArgumentUtils.checkNotNull( replacementSetID, "Replacement Document replacementSetID" );
        this.setSetId(replacementSetID);
        this.setVersionNumber(version);
    }
}

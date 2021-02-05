package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipDocument;

public interface RelatedDocument {

    Code getDocumentCode();

    UniqueIdentifier getParentDocumentId();

    UniqueIdentifier getSetId();

    /**
     * @return the versionNumber
     */
    Integer getVersionNumber();

    XActRelationshipDocument getTypeCode();
}

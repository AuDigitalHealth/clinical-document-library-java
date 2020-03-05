package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipDocument;

public interface RelatedDocument {

    public Code getDocumentCode();

    public UniqueIdentifier getParentDocumentId();

    public UniqueIdentifier getSetId();

    /**
     * @return the versionNumber
     */
    public Integer getVersionNumber();

    public XActRelationshipDocument getTypeCode();

}
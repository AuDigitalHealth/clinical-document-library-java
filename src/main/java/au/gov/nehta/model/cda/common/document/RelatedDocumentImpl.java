package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipDocument;

public class RelatedDocumentImpl implements RelatedDocument {

    private Code documentCode;
    private UniqueIdentifier parentDocumentId;
    private UniqueIdentifier setId;
    private Integer versionNumber;
    private XActRelationshipDocument typeCode;

    /**
     * An object representing another HL7 Related Document
     *
     * @param parentDocumentId Represents the unique instance identifier of a clinical document. If
     * @param typeCode         HL7 v3 CDA: RelatedDocument.typeCode A conformant CDA document MAY have a single
     *                         relatedDocument with typeCode "XFRM"; a combination of two relatedDocuments with typeCodes
     *                         "XFRM"and "RPLC". No other combinations SHALL be allowed.
     * <pre>@typeCode=XFRM;</pre> the id/@root SHALL contain an implementation specific OID and id/@extension
     * SHALL contain the 'Source Record Identifier' of the original/parent document. If @typeCode=RPLC;
     * the parent/id SHALL contain the ClinicalDocument/id of the document being replaced.
     */
    public RelatedDocumentImpl(UniqueIdentifier parentDocumentId, XActRelationshipDocument typeCode) {
        ArgumentUtils.checkNotNull(typeCode, "Related Document Type Code");
        ArgumentUtils.checkNotNull(parentDocumentId, "Parent Document Id");
        this.parentDocumentId = parentDocumentId;
        this.typeCode = typeCode;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.RelatedDocument#getDocumentCode()
     */
    @Override
    public Code getDocumentCode() {
        return documentCode;
    }

    public void setDocumentCode(Code code) {
        this.documentCode = code;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.RelatedDocument#getParentDocumentId()
     */
    @Override
    public UniqueIdentifier getParentDocumentId() {
        return parentDocumentId;
    }

    /**
     * Represents the unique instance identifier of a clinical document. If @typeCode=XFRM;
     * the id/@root SHALL contain an implementation specific OID and id/@extension SHALL contain the
     * 'Source Record Identifier' of the original/parent document. If @typeCode=RPLC; the par-ent/id
     * SHALL contain the ClinicalDocument/id of the document being replaced.
     */
    public void setParentDocumentId(AsEntityIdentifier parentDocumentId) {
        this.parentDocumentId = parentDocumentId;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.RelatedDocument#getSetId()
     */
    @Override
    public UniqueIdentifier getSetId() {
        return setId;
    }

    /**
     * SetId Represents an identifier that is common across all document revisions.
     * If @typeCode=RPLC; the setId SHALL match the setId of the current document.
     */
    public void setSetId(UniqueIdentifier setId) {
        this.setId = setId;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.RelatedDocument#getVersionNumber()
     */
    @Override
    public Integer getVersionNumber() {
        return versionNumber;
    }

    /**
     * @param versionNumber the versionNumber to set
     */
    public void setVersionNumber(int versionNumber) {
        this.versionNumber = versionNumber;
    }

    /**
     * @param typeCode the typeCode to set
     */
    public void setTypeCode(XActRelationshipDocument typeCode) {
        this.typeCode = typeCode;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.RelatedDocument#getTypeCode()
     */
    @Override
    public XActRelationshipDocument getTypeCode() {
        return typeCode;
    }
}

package au.gov.nehta.model.cda.shs;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;

public class SharedHealthSummaryCDAModel extends CDAModelImpl {

    private ZonedDateTime effectiveTime;
    private ClinicalDocument clinicalDocument;

    //   private SubjectOfCareParticipant subject;

    public SharedHealthSummaryCDAModel(
            ClinicalDocument clinicalDocument,
            LegalAuthenticator legalAuthenticator,
            Custodian custodian,
            String healthCareFacilityId,
            ZonedDateTime creationTime) {
        super(null, legalAuthenticator, custodian);
        this.clinicalDocument = clinicalDocument;
        this.effectiveTime = creationTime;

        validate();
    }

    public SharedHealthSummaryCDAModel(ClinicalDocument clinicalDocument,
                                       Custodian custodian,
                                       String healthCareFacilityId,
                                       ZonedDateTime creationTime) {

        super(null, null, custodian);
        this.clinicalDocument = clinicalDocument;
        this.effectiveTime = creationTime;

        validate();
    }

    private void validate() {
        if (clinicalDocument == null) {
            throw new IllegalArgumentException("PathologyClinicalDocument missing");
        }
        if (clinicalDocument.getCompletionCode() == null) {
            throw new IllegalArgumentException("PathologyClinicalDocument is missing completion code");
        }
        if (clinicalDocument.getClinicalDocumentId() == null) {
            throw new IllegalArgumentException("PathologyClinicalDocument is missing DocumentID code");
        }
        if (clinicalDocument.getTypeId() == null) {
            throw new IllegalArgumentException("PathologyClinicalDocument is missing typeID ");
        }
        if (clinicalDocument.getTemplateIds() == null
                || clinicalDocument.getTemplateIds().size() == 0) {
            throw new IllegalArgumentException("PathologyClinicalDocument is missing templateId ");
        }

        if (effectiveTime == null) {
            throw new IllegalArgumentException("CreationTime is missing");
        }
    }

    /**
     * @return the pathClinicalDocument
     */
    public ClinicalDocument getCompletionClinicalDoucment() {
        return clinicalDocument;
    }

    @Override
    public BaseClinicalDocument getBaseClinicalDocument() {
        return clinicalDocument;
    }

    /**
     * Signifies the document creation time, when the document first came into being. Where the CDA
     * document is a transform from an original document in some other format, the Clinical-
     * Document.effectiveTime is the time the original document is created.
     */
    public ZonedDateTime getCreationTime() {
        return effectiveTime;
    }

    public void setCreationTime(ZonedDateTime authorTime) {
        this.effectiveTime = authorTime;
    }
}

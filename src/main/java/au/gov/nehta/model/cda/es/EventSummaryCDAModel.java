package au.gov.nehta.model.cda.es;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;

public class EventSummaryCDAModel extends CDAModelImpl {

    private ZonedDateTime effectiveTime;
    private ClinicalDocument clinicalDoucment;

    public EventSummaryCDAModel(
            ClinicalDocument clinicalDocument,
            ZonedDateTime creationTime) {
        this.clinicalDoucment = clinicalDocument;
        this.effectiveTime = creationTime;
        validate();
    }

    public EventSummaryCDAModel(
            ClinicalDocument clinicalDocument,
            Custodian custodian,
            String healthCareFacilityId,
            ZonedDateTime creationTime) {
        super(null, null, custodian);
        this.clinicalDoucment = clinicalDocument;
        this.effectiveTime = creationTime;

        validate();
    }

    private void validate() {
        // TODO - later
    }

    /**
     * @return the pathClinicalDocument
     */
    public ClinicalDocument getCompletionClinicalDoucment() {
        return clinicalDoucment;
    }

    @Override
    public BaseClinicalDocument getBaseClinicalDocument() {
        return clinicalDoucment;
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

package au.gov.nehta.model.cda.acd;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;

public class AdvanceCareDirectiveCDAModel extends CDAModelImpl {

    private ZonedDateTime effectiveTime;
    private ClinicalDocument clinicalDoucment;

    public AdvanceCareDirectiveCDAModel(
            ClinicalDocument clinicalDocument,
            ZonedDateTime creationTime) {
        this.clinicalDoucment = clinicalDocument;
        this.effectiveTime = creationTime;
        validate();
    }

    public AdvanceCareDirectiveCDAModel(
            ClinicalDocument clinicalDocument,
            Custodian custodian,
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
     * @return the pathClinicalDoucment
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

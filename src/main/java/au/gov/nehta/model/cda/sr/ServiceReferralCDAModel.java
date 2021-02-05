package au.gov.nehta.model.cda.sr;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;
import java.util.List;

public class ServiceReferralCDAModel extends CDAModelImpl {

    private ZonedDateTime effectiveTime;
    private ClinicalDocument clinicalDocument;

    public ServiceReferralCDAModel(
            ClinicalDocument clinicalDocument,
            ZonedDateTime creationTime) {
        this.clinicalDocument = clinicalDocument;
        this.effectiveTime = creationTime;
        validate();
    }

    public ServiceReferralCDAModel(
            ClinicalDocument clinicalDocument, List<InformationRecipient> informationRecipients,
            Custodian custodian, LegalAuthenticator legalAuthenticator,
            ZonedDateTime creationTime) {
        this.clinicalDocument = clinicalDocument;
        this.informationRecipients = informationRecipients;
        this.custodian = custodian;
        this.legalAuthenticator = legalAuthenticator;
        this.effectiveTime = creationTime;

        validate();
    }

    public ServiceReferralCDAModel(
            ClinicalDocument clinicalDocument,
            Custodian custodian,
            String healthCareFacilityId,
            ZonedDateTime creationTime) {
        super(null, null, custodian);
        this.clinicalDocument = clinicalDocument;
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

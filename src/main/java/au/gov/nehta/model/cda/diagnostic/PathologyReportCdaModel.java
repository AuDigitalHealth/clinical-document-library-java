package au.gov.nehta.model.cda.diagnostic;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;

public class PathologyReportCdaModel extends CDAModelImpl {

    private ZonedDateTime effectiveTime;
    private ClinicalDocument pathClinicalDocument;

    //   private SubjectOfCareParticipant subject;

    public PathologyReportCdaModel(ClinicalDocument clinicalDocument,
                                   LegalAuthenticator legalAuthenticator,
                                   Custodian custodian,
                                   String healthCareFacilityId,
                                   ZonedDateTime effectiveTime) {

        super(null, legalAuthenticator, custodian);
        this.pathClinicalDocument = clinicalDocument;
        this.effectiveTime = effectiveTime;

        validate();
    }

    public PathologyReportCdaModel(ClinicalDocument clinicalDocument,
                                   Custodian custodian,
                                   String healthCareFacilityId,
                                   ZonedDateTime effectiveTime) {
        super(null, null, custodian);
        this.pathClinicalDocument = clinicalDocument;
        this.effectiveTime = effectiveTime;

        validate();
    }

    private void validate() {
        if (pathClinicalDocument == null) throw new IllegalArgumentException("PathologyClinicalDocument missing");
        if (pathClinicalDocument.getCompletionCode() == null)
            throw new IllegalArgumentException("PathologyClinicalDocument is missing completion code");
        if (pathClinicalDocument.getClinicalDocumentId() == null)
            throw new IllegalArgumentException("PathologyClinicalDocument is missing DocumentID code");
        if (pathClinicalDocument.getTypeId() == null)
            throw new IllegalArgumentException("PathologyClinicalDocument is missing typeID ");
        if (pathClinicalDocument.getTemplateIds() == null || pathClinicalDocument.getTemplateIds().size() == 0)
            throw new IllegalArgumentException("PathologyClinicalDocument is missing templateId ");

        if (effectiveTime == null) throw new IllegalArgumentException("AuthorTime is missing");

    }

    /**
     * @return the pathClinicalDocument
     */
    public ClinicalDocument getCompletionClinicalDoucment() {
        return pathClinicalDocument;
    }

    @Override
    public BaseClinicalDocument getBaseClinicalDocument() {
        return (BaseClinicalDocument) pathClinicalDocument;
    }

    public ZonedDateTime getAuthorTime() {
        return effectiveTime;
    }

    public void setAuthorTime(ZonedDateTime authorTime) {
        this.effectiveTime = authorTime;
    }
}

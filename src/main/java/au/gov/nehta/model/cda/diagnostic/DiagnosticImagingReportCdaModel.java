package au.gov.nehta.model.cda.diagnostic;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;

public class DiagnosticImagingReportCdaModel extends CDAModelImpl {

    private ZonedDateTime effectiveTime;
    private ClinicalDocument diClinicalDocument;

    public DiagnosticImagingReportCdaModel(ClinicalDocument clinicalDocument,
                                           LegalAuthenticator legalAuthenticator,
                                           Custodian custodian,
                                           ZonedDateTime effectiveTime) {

        super(null, legalAuthenticator, custodian);
        this.diClinicalDocument = clinicalDocument;
        this.effectiveTime = effectiveTime;

        validate();
    }

    public DiagnosticImagingReportCdaModel(ClinicalDocument clinicalDocument, Custodian custodian,
                                           ZonedDateTime effectiveTime) {
        super(null, null, custodian);
        this.diClinicalDocument = clinicalDocument;
        this.effectiveTime = effectiveTime;

        validate();
    }

    private void validate() {
        if (diClinicalDocument == null) throw new IllegalArgumentException("DiagnosticImageClinicalDocument missing");
        if (diClinicalDocument.getCompletionCode() == null)
            throw new IllegalArgumentException("DiagnosticImageClinicalDocument is missing completion code");
        if (diClinicalDocument.getClinicalDocumentId() == null)
            throw new IllegalArgumentException("DiagnosticImageClinicalDocument is missing DocumentID code");
        if (diClinicalDocument.getTypeId() == null)
            throw new IllegalArgumentException("DiagnosticImageClinicalDocument is missing typeID ");
        if (diClinicalDocument.getTemplateIds() == null || diClinicalDocument.getTemplateIds().size() == 0)
            throw new IllegalArgumentException("DiagnosticImageClinicalDocument is missing templateId ");

        if (effectiveTime == null) throw new IllegalArgumentException("AuthorTime is missing");

    }

    /**
     * @return the pathClinicalDocument
     */
    public ClinicalDocument getDIClinicalDoucment() {
        return diClinicalDocument;
    }

    @Override
    public BaseClinicalDocument getBaseClinicalDocument() {
        return diClinicalDocument;
    }

    public ZonedDateTime getAuthorTime() {
        return effectiveTime;
    }

    public void setAuthorTime(ZonedDateTime authorTime) {
        this.effectiveTime = authorTime;
    }
}

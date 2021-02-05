package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public class DocumentDetail {

    private Coded documentType;
    private String documentTitle;
    private UniqueIdentifier documentIdentifier;

    public Coded getDocumentType() {
        return documentType;
    }

    public void setDocumentType(Coded documentType) {
        this.documentType = documentType;
    }

    public String getDocumentTitle() {
        return documentTitle;
    }

    public void setDocumentTitle(String documentTitle) {
        this.documentTitle = documentTitle;
    }

    public UniqueIdentifier getDocumentIdentifier() {
        return documentIdentifier;
    }

    public void setDocumentIdentifier(UniqueIdentifier documentIdentifier) {
        this.documentIdentifier = documentIdentifier;
    }
}

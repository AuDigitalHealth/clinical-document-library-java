package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.model.cda.common.code.DocumentStatusCode;

public interface ClinicalDocument extends BaseClinicalDocument {

    /**
     * get Document Status
     */
    public DocumentStatusCode getCompletionCode();
    
    /**
     * set Document Status
     */
    public void setCompletionCode(DocumentStatusCode  code);
}

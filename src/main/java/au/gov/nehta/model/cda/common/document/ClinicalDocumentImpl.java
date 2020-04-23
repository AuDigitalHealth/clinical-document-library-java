package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.id.TemplateId;

public class ClinicalDocumentImpl extends BaseClinicalDocumentImpl implements ClinicalDocument {
    private DocumentStatusCode completionCode;
    
    
    public ClinicalDocumentImpl( TemplateId templateId, String title ) {
        super( templateId, title );
    }
    
    
    public void setCompletionCode(DocumentStatusCode code){
        this.completionCode=code;
    }
    
    @Override
    public DocumentStatusCode getCompletionCode() {
        return completionCode;
    }

}

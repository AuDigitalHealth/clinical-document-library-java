package au.gov.nehta.model.cda.npdr;

import java.util.List;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.RelatedDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

public class PrescriptionCdaModel extends CDAModelImpl{
	
	private List<RelatedDocument> relatedDocuments;
	 
	public PrescriptionCdaModel( BaseClinicalDocument clinicalDocument, LegalAuthenticator legalAuthenticator, List<RelatedDocument> relatedDocuments, Custodian custodian 
			 ) {
	    super(clinicalDocument,legalAuthenticator,custodian);
		this.relatedDocuments=relatedDocuments;
	}

	public List<RelatedDocument> getRelatedDocuments() {
        return relatedDocuments;
    }

    public void setRelatedDocument( List<RelatedDocument> relatedDocuments ) {
        this.relatedDocuments = relatedDocuments;
    }
}

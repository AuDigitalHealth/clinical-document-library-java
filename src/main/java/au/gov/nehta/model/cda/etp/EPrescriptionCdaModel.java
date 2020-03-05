package au.gov.nehta.model.cda.etp;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

public class EPrescriptionCdaModel extends CDAModelImpl{

	private DateTime authorTime;

	public EPrescriptionCdaModel( BaseClinicalDocument clinicalDocument, LegalAuthenticator legalAuthenticator, Custodian custodian, 
			 DateTime authorTime ) {
	    super(clinicalDocument,legalAuthenticator,custodian);
		this.setAuthorTime( authorTime );
	}


	public DateTime getAuthorTime() {
        return  authorTime ;
    }


    public void setAuthorTime( DateTime authorTime ) {
        this.authorTime = authorTime ;
    }
}

package au.gov.nehta.model.cda.etp;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;

public class EPrescriptionCdaModel extends CDAModelImpl {

    private ZonedDateTime authorTime;

    public EPrescriptionCdaModel(BaseClinicalDocument clinicalDocument, LegalAuthenticator legalAuthenticator, Custodian custodian,
                                 ZonedDateTime authorTime) {
        super(clinicalDocument, legalAuthenticator, custodian);
        this.setAuthorTime(authorTime);
    }

    public ZonedDateTime getAuthorTime() {
        return authorTime;
    }

    public void setAuthorTime(ZonedDateTime authorTime) {
        this.authorTime = authorTime;
    }
}

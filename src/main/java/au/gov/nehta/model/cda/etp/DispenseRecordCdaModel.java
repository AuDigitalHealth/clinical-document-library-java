package au.gov.nehta.model.cda.etp;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

public class DispenseRecordCdaModel extends CDAModelImpl {

    public DispenseRecordCdaModel(BaseClinicalDocument clinicalDocument,
                                  LegalAuthenticator legalAuthenticator,
                                  Custodian custodian, String assignedAuthorId,
                                  String healthCareFacilityId) {
        super(clinicalDocument, legalAuthenticator, custodian);

    }

    public DispenseRecordCdaModel(BaseClinicalDocument clinicalDocument,
                                  LegalAuthenticator legalAuthenticator,
                                  Custodian custodian, String assignedAuthorId) {
        super(clinicalDocument, legalAuthenticator, custodian);
    }
}

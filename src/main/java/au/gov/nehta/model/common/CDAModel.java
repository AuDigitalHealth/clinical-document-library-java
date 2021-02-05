package au.gov.nehta.model.common;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import java.util.List;

public interface CDAModel {

    BaseClinicalDocument getBaseClinicalDocument();

    LegalAuthenticator getLegalAuthenticator();

    Custodian getCustodian();

    List<InformationRecipient> getInformationRecipients();
}
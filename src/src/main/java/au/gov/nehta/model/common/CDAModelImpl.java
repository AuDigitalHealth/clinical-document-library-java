package au.gov.nehta.model.common;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import java.util.List;

public class CDAModelImpl implements CDAModel {

  protected BaseClinicalDocument clinicalDocument;
  protected LegalAuthenticator legalAuthenticator;
  protected Custodian custodian;
  protected List<InformationRecipient> informationRecipients;

  public CDAModelImpl() {
  }

  public CDAModelImpl(BaseClinicalDocument clinicalDocument, LegalAuthenticator legalAuthenticator,
      Custodian custodian) {
    this.clinicalDocument = clinicalDocument;
    this.legalAuthenticator = legalAuthenticator;
    this.custodian = custodian;
  }

  public CDAModelImpl(BaseClinicalDocument clinicalDocument,
      LegalAuthenticator legalAuthenticator) {
    this.clinicalDocument = clinicalDocument;
    this.legalAuthenticator = legalAuthenticator;
  }

  /* (non-Javadoc)
   * @see au.gov.nehta.model.common.bCDAModel#getBaseClinicalDocument()
   */
  @Override
  public BaseClinicalDocument getBaseClinicalDocument() {
    return clinicalDocument;
  }

  /* (non-Javadoc)
   * @see au.gov.nehta.model.common.bCDAModel#getLegalAuthenticator()
   */
  @Override
  public LegalAuthenticator getLegalAuthenticator() {
    return legalAuthenticator;
  }

  public void setLegalAuthenticator(LegalAuthenticator legalAuthenticator) {
    this.legalAuthenticator = legalAuthenticator;
  }

  /* (non-Javadoc)
   * @see au.gov.nehta.model.common.bCDAModel#getCustodian()
   */
  @Override
  public Custodian getCustodian() {
    return custodian;
  }

  public void setCustodian(Custodian custodian) {
    this.custodian = custodian;
  }


  @Override
  public List<InformationRecipient> getInformationRecipients() {
    return informationRecipients;
  }

  public void setInformationRecipients(
      List<InformationRecipient> informationRecipients) {
    this.informationRecipients = informationRecipients;
  }



  public void setClinicalDocument(
      BaseClinicalDocument clinicalDocument) {
    this.clinicalDocument = clinicalDocument;
  }
}

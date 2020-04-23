package au.gov.nehta.model.cda.ds;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import au.gov.nehta.model.common.CDAModelImpl;
import java.util.List;
import org.joda.time.DateTime;

public class DischargeSummaryCDAModel extends CDAModelImpl {

  private DateTime effectiveTime;
  private ClinicalDocument clinicalDoucment;
  private boolean isVersion2;

  public DischargeSummaryCDAModel(
      ClinicalDocument clinicalDocument, List<InformationRecipient> informationRecipients,
      Custodian custodian, LegalAuthenticator legalAuthenticator,
      DateTime creationTime) {
    this.clinicalDoucment = clinicalDocument;
    this.informationRecipients = informationRecipients;
    this.custodian = custodian;
    this.legalAuthenticator = legalAuthenticator;
    this.effectiveTime = creationTime;

    validate();
  }

  public DischargeSummaryCDAModel(
      ClinicalDocument clinicalDocument,
      Custodian custodian,
      String healthCareFacilityId,
      DateTime creationTime) {
    super(null, null, custodian);
    this.clinicalDoucment = clinicalDocument;
    this.effectiveTime = creationTime;

    validate();
  }

  private void validate() {
    // TODO - later
  }

  /**
   * @return the pathClinicalDoucment
   */
  public ClinicalDocument getCompletionClinicalDoucment() {
    return clinicalDoucment;
  }

  @Override
  public BaseClinicalDocument getBaseClinicalDocument() {
    return clinicalDoucment;
  }

  /**
   * Signifies the document creation time, when the document first came into being. Where the CDA
   * document is a transform from an original document in some other format, the Clinical-
   * Document.effectiveTime is the time the original document is created.
   */
  public DateTime getCreationTime() {
    return effectiveTime;
  }

  public void setCreationTime(DateTime authorTime) {
    this.effectiveTime = authorTime;
  }

/*  public List<InformationRecipient> getInformationRecipients() {
    return informationRecipients;
  }

  public void setInformationRecipients(List<InformationRecipient> informationRecipients) {
    this.informationRecipients = informationRecipients;
  }*/

}

package au.gov.nehta.model.cda.sl;

import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.common.CDAModelImpl;
import java.util.List;
import org.joda.time.DateTime;

public class SpecialistLetterCDAModel extends CDAModelImpl {

  private DateTime effectiveTime;
  private ClinicalDocument clinicalDocument;
  private List<InformationRecipient> informationRecipients;
  private ParticipationServiceProvider referrer;
  private ParticipationServiceProvider usualGP;


  public SpecialistLetterCDAModel(
      ClinicalDocument clinicalDocument,
      List<InformationRecipient> informationRecipients,
      DateTime creationTime) {
    this.clinicalDocument = clinicalDocument;
    this.informationRecipients = informationRecipients;
    this.effectiveTime = creationTime;
  }

  /**
   * @return the pathClinicalDocument
   */
  public ClinicalDocument getCompletionClinicalDocument() {
    return clinicalDocument;
  }

  @Override
  public BaseClinicalDocument getBaseClinicalDocument() {
    return clinicalDocument;
  }

  public List<InformationRecipient> getInformationRecipients() {
    return informationRecipients;
  }

  public void setInformationRecipients(
      List<InformationRecipient> informationRecipients) {
    this.informationRecipients = informationRecipients;
  }

  public ParticipationServiceProvider getReferrer() {
    return referrer;
  }

  public void setReferrer(
      ParticipationServiceProvider referrer) {
    this.referrer = referrer;
  }


  public ParticipationServiceProvider getUsualGP() {
    return usualGP;
  }

  public void setUsualGP(
      ParticipationServiceProvider usualGP) {
    this.usualGP = usualGP;
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
}

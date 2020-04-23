package au.gov.nehta.model.cda.psml;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.common.CDAModelImpl;
import java.util.List;
import org.joda.time.DateTime;

public class PharmacistSharedMedicinesListCDAModel extends CDAModelImpl {

  private DateTime effectiveTime;
  private ClinicalDocument clinicalDocument;
  private ParticipationServiceProvider participant;

  public PharmacistSharedMedicinesListCDAModel(
      ClinicalDocument clinicalDocument,
      List<InformationRecipient> informationRecipients,
      Custodian custodian,
      ParticipationServiceProvider participant,
      DateTime creationTime) {
    this.clinicalDocument = clinicalDocument;
    this.informationRecipients = informationRecipients;
    this.custodian = custodian;
    this.participant = participant;
    this.effectiveTime = creationTime;
  }

  /**
   * @return the pathClinicalDoucment
   */
  public ClinicalDocument getCompletionClinicalDoucment() {
    return clinicalDocument;
  }

  public List<InformationRecipient> getInformationRecipients() {
    return informationRecipients;
  }

  public void setInformationRecipients(
      List<InformationRecipient> informationRecipients) {
    this.informationRecipients = informationRecipients;
  }

  public ParticipationServiceProvider getParticipant() {
    return participant;
  }

  public void setParticipant(
      ParticipationServiceProvider participant) {
    this.participant = participant;
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

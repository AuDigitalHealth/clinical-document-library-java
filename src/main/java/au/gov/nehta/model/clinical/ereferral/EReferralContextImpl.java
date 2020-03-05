package au.gov.nehta.model.clinical.ereferral;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import java.util.List;

public class EReferralContextImpl implements EReferralContext {

  private SubjectOfCareParticipant subjectOfCare;
  private PreciseDate dateTimeAuthored;
  private PreciseDate dateTimeAttested;
  private DocumentAuthor documentAuthor;
  private List<ParticipationServiceProvider> patientNominatedContacts;

  @Override
  public SubjectOfCareParticipant getSubjectOfCare() {
    return subjectOfCare;
  }

  @Override
  public void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare) {
    this.subjectOfCare = subjectOfCare;
  }

  @Override
  public PreciseDate getDateTimeAuthored() {
    return dateTimeAuthored;
  }

  @Override
  public void setDateTimeAuthored(PreciseDate dateTimeAuthored) {
    this.dateTimeAuthored = dateTimeAuthored;
  }

  @Override
  public DocumentAuthor getDocumentAuthor() {
    return documentAuthor;
  }

  @Override
  public void setDocumentAuthor(DocumentAuthor documentAuthor) {
    this.documentAuthor = documentAuthor;
  }

  @Override
  public PreciseDate getDateTimeAttested() {
    return dateTimeAttested;
  }

  @Override
  public void setDateTimeAttested(PreciseDate dateTimeAttested) {
    this.dateTimeAttested = dateTimeAttested;
  }

  @Override
  public List<ParticipationServiceProvider> getPatientNominatedContacts() {
    return patientNominatedContacts;
  }

  @Override
  public void setPatientNominatedContacts(
      List<ParticipationServiceProvider> patientNominatedContacts) {
    this.patientNominatedContacts = patientNominatedContacts;
  }
}

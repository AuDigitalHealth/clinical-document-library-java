package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import java.util.List;

public class ServiceReferralContextImpl implements ServiceReferralContext {

  private SubjectOfCareParticipant subjectOfCare;
  private DocumentAuthor documentAuthor;
  private List<RelatedDocument> relatedDocuments;
  private String documentTitle;
  private List<ParticipationServiceProvider> patientNominatedContacts;
  private ParticipationServiceProvider primaryCareGiver;
  private List<ParticipationServiceProvider> interestedParties;
  private PreciseDate dateTimeAttested;

  @Override
  public SubjectOfCareParticipant getSubjectOfCare() {
    return subjectOfCare;
  }

  @Override
  public void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare) {
    this.subjectOfCare = subjectOfCare;
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
  public List<RelatedDocument> getRelatedDocuments() {
    return relatedDocuments;
  }

  @Override
  public void setRelatedDocuments(List<RelatedDocument> relatedDocuments) {
    this.relatedDocuments = relatedDocuments;
  }

  @Override
  public String getDocumentTitle() {
    return documentTitle;
  }

  @Override
  public void setDocumentTitle(String documentTitle) {
    this.documentTitle = documentTitle;
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

  @Override
  public ParticipationServiceProvider getPrimaryCareGiver() {
    return primaryCareGiver;
  }

  @Override
  public void setPrimaryCareGiver(ParticipationServiceProvider primaryCareGiver) {
    this.primaryCareGiver = primaryCareGiver;
  }

  @Override
  public List<ParticipationServiceProvider> getInterestedParties() {
    return interestedParties;
  }

  @Override
  public void setInterestedParties(List<ParticipationServiceProvider> interestedParties) {
    this.interestedParties = interestedParties;
  }

  @Override
  public PreciseDate getDateTimeAttested() {
    return dateTimeAttested;
  }

  @Override
  public void setDateTimeAttested(PreciseDate dateTimeAttested) {
    this.dateTimeAttested = dateTimeAttested;
  }
}

package au.gov.nehta.model.clinical.sl;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public class SpecialistLetterContextImpl implements SpecialistLetterContext {

  private SubjectOfCareParticipant subjectOfCare;
  private DocumentAuthor documentAuthor;
  private PreciseDate dateTimeAuthored;
  private PreciseDate dateTimeSubjectOfCareSeen;
  private PreciseDate dateTimeAttested;
  private ParticipationServiceProvider usualGP;
  private ParticipationServiceProvider referrer;

  public SpecialistLetterContextImpl(
      SubjectOfCareParticipant subjectOfCare,
      DocumentAuthor specialistLetterAuthor,
      ParticipationServiceProvider usualGP,
      ParticipationServiceProvider referrer) {
    this.subjectOfCare = subjectOfCare;
    this.documentAuthor = specialistLetterAuthor;
    this.usualGP = usualGP;
    this.referrer = referrer;
  }

  @Override
  public SubjectOfCareParticipant getSubjectOfCare() {
    return subjectOfCare;
  }

  @Override
  public DocumentAuthor getDocumentAuthor() {
    return documentAuthor;
  }

  @Override
  public PreciseDate getDateTimeAuthored() {
    return dateTimeAuthored;
  }

  @Override
  public PreciseDate getDateTimeSubjectOfCareSeen() {
    return dateTimeSubjectOfCareSeen;
  }

  @Override
  public PreciseDate getDateTimeAttested() {
    return dateTimeAttested;
  }

  @Override
  public ParticipationServiceProvider getUsualGP() {
    return usualGP;
  }

  @Override
  public ParticipationServiceProvider getReferrer() {
    return referrer;
  }

  @Override
  public void  setSubjectOfCare(SubjectOfCareParticipant subjectOfCare) {
    this.subjectOfCare = subjectOfCare;
  }

  @Override
  public void setSpecialistLetterAuthor(
      DocumentAuthor documentAuthor) {
    this.documentAuthor = documentAuthor;
  }

  @Override
  public void setDateTimeAuthored(PreciseDate dateTimeAuthored) {
    this.dateTimeAuthored = dateTimeAuthored;
  }

  @Override
  public void setDateTimeSubjectOfCareSeen(
      PreciseDate dateTimeSubjectOfCareSeen) {
    this.dateTimeSubjectOfCareSeen = dateTimeSubjectOfCareSeen;
  }

  @Override
  public void setDateTimeAttested(PreciseDate dateTimeAttested) {
    this.dateTimeAttested = dateTimeAttested;
  }

  @Override
  public void setUsualGP(
      ParticipationServiceProvider usualGP) {
    this.usualGP = usualGP;
  }

  @Override
  public void setReferrer(
      ParticipationServiceProvider referrer) {
    this.referrer = referrer;
  }
}

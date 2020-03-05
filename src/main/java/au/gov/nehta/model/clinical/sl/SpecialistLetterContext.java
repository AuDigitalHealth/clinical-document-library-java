package au.gov.nehta.model.clinical.sl;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public interface SpecialistLetterContext {

  SubjectOfCareParticipant getSubjectOfCare();

  DocumentAuthor getDocumentAuthor();

  PreciseDate getDateTimeAuthored();

  PreciseDate getDateTimeSubjectOfCareSeen();

  PreciseDate getDateTimeAttested();

  ParticipationServiceProvider getUsualGP();

  ParticipationServiceProvider getReferrer();

  void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare);

  void setSpecialistLetterAuthor(
      DocumentAuthor documentAuthor);

  void setDateTimeAuthored(PreciseDate dateTimeAuthored);

  void setDateTimeSubjectOfCareSeen(
      PreciseDate dateTimeSubjectOfCareSeen);

  void setDateTimeAttested(PreciseDate dateTimeAttested);

  void setUsualGP(
      ParticipationServiceProvider usualGP);

  void setReferrer(
      ParticipationServiceProvider referrer);
}

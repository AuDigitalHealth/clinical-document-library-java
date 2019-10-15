package au.gov.nehta.model.clinical.ereferral;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import java.util.List;

public interface EReferralContext {

  SubjectOfCareParticipant getSubjectOfCare();

  void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare);

  PreciseDate getDateTimeAuthored();

  void setDateTimeAuthored(PreciseDate dateTimeAuthored);

  DocumentAuthor getDocumentAuthor();

  void setDocumentAuthor(DocumentAuthor documentAuthor);

  PreciseDate getDateTimeAttested();

  void setDateTimeAttested(PreciseDate dateTimeAttested);

  List<ParticipationServiceProvider> getPatientNominatedContacts();

  void setPatientNominatedContacts(List<ParticipationServiceProvider> patientNominatedContacts);
}
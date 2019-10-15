package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import java.util.List;

public interface ServiceReferralContext {

  SubjectOfCareParticipant getSubjectOfCare();

  void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare);

  DocumentAuthor getDocumentAuthor();

  void setDocumentAuthor(DocumentAuthor documentAuthor);

  List<RelatedDocument> getRelatedDocuments();

  void setRelatedDocuments(List<RelatedDocument> relatedDocuments);

  String getDocumentTitle();

  void setDocumentTitle(String documentTitle);

  List<ParticipationServiceProvider> getPatientNominatedContacts();

  void setPatientNominatedContacts(List<ParticipationServiceProvider> patientNominatedContacts);

  ParticipationServiceProvider getPrimaryCareGiver();

  void setPrimaryCareGiver(ParticipationServiceProvider primaryCareGiver);

  List<ParticipationServiceProvider> getInterestedParties();

  void setInterestedParties(List<ParticipationServiceProvider> interestedParties);

  PreciseDate getDateTimeAttested();

  void setDateTimeAttested(PreciseDate dateTimeAttested);
}

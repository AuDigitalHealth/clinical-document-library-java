package au.gov.nehta.model.clinical.acd;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public interface AdvanceCareDirectiveContext {

  DocumentAuthor getDocumentAuthor();

  void setDocumentAuthor(DocumentAuthor documentAuthor);

  SubjectOfCareParticipant getSubjectOfCare();

  void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare);

  PreciseDate getDateTimeAuthored();

  void setDateTimeAuthored(PreciseDate dateTimeAuthored);

  void setDateTimeAttested(PreciseDate dateTimeAttested);

  PreciseDate getDateTimeAttested();
}

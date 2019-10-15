package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public class EventSummaryContextImpl implements EventSummaryContext {

  private SubjectOfCareParticipant subjectOfCareParticipant;
  private DocumentAuthor documentAuthor;
  private RestrictedTimeInterval encounterPeriod;

  public EventSummaryContextImpl(
      SubjectOfCareParticipant subjectOfCareParticipant,
      DocumentAuthor documentAuthor,
      RestrictedTimeInterval encounterPeriod) {
    this.subjectOfCareParticipant = subjectOfCareParticipant;
    this.documentAuthor = documentAuthor;
    this.encounterPeriod = encounterPeriod;
  }

  @Override
  public SubjectOfCareParticipant getSubjectOfCare() {
    return subjectOfCareParticipant;
  }

  @Override
  public DocumentAuthor getDocumentAuthor() {
    return documentAuthor;
  }

  @Override
  public RestrictedTimeInterval getEncounterPeriod() {
    return encounterPeriod;
  }
}

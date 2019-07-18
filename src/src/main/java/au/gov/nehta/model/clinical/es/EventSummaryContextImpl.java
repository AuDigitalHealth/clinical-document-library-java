package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public class EventSummaryContextImpl implements EventSummaryContext {
  private SubjectOfCareParticipant subjectOfCareParticipant;
  private EventSummaryAuthor eventSummaryAuthor;
  private RestrictedTimeInterval encounterPeriod;

  public EventSummaryContextImpl(
      SubjectOfCareParticipant subjectOfCareParticipant,
      EventSummaryAuthor eventSummaryAuthor,
      RestrictedTimeInterval encounterPeriod) {
    this.subjectOfCareParticipant = subjectOfCareParticipant;
    this.eventSummaryAuthor = eventSummaryAuthor;
    this.encounterPeriod = encounterPeriod;
  }

  @Override
  public SubjectOfCareParticipant getSubjectOfCare() {
    return subjectOfCareParticipant;
  }

  @Override
  public EventSummaryAuthor getDocumentAuthor() {
    return eventSummaryAuthor;
  }

  @Override
  public RestrictedTimeInterval getEncounterPeriod() {
    return encounterPeriod;
  }
}

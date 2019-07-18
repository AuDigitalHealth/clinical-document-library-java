package au.gov.nehta.model.clinical.es;

public interface EventSummary {
    EventSummaryContext getContext();

    EventSummaryContent getContent();

  void setEventSummaryContext(
      EventSummaryContext eventSummaryContext);

  void setEventSummaryContent(
      EventSummaryContent eventSummaryContent);
}

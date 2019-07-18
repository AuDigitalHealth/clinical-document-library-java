package au.gov.nehta.model.clinical.es;

public class EventSummaryImpl implements EventSummary {
    protected EventSummaryContext eventSummaryContext;
    protected EventSummaryContent eventSummaryContent;

    @Override
    public EventSummaryContext getContext() {
        return eventSummaryContext;
    }

    @Override
    public EventSummaryContent getContent() {
        return eventSummaryContent;
    }

    @Override
    public void setEventSummaryContext(
        EventSummaryContext eventSummaryContext) {
        this.eventSummaryContext = eventSummaryContext;
    }

    @Override
    public void setEventSummaryContent(
        EventSummaryContent eventSummaryContent) {
        this.eventSummaryContent = eventSummaryContent;
    }
}

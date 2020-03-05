package au.gov.nehta.model.clinical.ds;

public interface DischargeSummary {

  DischargeSummaryContext getContext();

  void setContext(DischargeSummaryContext dischargeSummaryContext);

  DischargeSummaryContent getContent();

  void setContent(DischargeSummaryContent dischargeSummaryContent);
}

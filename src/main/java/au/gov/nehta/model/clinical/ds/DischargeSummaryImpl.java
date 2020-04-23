package au.gov.nehta.model.clinical.ds;

public class DischargeSummaryImpl implements DischargeSummary {

  private DischargeSummaryContext dischargeSummaryContext;
  private DischargeSummaryContent dischargeSummaryContent;

  @Override
  public DischargeSummaryContext getContext() {
    return dischargeSummaryContext;
  }

  @Override
  public void setContext(DischargeSummaryContext dischargeSummaryContext) {
    this.dischargeSummaryContext = dischargeSummaryContext;
  }

  @Override
  public DischargeSummaryContent getContent() {
    return dischargeSummaryContent;
  }

  @Override
  public void setContent(DischargeSummaryContent dischargeSummaryContent) {
    this.dischargeSummaryContent = dischargeSummaryContent;
  }
}

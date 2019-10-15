package au.gov.nehta.model.clinical.ereferral;

public class EReferralImpl implements EReferral {

  private EReferralContext context;
  private EReferralContent content;

  @Override
  public EReferralContext getContext() {
    return context;
  }

  @Override
  public void setContext(EReferralContext context) {
    this.context = context;
  }

  @Override
  public EReferralContent getContent() {
    return content;
  }

  @Override
  public void setContent(EReferralContent content) {
    this.content = content;
  }
}

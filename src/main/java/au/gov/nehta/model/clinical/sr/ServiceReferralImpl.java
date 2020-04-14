package au.gov.nehta.model.clinical.sr;

public class ServiceReferralImpl implements ServiceReferral {

  private ServiceReferralContext context;
  private ServiceReferralContent content;

  @Override
  public ServiceReferralContext getContext() {
    return context;
  }

  @Override
  public void setContext(ServiceReferralContext context) {
    this.context = context;
  }

  @Override
  public ServiceReferralContent getContent() {
    return content;
  }

  @Override
  public void setContent(ServiceReferralContent content) {
    this.content = content;
  }
}

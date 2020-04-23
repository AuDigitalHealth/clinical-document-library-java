package au.gov.nehta.model.clinical.sr;

public interface ServiceReferral {

  ServiceReferralContext getContext();

  void setContext(ServiceReferralContext context);

  ServiceReferralContent getContent();

  void setContent(ServiceReferralContent content);

}

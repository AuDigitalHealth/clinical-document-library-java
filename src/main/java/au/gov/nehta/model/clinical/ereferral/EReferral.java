package au.gov.nehta.model.clinical.ereferral;

public interface EReferral {

  EReferralContext getContext();

  void setContext(EReferralContext context);

  EReferralContent getContent();

  void setContent(EReferralContent content);

}

package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public class Protocol {

  private ParticipationServiceProvider serviceProvider;

  public ParticipationServiceProvider getServiceProvider() {
    return serviceProvider;
  }

  public void setServiceProvider(
      ParticipationServiceProvider serviceProvider) {
    this.serviceProvider = serviceProvider;
  }
}

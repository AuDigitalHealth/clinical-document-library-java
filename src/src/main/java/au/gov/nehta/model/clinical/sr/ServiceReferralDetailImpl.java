package au.gov.nehta.model.clinical.sr;

import java.util.List;

public class ServiceReferralDetailImpl implements ServiceReferralDetail {

  private List<RequestedService> requestedServices;
  private InterpreterRequiredAlert interpreterRequiredAlert;
  private List<OtherAlert> otherAlerts;

  @Override
  public List<RequestedService> getRequestedServices() {
    return requestedServices;
  }

  @Override
  public void setRequestedServices(List<RequestedService> requestedServices) {
    this.requestedServices = requestedServices;
  }

  @Override
  public InterpreterRequiredAlert getInterpreterRequiredAlert() {
    return interpreterRequiredAlert;
  }

  @Override
  public void setInterpreterRequiredAlert(InterpreterRequiredAlert interpreterRequiredAlert) {
    this.interpreterRequiredAlert = interpreterRequiredAlert;
  }

  @Override
  public List<OtherAlert> getOtherAlert() {
    return otherAlerts;
  }

  @Override
  public void setOtherAlert(List<OtherAlert> otherAlerts) {
    this.otherAlerts = otherAlerts;
  }
}

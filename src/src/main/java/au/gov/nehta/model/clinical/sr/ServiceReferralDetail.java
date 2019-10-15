package au.gov.nehta.model.clinical.sr;

import java.util.List;

public interface ServiceReferralDetail {

  List<RequestedService> getRequestedServices();

  void setRequestedServices(List<RequestedService> requestedServices);

  InterpreterRequiredAlert getInterpreterRequiredAlert();

  void setInterpreterRequiredAlert(InterpreterRequiredAlert interpreterRequiredAlert);

  List<OtherAlert> getOtherAlert();

  void setOtherAlert(List<OtherAlert> otherAlerts);
}

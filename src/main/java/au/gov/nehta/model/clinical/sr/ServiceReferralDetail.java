package au.gov.nehta.model.clinical.sr;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface ServiceReferralDetail {

    List<RequestedService> getRequestedServices();

    void setRequestedServices(List<RequestedService> requestedServices);

    InterpreterRequiredAlert getInterpreterRequiredAlert();

    void setInterpreterRequiredAlert(InterpreterRequiredAlert interpreterRequiredAlert);

    List<OtherAlert> getOtherAlert();

    void setOtherAlert(List<OtherAlert> otherAlerts);

    StrucDocText getCustomNarrative();

    void setCustomNarrative(StrucDocText customNarrative);
}

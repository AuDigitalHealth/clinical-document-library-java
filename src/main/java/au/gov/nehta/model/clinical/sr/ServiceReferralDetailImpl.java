package au.gov.nehta.model.clinical.sr;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class ServiceReferralDetailImpl implements ServiceReferralDetail {

    private List<RequestedService> requestedServices;
    private InterpreterRequiredAlert interpreterRequiredAlert;
    private List<OtherAlert> otherAlerts;
    private StrucDocText customNarrative;

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

    @Override
    public StrucDocText getCustomNarrative() {
        return customNarrative;
    }

    @Override
    public void setCustomNarrative(StrucDocText customNarrative) {
        this.customNarrative = customNarrative;
    }
}

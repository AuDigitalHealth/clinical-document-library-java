package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;

public interface ArrangedService {

    Coded getArrangedServiceDesc();

    RestrictedTimeInterval getServiceCommencementWindow();

    EventTypes getServiceBookingStatus();

    Protocol getProtocol();

    void setArrangedServiceDesc(Coded arrangedServiceDesc);

    void setServiceCommencementWindow(
            RestrictedTimeInterval serviceCommencementWindow);

    void setServiceBookingStatus(EventTypes serviceBookingStatus);

    void setProtocol(Protocol protocol);

    XDocumentActMood getServiceBookingStatusMoodCode();
}

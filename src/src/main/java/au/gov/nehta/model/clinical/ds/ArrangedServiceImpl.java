package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import java.util.HashMap;
import java.util.Map;

public class ArrangedServiceImpl implements ArrangedService {

  private Coded arrangedServiceDesc;
  private RestrictedTimeInterval serviceCommencementWindow;
  private EventTypes serviceBookingStatus;
  private Protocol protocol;
  private Map<EventTypes, XDocumentActMood> eventTypeMap = new HashMap<EventTypes, XDocumentActMood>() {{
    put(EventTypes.APPOINTMENT, XDocumentActMood.APT);
    put(EventTypes.APPOINTMENT_REQUEST, XDocumentActMood.ARQ);
    put(EventTypes.DEFINITION, XDocumentActMood.DEF);
    put(EventTypes.EVENT, XDocumentActMood.EVN);
    put(EventTypes.INTENT, XDocumentActMood.INT);
    put(EventTypes.PROMISE, XDocumentActMood.PRMS);
    put(EventTypes.PROPOSAL, XDocumentActMood.PRP);
    put(EventTypes.REQUEST, XDocumentActMood.RQO);
  }};

  @Override
  public Coded getArrangedServiceDesc() {
    return arrangedServiceDesc;
  }

  @Override
  public RestrictedTimeInterval getServiceCommencementWindow() {
    return serviceCommencementWindow;
  }

  @Override
  public EventTypes getServiceBookingStatus() {
    return serviceBookingStatus;
  }

  @Override
  public Protocol getProtocol() {
    return protocol;
  }

  @Override
  public void setArrangedServiceDesc(Coded arrangedServiceDesc) {
    this.arrangedServiceDesc = arrangedServiceDesc;
  }

  @Override
  public void setServiceCommencementWindow(
      RestrictedTimeInterval serviceCommencementWindow) {
    this.serviceCommencementWindow = serviceCommencementWindow;
  }

  @Override
  public void setServiceBookingStatus(EventTypes serviceBookingStatus) {
    this.serviceBookingStatus = serviceBookingStatus;
  }

  @Override
  public void setProtocol(Protocol protocol) {
    this.protocol = protocol;
  }

  @Override
  public XDocumentActMood getServiceBookingStatusMoodCode() {
    if (null != this.eventTypeMap.get(this.serviceBookingStatus)) {
      return this.eventTypeMap.get(this.serviceBookingStatus);
    }
    throw new RuntimeException(
        String.format("No valid event type found for key : %s", this.serviceBookingStatus));
  }
}

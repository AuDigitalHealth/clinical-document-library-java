package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RequestedServiceImpl implements RequestedService {

  private Coded reasonForService;
  private String reasonForServiceDesc;
  private Coded serviceCategory;
  private Coded serviceDesc;
  private Coded requestUrgency;
  private String requestUrgencyNotes;
  private RestrictedTimeInterval serviceCommencementWindow;
  private EventTypes serviceBookingStatus;
  private ParticipationServiceProvider serviceProvider;
  private RestrictedTimeInterval requestValidityPeriod;
  private PreciseDate requestedServiceDateTime;
  private PreciseDate dateTimeServiceScheduled;
  private List<String> subjectOfCareInstructionDesc;
  private StrucDocText customNarrative;

  private String serviceComment;
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
  public Coded getReasonForService() {
    return reasonForService;
  }

  @Override
  public void setReasonForService(Coded reasonForService) {
    this.reasonForService = reasonForService;
  }

  @Override
  public String getReasonForServiceDesc() {
    return reasonForServiceDesc;
  }

  @Override
  public void setReasonForServiceDesc(String reasonForServiceDesc) {
    this.reasonForServiceDesc = reasonForServiceDesc;
  }

  @Override
  public Coded getServiceCategory() {
    return serviceCategory;
  }

  @Override
  public void setServiceCategory(Coded serviceCategory) {
    this.serviceCategory = serviceCategory;
  }

  @Override
  public Coded getServiceDesc() {
    return serviceDesc;
  }

  @Override
  public void setServiceDesc(Coded serviceDesc) {
    this.serviceDesc = serviceDesc;
  }

  @Override
  public Coded getRequestUrgency() {
    return requestUrgency;
  }

  @Override
  public void setRequestUrgency(Coded requestUrgency) {
    this.requestUrgency = requestUrgency;
  }

  @Override
  public String getRequestUrgencyNotes() {
    return requestUrgencyNotes;
  }

  @Override
  public void setRequestUrgencyNotes(String requestUrgencyNotes) {
    this.requestUrgencyNotes = requestUrgencyNotes;
  }

  @Override
  public RestrictedTimeInterval getServiceCommencementWindow() {
    return serviceCommencementWindow;
  }

  @Override
  public void setServiceCommencementWindow(RestrictedTimeInterval serviceCommencementWindow) {
    this.serviceCommencementWindow = serviceCommencementWindow;
  }

  @Override
  public EventTypes getServiceBookingStatus() {
    return serviceBookingStatus;
  }

  @Override
  public void setServiceBookingStatus(EventTypes serviceBookingStatus) {
    this.serviceBookingStatus = serviceBookingStatus;
  }

  @Override
  public ParticipationServiceProvider getServiceProvider() {
    return serviceProvider;
  }

  @Override
  public void setServiceProvider(ParticipationServiceProvider serviceProvider) {
    this.serviceProvider = serviceProvider;
  }

  @Override
  public RestrictedTimeInterval getRequestValidityPeriod() {
    return requestValidityPeriod;
  }

  @Override
  public void setRequestValidityPeriod(RestrictedTimeInterval requestValidityPeriod) {
    this.requestValidityPeriod = requestValidityPeriod;
  }

  @Override
  public PreciseDate getRequestedServiceDateTime() {
    return requestedServiceDateTime;
  }

  @Override
  public void setRequestedServiceDateTime(PreciseDate requestedServiceDateTime) {
    this.requestedServiceDateTime = requestedServiceDateTime;
  }

  @Override
  public String getServiceComment() {
    return serviceComment;
  }

  @Override
  public void setServiceComment(String serviceComment) {
    this.serviceComment = serviceComment;
  }

  @Override
  public XDocumentActMood getServiceBookingStatusMoodCode() {
    if (null != this.eventTypeMap.get(this.serviceBookingStatus)) {
      return this.eventTypeMap.get(this.serviceBookingStatus);
    }
    throw new RuntimeException(
        String.format("No valid event type found for key : %s", this.serviceBookingStatus));
  }

  @Override
  public PreciseDate getDateTimeServiceScheduled() {
    return dateTimeServiceScheduled;
  }

  @Override
  public void setDateTimeServiceScheduled(PreciseDate dateTimeServiceScheduled) {
    this.dateTimeServiceScheduled = dateTimeServiceScheduled;
  }

  @Override
  public void setSubjectOfCareInstructionDesc(List<String> subjectOfCareInstructionDesc) {
    this.subjectOfCareInstructionDesc = subjectOfCareInstructionDesc;
  }

  @Override
  public List<String> getSubjectOfCareInstructionDesc() {
    return subjectOfCareInstructionDesc;
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

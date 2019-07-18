package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class RequestedServiceImpl implements RequestedService {

  private Coded requestedServiceDescription;
  private PreciseDate serviceScheduled;
  private RestrictedTimeInterval serviceCommencementWindow;
  private EventTypes serviceBookingStatus;
  private String subjectOfCareInstructionDesc;
  private PreciseDate requestedServiceDateTime;
  private ParticipationServiceProvider participant;
  private RestrictedTimeInterval requestValidityPeriod;
  private PreciseDate requestedDateTime;

  @Override
  public Coded getRequestedServiceDescription() {
    return requestedServiceDescription;
  }

  @Override
  public void setRequestedServiceDescription(
      Coded requestedServiceDescription) {
    this.requestedServiceDescription = requestedServiceDescription;
  }

  @Override
  public PreciseDate getServiceScheduled() {
    return serviceScheduled;
  }

  @Override
  public void setServiceScheduled(PreciseDate serviceScheduled) {
    this.serviceScheduled = serviceScheduled;
  }

  @Override
  public RestrictedTimeInterval getServiceCommencementWindow() {
    return serviceCommencementWindow;
  }

  @Override
  public void setServiceCommencementWindow(
      RestrictedTimeInterval serviceCommencementWindow) {
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
  public String getSubjectOfCareInstructionDesc() {
    return subjectOfCareInstructionDesc;
  }

  @Override
  public void setSubjectOfCareInstructionDesc(String subjectOfCareInstructionDesc) {
    this.subjectOfCareInstructionDesc = subjectOfCareInstructionDesc;
  }

  @Override
  public PreciseDate getRequestedServiceDateTime() {
    return requestedServiceDateTime;
  }

  @Override
  public void setRequestedServiceDateTime(
      PreciseDate requestedServiceDateTime) {
    this.requestedServiceDateTime = requestedServiceDateTime;
  }

  @Override
  public ParticipationServiceProvider getParticipant() {
    return participant;
  }

  @Override
  public void setParticipant(
      ParticipationServiceProvider participant) {
    this.participant = participant;
  }

  @Override
  public RestrictedTimeInterval getRequestValidityPeriod() {
    return requestValidityPeriod;
  }

  @Override
  public void setRequestValidityPeriod(
      RestrictedTimeInterval requestValidityPeriod) {
    this.requestValidityPeriod = requestValidityPeriod;
  }

  @Override
  public PreciseDate getRequestedDateTime() {
    return requestedDateTime;
  }

  @Override
  public StrucDocText getCustomNarrativeRequestedService() {
    return null;
  }

  @Override
  public void setRequestedDateTime(PreciseDate requestedDateTime) {
    this.requestedDateTime = requestedDateTime;
  }

  @Override
  public void setCustomNarrativeRequestedService(StrucDocText customNarrative) {

  }
}

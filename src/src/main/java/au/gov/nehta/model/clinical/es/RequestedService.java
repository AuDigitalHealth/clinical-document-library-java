package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface RequestedService {

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);

  Coded getRequestedServiceDescription();

  PreciseDate getServiceScheduled();

  RestrictedTimeInterval getServiceCommencementWindow();

  EventTypes getServiceBookingStatus();

  String getSubjectOfCareInstructionDesc();

  PreciseDate getRequestedServiceDateTime();

  ParticipationServiceProvider getParticipant();

  RestrictedTimeInterval getRequestValidityPeriod();

  PreciseDate getRequestedDateTime();

  void setRequestedServiceDescription(
      Coded requestedServiceDescription);

  void setServiceScheduled(PreciseDate serviceScheduled);

  void setServiceCommencementWindow(
      RestrictedTimeInterval serviceCommencementWindow);

  void setServiceBookingStatus(EventTypes serviceBookingStatus);

  void setSubjectOfCareInstructionDesc(String subjectOfCareInstructionDesc);

  void setRequestedServiceDateTime(
      PreciseDate requestedServiceDateTime);

  void setParticipant(
      ParticipationServiceProvider participant);

  void setRequestValidityPeriod(
      RestrictedTimeInterval requestValidityPeriod);

  void setRequestedDateTime(PreciseDate requestedDateTime);

  String getServiceComment();

  void setServiceComment(String serviceComment);

}

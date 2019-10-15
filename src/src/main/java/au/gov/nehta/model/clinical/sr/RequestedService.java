package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import java.util.List;

public interface RequestedService {

  Coded getReasonForService();

  void setReasonForService(Coded reasonForService);

  String getReasonForServiceDesc();

  void setReasonForServiceDesc(String reasonForServiceDesc);

  Coded getServiceCategory();

  void setServiceCategory(Coded serviceCategory);

  Coded getServiceDesc();

  void setServiceDesc(Coded serviceDesc);

  Coded getRequestUrgency();

  void setRequestUrgency(Coded requestUrgency);

  String getRequestUrgencyNotes();

  void setRequestUrgencyNotes(String requestUrgencyNotes);

  RestrictedTimeInterval getServiceCommencementWindow();

  void setServiceCommencementWindow(RestrictedTimeInterval serviceCommencementWindow);

  EventTypes getServiceBookingStatus();

  void setServiceBookingStatus(EventTypes serviceBookingStatus);

  ParticipationServiceProvider getServiceProvider();

  void setServiceProvider(ParticipationServiceProvider serviceProvider);

  RestrictedTimeInterval getRequestValidityPeriod();

  void setRequestValidityPeriod(RestrictedTimeInterval requestValidityPeriod);

  PreciseDate getRequestedServiceDateTime();

  void setRequestedServiceDateTime(PreciseDate requestedServiceDateTime);

  String getServiceComment();

  void setServiceComment(String serviceComment);

  XDocumentActMood getServiceBookingStatusMoodCode();

  PreciseDate getDateTimeServiceScheduled();

  void setDateTimeServiceScheduled(PreciseDate dateTimeServiceScheduled);

  void setSubjectOfCareInstructionDesc(List<String> subjectOfCareInstructionDesc);

  List<String> getSubjectOfCareInstructionDesc();

}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface PathologyTestResult {

  Coded getTestResultName();

  void setTestResultName(Coded testResultName);

  DiagnosticServiceSectionID getDiagnosticService();

  void setDiagnosticService(DiagnosticServiceSectionID diagnosticService);

  List<TestSpecimenDetail> getTestSpecimenDetails();

  void setTestSpecimenDetails(List<TestSpecimenDetail> testSpecimenDetails);

  Coded getOverallPathologyTestResultStatus();

  void setOverallPathologyTestResultStatus(Coded overallPathologyTestResultStatus);

  String getClinicalInformationProvided();

  void setClinicalInformationProvided(String clinicalInformationProvided);

  List<ResultGroup> getResultGroups();

  void setResultGroups(List<ResultGroup> resultGroups);

  List<Coded> getPathologicalDiagnoses();

  void setPathologicalDiagnoses(List<Coded> pathologicalDiagnoses);

  String getConclusion();

  void setConclusion(String conclusion);

  AttachedMedia getTestResultRepresentation();

  void setTestResultRepresentation(AttachedMedia testResultRepresentation);

  String getTestComment();

  void setTestComment(String testComment);

  TestRequestDetails getTestRequestDetails();

  void setTestRequestDetails(TestRequestDetails testRequestDetails);

  //Observation DateTime also known as Test Result DateTime in SpecialistLetter
  PreciseDate getObservationDateTime();

  void setObservationDateTime(PreciseDate observationDateTime);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);

  Class getExecutingClass();

  void setExecutingClass(Class executingClass);
}

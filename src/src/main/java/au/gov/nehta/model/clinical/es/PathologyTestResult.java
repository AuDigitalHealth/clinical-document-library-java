package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

import java.util.List;

public interface PathologyTestResult {

  //TODO Missing XPreNarrative as per .net

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

  PreciseDate getObservationDateTime();

  void setObservationDateTime(PreciseDate observationDateTime);

  //TODO Missing CustomNarrativePathologyTestResult as per.net
}

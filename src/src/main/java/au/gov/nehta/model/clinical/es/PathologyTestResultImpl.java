package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

import java.util.List;

public class PathologyTestResultImpl implements PathologyTestResult {
  private Coded testResultName;
  private DiagnosticServiceSectionID diagnosticService;
  private List<TestSpecimenDetail> testSpecimenDetails;
  private Coded overallPathologyTestResultStatus;
  private String clinicalInformationProvided;
  private List<ResultGroup> resultGroups;
  private List<Coded> pathologicalDiagnoses;
  private String conclusion;
  private AttachedMedia testResultRepresentation;
  private String testComment;
  private TestRequestDetails testRequestDetails;
  private PreciseDate observationDateTime;

  @Override
  public Coded getTestResultName() {
    return testResultName;
  }

  @Override
  public void setTestResultName(Coded testResultName) {
    this.testResultName = testResultName;
  }

  @Override
  public DiagnosticServiceSectionID getDiagnosticService() {
    return diagnosticService;
  }

  @Override
  public void setDiagnosticService(DiagnosticServiceSectionID diagnosticService) {
    this.diagnosticService = diagnosticService;
  }

  @Override
  public List<TestSpecimenDetail> getTestSpecimenDetails() {
    return testSpecimenDetails;
  }

  @Override
  public void setTestSpecimenDetails(List<TestSpecimenDetail> testSpecimenDetails) {
    this.testSpecimenDetails = testSpecimenDetails;
  }

  @Override
  public Coded getOverallPathologyTestResultStatus() {
    return overallPathologyTestResultStatus;
  }

  @Override
  public void setOverallPathologyTestResultStatus(Coded overallPathologyTestResultStatus) {
    this.overallPathologyTestResultStatus = overallPathologyTestResultStatus;
  }

  @Override
  public String getClinicalInformationProvided() {
    return clinicalInformationProvided;
  }

  @Override
  public void setClinicalInformationProvided(String clinicalInformationProvided) {
    this.clinicalInformationProvided = clinicalInformationProvided;
  }

  @Override
  public List<ResultGroup> getResultGroups() {
    return resultGroups;
  }

  @Override
  public void setResultGroups(List<ResultGroup> resultGroups) {
    this.resultGroups = resultGroups;
  }

  @Override
  public List<Coded> getPathologicalDiagnoses() {
    return pathologicalDiagnoses;
  }

  @Override
  public void setPathologicalDiagnoses(List<Coded> pathologicalDiagnoses) {
    this.pathologicalDiagnoses = pathologicalDiagnoses;
  }

  @Override
  public String getConclusion() {
    return conclusion;
  }

  @Override
  public void setConclusion(String conclusion) {
    this.conclusion = conclusion;
  }

  @Override
  public AttachedMedia getTestResultRepresentation() {
    return testResultRepresentation;
  }

  @Override
  public void setTestResultRepresentation(AttachedMedia testResultRepresentation) {
    this.testResultRepresentation = testResultRepresentation;
  }

  @Override
  public String getTestComment() {
    return testComment;
  }

  @Override
  public void setTestComment(String testComment) {
    this.testComment = testComment;
  }

  @Override
  public TestRequestDetails getTestRequestDetails() {
    return testRequestDetails;
  }

  @Override
  public void setTestRequestDetails(TestRequestDetails testRequestDetails) {
    this.testRequestDetails = testRequestDetails;
  }

  @Override
  public PreciseDate getObservationDateTime() {
    return observationDateTime;
  }

  @Override
  public void setObservationDateTime(PreciseDate observationDateTime) {
    this.observationDateTime = observationDateTime;
  }
}

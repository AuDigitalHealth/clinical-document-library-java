package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class DiagnosticInvestigationsImpl implements DiagnosticInvestigations {

  private List<PathologyTestResult> pathologyTestResults;
  private List<ImagingExaminationResult> imagingExaminationResults;
  private List<RequestedService> requestedServices;
  private StrucDocText customNarrativeDiagnosticInvestigations;
  private List<OtherTestResult> otherTestResults;


  @Override
  public List<PathologyTestResult> getPathologyTestResults() {
    return pathologyTestResults;
  }

  @Override
  public List<ImagingExaminationResult> getImagingExaminationResults() {
    return imagingExaminationResults;
  }

  @Override
  public List<RequestedService> getRequestedServices() {
    return requestedServices;
  }

  @Override
  public StrucDocText getCustomNarrativeDiagnosticInvestigations() {
    return customNarrativeDiagnosticInvestigations;
  }

  @Override
  public List<OtherTestResult> getOtherTestResults() {
    return otherTestResults;
  }

  @Override
  public void setOtherTestResults(List<OtherTestResult> otherTestResults) {
    this.otherTestResults = otherTestResults;
  }


  @Override
  public void setPathologyTestResults(List<PathologyTestResult> pathologyTestResults) {
    this.pathologyTestResults = pathologyTestResults;
  }

  @Override
  public void setImagingExaminationResults(
      List<ImagingExaminationResult> imagingExaminationResults) {
    this.imagingExaminationResults = imagingExaminationResults;
  }

  @Override
  public void setRequestedServices(List<RequestedService> requestedServices) {
    this.requestedServices = requestedServices;
  }

  @Override
  public void customNarrativeDiagnosticInvestigations(
      StrucDocText customNarrativeDiagnosticInvestigations) {
    this.customNarrativeDiagnosticInvestigations = customNarrativeDiagnosticInvestigations;
  }
}

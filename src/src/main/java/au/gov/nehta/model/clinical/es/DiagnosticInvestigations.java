package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface DiagnosticInvestigations {
  List<PathologyTestResult> getPathologyTestResults();

  List<ImagingExaminationResult> getImagingExaminationResults();

  List<RequestedService> getRequestedServices();

  StrucDocText getCustomNarrativeDiagnosticInvestigations();

  List<OtherTestResult> getOtherTestResults();

  void setOtherTestResults(
      List<OtherTestResult> otherTestResults);

  void setPathologyTestResults(
      List<PathologyTestResult> pathologyTestResults);

  void setImagingExaminationResults(
      List<ImagingExaminationResult> imagingExaminationResults);

  void setRequestedServices(
          List<RequestedService> requestedServices);

  void customNarrativeDiagnosticInvestigations(StrucDocText customNarrativeDiagnosticInvestigations);


  //TODO Missing Validation
}

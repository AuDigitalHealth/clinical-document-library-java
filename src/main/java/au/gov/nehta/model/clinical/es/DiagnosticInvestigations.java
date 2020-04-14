package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface DiagnosticInvestigations {

  List<PathologyTestResult> getPathologyTestResults();

  List<ImagingExaminationResult> getImagingExaminationResults();

  List<RequestedService> getRequestedServices();

  StrucDocText getCustomNarrative();

  List<OtherTestResult> getOtherTestResults();

  void setOtherTestResults(List<OtherTestResult> otherTestResults);

  void setPathologyTestResults(List<PathologyTestResult> pathologyTestResults);

  void setImagingExaminationResults(List<ImagingExaminationResult> imagingExaminationResults);

  void setRequestedServices(List<RequestedService> requestedServices);

  void setCustomNarrative(StrucDocText customNarrative);

  /**
   * Method allows users to specify custom-narrative for Pathology section System will however first
   * check for {@link List}<{@link PathologyTestResult}> to be not-null and then only will process
   * custom-narrative as a section within Diagnostic Investigations (None of these are mandatory)
   */
  DiagnosticInvestigations addPathologySectionAsNarrative(StrucDocText narrative);

  /**
   * Method allows users to specify custom-narrative for Imaging Examination section System will
   * however first check for {@link List}<{@link ImagingExaminationResult}> to be not-null and then
   * only will process custom-narrative as a section within Diagnostic Investigations (None of these
   * are mandatory)
   */
  DiagnosticInvestigations addImagingExaminationSectionAsNarrative(StrucDocText narrative);

  /**
   * Method allows users to specify custom-narrative for Requested Services section. System will
   * however first check for {@link List}<{@link RequestedService}> to be not-null and then only
   * will process custom-narrative as a section within Diagnostic Investigations (None of these are
   * mandatory)
   */
  DiagnosticInvestigations addRequestedServicesSectionAsNarrative(StrucDocText narrative);

  /**
   * Method allows users to specify custom-narrative for Other test results section. System will
   * however first check for {@link List}<{@link OtherTestResult}> to be not-null and then only will
   * process custom-narrative as a section within Diagnostic Investigations (None of these are
   * mandatory)
   */
  DiagnosticInvestigations addOtherTestResultsAsNarrative(StrucDocText narrative);

  StrucDocText getPathologyCustomNarrative();

  StrucDocText getImagingExaminationResultCustomNarrative();

  StrucDocText getRequestedServicesCustomNarrative();

  StrucDocText getOtherTestResultsCustomNarrative();

  List<au.gov.nehta.model.clinical.sr.RequestedService> getRequestedServicesServiceReferral();

  void setRequestedServicesServiceReferral(
      List<au.gov.nehta.model.clinical.sr.RequestedService> requestedServicesServiceReferral);
}

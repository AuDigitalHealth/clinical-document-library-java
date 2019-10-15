package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class DiagnosticInvestigationsImpl implements DiagnosticInvestigations {

  private List<PathologyTestResult> pathologyTestResults;
  private List<ImagingExaminationResult> imagingExaminationResults;
  private List<RequestedService> requestedServices;
  private List<OtherTestResult> otherTestResults;
  private StrucDocText customNarrative;
  private StrucDocText pathologyCustomNarrative;
  private StrucDocText imagingExaminationResultCustomNarrative;
  private StrucDocText requestedServicesCustomNarrative;
  private StrucDocText otherTestResultsCustomNarrative;
  private List<au.gov.nehta.model.clinical.sr.RequestedService> requestedServiceServiceReferral;

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
  public StrucDocText getCustomNarrative() {
    return customNarrative;
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
  public void setCustomNarrative(
      StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

  @Override
  public DiagnosticInvestigations addPathologySectionAsNarrative(StrucDocText narrative) {
    this.pathologyCustomNarrative = narrative;
    return this;
  }

  @Override
  public DiagnosticInvestigations addImagingExaminationSectionAsNarrative(StrucDocText narrative) {
    this.imagingExaminationResultCustomNarrative = narrative;
    return this;
  }

  @Override
  public DiagnosticInvestigations addRequestedServicesSectionAsNarrative(StrucDocText narrative) {
    this.requestedServicesCustomNarrative = narrative;
    return this;
  }

  @Override
  public DiagnosticInvestigations addOtherTestResultsAsNarrative(StrucDocText narrative) {
    this.otherTestResultsCustomNarrative = narrative;
    return this;
  }

  @Override
  public StrucDocText getPathologyCustomNarrative() {
    return pathologyCustomNarrative;
  }

  @Override
  public StrucDocText getImagingExaminationResultCustomNarrative() {
    return imagingExaminationResultCustomNarrative;
  }

  @Override
  public StrucDocText getRequestedServicesCustomNarrative() {
    return requestedServicesCustomNarrative;
  }

  @Override
  public StrucDocText getOtherTestResultsCustomNarrative() {
    return otherTestResultsCustomNarrative;
  }

  @Override
  public List<au.gov.nehta.model.clinical.sr.RequestedService> getRequestedServicesServiceReferral() {
    return requestedServiceServiceReferral;
  }

  @Override
  public void setRequestedServicesServiceReferral(
      List<au.gov.nehta.model.clinical.sr.RequestedService> requestedServicesServiceReferral) {
    this.requestedServiceServiceReferral = requestedServicesServiceReferral;
  }
}

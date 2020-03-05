package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class ImagingExaminationResultImpl implements ImagingExaminationResult {

  private Coded imagingExaminationResultName;
  private Coded imagingModality;
  private List<AnatomicalSite> anatomicalSites;
  private Coded imagingExaminationResultStatus;
  private String clinicalInformationProvided;
  private String findings;
  private List<ImagingExaminationResultGroup> resultGroups;
  private String examinationResultRepresentation;
  private List<ExaminationRequestDetails> examinationRequestDetails;
  private PreciseDate observationDateTime;
  private StrucDocText customNarrative;

  @Override
  public Coded getImagingExaminationResultName() {
    return imagingExaminationResultName;
  }

  @Override
  public void setImagingExaminationResultName(
      Coded imagingExaminationResultName) {
    this.imagingExaminationResultName = imagingExaminationResultName;
  }

  @Override
  public Coded getImagingModality() {
    return imagingModality;
  }

  @Override
  public void setImagingModality(Coded imagingModality) {
    this.imagingModality = imagingModality;
  }

  @Override
  public List<AnatomicalSite> getAnatomicalSites() {
    return anatomicalSites;
  }

  @Override
  public void setAnatomicalSites(
      List<AnatomicalSite> anatomicalSites) {
    this.anatomicalSites = anatomicalSites;
  }

  @Override
  public Coded getImagingExaminationResultStatus() {
    return imagingExaminationResultStatus;
  }

  @Override
  public void setImagingExaminationResultStatus(
      Coded imagingExaminationResultStatus) {
    this.imagingExaminationResultStatus = imagingExaminationResultStatus;
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
  public String getFindings() {
    return findings;
  }

  @Override
  public void setFindings(String findings) {
    this.findings = findings;
  }

  @Override
  public List<ImagingExaminationResultGroup> getResultGroups() {
    return resultGroups;
  }

  @Override
  public String getExaminationResultRepresentation() {
    return examinationResultRepresentation;
  }

  @Override
  public void setExaminationResultRepresentation(
      String examinationResultRepresentation) {
    this.examinationResultRepresentation = examinationResultRepresentation;
  }

  @Override
  public List<ExaminationRequestDetails> getExaminationRequestDetails() {
    return examinationRequestDetails;
  }

  @Override
  public void setExaminationRequestDetails(
      List<ExaminationRequestDetails> examinationRequestDetails) {
    this.examinationRequestDetails = examinationRequestDetails;
  }

  @Override
  public PreciseDate getObservationDateTime() {
    return observationDateTime;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return this.customNarrative;
  }

  @Override
  public void setObservationDateTime(PreciseDate observationDateTime) {
    this.observationDateTime = observationDateTime;
  }

  @Override
  public void setCustomNarrative(
      StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

  @Override
  public void setResultGroups(
      List<ImagingExaminationResultGroup> resultGroups) {
    this.resultGroups = resultGroups;
  }
}

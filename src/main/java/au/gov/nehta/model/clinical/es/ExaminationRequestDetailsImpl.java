package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.util.List;

public class ExaminationRequestDetailsImpl implements ExaminationRequestDetails {

  private List<String> examinationRequestedNames;
  private UniqueIdentifier seriesIdentifier;
  private UniqueIdentifier reportIdentifier;
  private List<ImageDetails> imageDetails;
  private PreciseDate observationDateTime;

  @Override
  public List<String> getExaminationRequestedNames() {
    return examinationRequestedNames;
  }

  @Override
  public void setExaminationRequestedNames(List<String> examinationRequestedNames) {
    this.examinationRequestedNames = examinationRequestedNames;
  }

  @Override
  public UniqueIdentifier getSeriesIdentifier() {
    return seriesIdentifier;
  }

  @Override
  public void setSeriesIdentifier(
      UniqueIdentifier seriesIdentifier) {
    this.seriesIdentifier = seriesIdentifier;
  }

  @Override
  public UniqueIdentifier getReportIdentifier() {
    return reportIdentifier;
  }

  @Override
  public void setReportIdentifier(
      UniqueIdentifier reportIdentifier) {
    this.reportIdentifier = reportIdentifier;
  }

  @Override
  public List<ImageDetails> getImageDetails() {
    return imageDetails;
  }

  @Override
  public void setImageDetails(List<ImageDetails> imageDetails) {
    this.imageDetails = imageDetails;
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

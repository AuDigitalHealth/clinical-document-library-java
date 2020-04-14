package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

public class ImagingExaminationResultGroupImpl implements ImagingExaminationResultGroup {

  private Coded imagingExaminationResultGroupName;
  private List<ImagingResult> results;
  private AnatomicalSite anatomicalSite;

  @Override
  public Coded getImagingExaminationResultGroupName() {
    return imagingExaminationResultGroupName;
  }

  @Override
  public void setImagingExaminationResultGroupName(
      Coded imagingExaminationResultGroupName) {
    this.imagingExaminationResultGroupName = imagingExaminationResultGroupName;
  }

  @Override
  public List<ImagingResult> getResults() {
    return results;
  }

  @Override
  public void setResults(List<ImagingResult> results) {
    this.results = results;
  }

  @Override
  public AnatomicalSite getAnatomicalSite() {
    return anatomicalSite;
  }

  @Override
  public void setAnatomicalSite(AnatomicalSite anatomicalSite) {
    this.anatomicalSite = anatomicalSite;
  }
}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

import java.util.List;

public class ImagingResultImpl implements ImagingResult {

  private Coded individualImagingExaminationResultName;
  private ResultValue individualImagingExaminationResultValue;
  private List<String> resultComments;


  @Override
  public Coded getIndividualImagingExaminationResultName() {
    return individualImagingExaminationResultName;
  }

  @Override
  public ResultValue getIndividualImagingExaminationResultValue() {
    return individualImagingExaminationResultValue;
  }

  @Override
  public List<String> getResultComments() {
    return resultComments;
  }

  @Override
  public void setIndividualImagingExaminationResultName(Coded individualImagingExaminationResultName) {
    this.individualImagingExaminationResultName = individualImagingExaminationResultName;
  }

  @Override
  public void setIndividualImagingExaminationResultValue(ResultValue individualImagingIExaminationResultValue) {
    this.individualImagingExaminationResultValue = individualImagingIExaminationResultValue;
  }

  @Override
  public void setResultComment(List<String> resultComments) {
    this.resultComments = resultComments;
  }
}

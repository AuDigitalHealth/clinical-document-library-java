package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

import java.util.List;

/*
 * (Result Group) INDIVIDUAL IMAGING EXAMINATION RESULT GROUP
 **/
public interface ImagingResult {
    Coded getIndividualImagingExaminationResultName();

    ResultValue getIndividualImagingExaminationResultValue();

    List<String> getResultComments();

    void setIndividualImagingExaminationResultName(
        Coded individualImagingExaminationResultName);

    void setIndividualImagingExaminationResultValue(
        ResultValue individualImagingIExaminationResultValue);

    void setResultComment(List<String> resultComments);
}

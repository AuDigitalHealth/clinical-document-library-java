package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

/*
 * IMAGING EXAMINATION RESULT GROUP
 * */
public interface ImagingExaminationResultGroup {
    Coded getImagingExaminationResultGroupName();

    List<ImagingResult> getResults();

    AnatomicalSite getAnatomicalSite();

    void setImagingExaminationResultGroupName(
        Coded imagingExaminationResultGroupName);

    void setResults(List<ImagingResult> results);

    void setAnatomicalSite(AnatomicalSite anatomicalSite);

}

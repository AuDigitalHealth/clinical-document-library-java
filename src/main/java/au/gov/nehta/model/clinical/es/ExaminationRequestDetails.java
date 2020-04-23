package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import java.util.List;

/*
 * EXAMINATION REQUEST DETAILS
 */
public interface ExaminationRequestDetails {

  void setExaminationRequestedNames(List<String> examinationRequestedNames);

  void setSeriesIdentifier(
      UniqueIdentifier seriesIdentifier);

  void setReportIdentifier(
      UniqueIdentifier reportIdentifier);

  void setImageDetails(List<ImageDetails> imageDetails);

  void setObservationDateTime(PreciseDate observationDateTime);

  List<String> getExaminationRequestedNames();

  /*DICOM Identifier*/
  UniqueIdentifier getSeriesIdentifier();

  UniqueIdentifier getReportIdentifier();

  List<ImageDetails> getImageDetails();

  PreciseDate getObservationDateTime();

}

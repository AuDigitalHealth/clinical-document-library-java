package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.util.List;

public interface ImagingExaminationResult {
    Coded getImagingExaminationResultName();

    Coded getImagingModality();

    List<AnatomicalSite> getAnatomicalSites();

    Coded getImagingExaminationResultStatus();

    String getClinicalInformationProvided();

    String getFindings();

    List<ImagingExaminationResultGroup> getResultGroups();

    String getExaminationResultRepresentation();

    List<ExaminationRequestDetails> getExaminationRequestDetails();

    //Observation DateTime also known as Result DateTime in SpecialistLetter
    PreciseDate getObservationDateTime();

    StrucDocText getCustomNarrative();

    void setImagingExaminationResultName(
        Coded imagingExaminationResultName);

    void setImagingModality(Coded imagingModality);

    void setAnatomicalSites(
        List<AnatomicalSite> anatomicalSites);

    void setImagingExaminationResultStatus(
        Coded imagingExaminationResultStatus);

    void setClinicalInformationProvided(String clinicalInformationProvided);

    void setFindings(String findings);

    void setResultGroups(
        List<ImagingExaminationResultGroup> resultGroups);

    void setExaminationResultRepresentation(
        String examinationResultRepresentation);

    void setExaminationRequestDetails(
        List<ExaminationRequestDetails> examinationRequestDetails);

    void setObservationDateTime(PreciseDate observationDateTime);

    void setCustomNarrative(StrucDocText customNarrative);
}

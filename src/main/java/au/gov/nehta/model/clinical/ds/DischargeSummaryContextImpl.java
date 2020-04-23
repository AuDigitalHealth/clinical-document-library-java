package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public class DischargeSummaryContextImpl implements DischargeSummaryContext {

  private DocumentAuthor documentAuthor;
  private SubjectOfCareParticipant subjectOfCareParticipant;
  private ParticipationServiceProvider facility;
  private RestrictedTimeInterval encounterPeriod;
  private PreciseDate dateTimeAttested;
  private String careSetting;

  public DischargeSummaryContextImpl(DocumentAuthor documentAuthor,
      SubjectOfCareParticipant subjectOfCareParticipant, ParticipationServiceProvider facility,
      RestrictedTimeInterval encounterPeriod, PreciseDate dateTimeAttested, String careSetting) {

    this.documentAuthor = documentAuthor;
    this.subjectOfCareParticipant = subjectOfCareParticipant;
    this.facility = facility;
    this.encounterPeriod = encounterPeriod;
    this.dateTimeAttested = dateTimeAttested;
    this.careSetting = careSetting;
  }

  @Override
  public DocumentAuthor getDocumentAuthor() {
    return documentAuthor;
  }

  @Override
  public SubjectOfCareParticipant getSubjectOfCare() {
    return subjectOfCareParticipant;
  }

  @Override
  public ParticipationServiceProvider getFacility() {
    return facility;
  }

  @Override
  public RestrictedTimeInterval getEncounterPeriod() {
    return encounterPeriod;
  }

  @Override
  public PreciseDate getDateTimeAttested() {
    return dateTimeAttested;
  }

  @Override
  public String getCareSetting() {
    return careSetting;
  }

  @Override
  public void setDocumentAuthor(DocumentAuthor documentAuthor) {
    this.documentAuthor = documentAuthor;
  }

  @Override
  public void setSubjectOfCareParticipant(
      SubjectOfCareParticipant subjectOfCareParticipant) {
    this.subjectOfCareParticipant = subjectOfCareParticipant;
  }

  @Override
  public void setFacility(
      ParticipationServiceProvider facility) {
    this.facility = facility;
  }

  @Override
  public void setEncounterPeriod(RestrictedTimeInterval encounterPeriod) {
    this.encounterPeriod = encounterPeriod;
  }

  @Override
  public void setDateTimeAttested(PreciseDate dateTimeAttested) {
    this.dateTimeAttested = dateTimeAttested;
  }

  @Override
  public void setCareSetting(String careSetting) {
    this.careSetting = careSetting;
  }
}

package au.gov.nehta.model.clinical.psml;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public class PharmacistSharedMedicinesListContextImpl implements
    PharmacistSharedMedicinesListContext {

  private DocumentAuthor documentAuthor;
  private SubjectOfCareParticipant subjectOfCareParticipant;
  private PreciseDate dateTimeAuthored;
  private PreciseDate dateTimeAttested;
  ParticipationServiceProvider participant;
  private ParticipationServiceProvider facility;

  public PharmacistSharedMedicinesListContextImpl(
      SubjectOfCareParticipant subjectOfCareParticipant,
      DocumentAuthor specialistLetterAuthor,
      PreciseDate dateTimeAuthored,
      PreciseDate dateTimeAttested,
      ParticipationServiceProvider participant,
      ParticipationServiceProvider facility) {

    this.subjectOfCareParticipant = subjectOfCareParticipant;
    this.documentAuthor = specialistLetterAuthor;
    this.dateTimeAuthored = dateTimeAuthored;
    this.dateTimeAttested = dateTimeAttested;
    this.participant = participant;
    this.facility = facility;

  }

  @Override
  public DocumentAuthor getDocumentAuthor() {
    return documentAuthor;
  }

  @Override
  public void setDocumentAuthor(DocumentAuthor documentAuthor) {
    this.documentAuthor = documentAuthor;
  }

  @Override
  public SubjectOfCareParticipant getSubjectOfCare() {
    return subjectOfCareParticipant;
  }

  @Override
  public void setSubjectOfCare(SubjectOfCareParticipant subjectOfCareParticipant) {
    this.subjectOfCareParticipant = subjectOfCareParticipant;
  }

  @Override
  public PreciseDate getDateTimeAuthored() {
    return dateTimeAuthored;
  }

  @Override
  public void setDateTimeAuthored(PreciseDate dateTimeAuthored) {
    this.dateTimeAuthored = dateTimeAuthored;
  }

  @Override
  public void setDateTimeAttested(PreciseDate dateTimeAttested) {
    this.dateTimeAttested = dateTimeAttested;
  }

  @Override
  public PreciseDate getDateTimeAttested() {
    return dateTimeAttested;
  }

  @Override
  public ParticipationServiceProvider getParticipant() {
    return participant;
  }

  @Override
  public void setParticipant(ParticipationServiceProvider participant) {
    this.participant = participant;
  }

  @Override
  public ParticipationServiceProvider getFacility() {
    return facility;
  }

  @Override
  public void setFacility(ParticipationServiceProvider facility) {
    this.facility = facility;
  }

}

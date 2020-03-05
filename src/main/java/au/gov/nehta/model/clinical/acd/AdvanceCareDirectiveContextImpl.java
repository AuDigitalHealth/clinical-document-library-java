package au.gov.nehta.model.clinical.acd;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public class AdvanceCareDirectiveContextImpl implements AdvanceCareDirectiveContext {

  private DocumentAuthor documentAuthor;
  private SubjectOfCareParticipant subjectOfCareParticipant;
  private PreciseDate dateTimeAuthored;
  private PreciseDate dateTimeAttested;

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
}

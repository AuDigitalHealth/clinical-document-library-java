package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;

public class ProblemDiagnosesEventSummaryImpl implements ProblemDiagnosesEventSummary {
  private Coded problemDiagnosisIdentification;
  private PreciseDate dateOfOnset;
  private String problemDiagnosisComment;
  private boolean showOngoingDateInNarrative;

  @Override
  public boolean getShowOngoingDateInNarrative() {
    return showOngoingDateInNarrative;
  }

  @Override
  public void setShowOngoingDateInNarrative(boolean showOngoingDateInNarrative) {
    this.showOngoingDateInNarrative = showOngoingDateInNarrative;
  }

  @Override
  public Coded getProblemDiagnosisIdentification() {
    return problemDiagnosisIdentification;
  }

  @Override
  public void setProblemDiagnosisIdentification(Coded problemDiagnosisIdentification) {
    this.problemDiagnosisIdentification = problemDiagnosisIdentification;
  }

  @Override
  public PreciseDate getDateOfOnset() {
    return dateOfOnset;
  }

  @Override
  public void setDateOfOnset(PreciseDate dateOfOnset) {
    this.dateOfOnset = dateOfOnset;
  }

  @Override
  public String getProblemDiagnosisComment() {
    return problemDiagnosisComment;
  }

  @Override
  public void setProblemDiagnosisComment(String problemDiagnosisComment) {
    this.problemDiagnosisComment = problemDiagnosisComment;
  }

  //TODO Validation Missing
}

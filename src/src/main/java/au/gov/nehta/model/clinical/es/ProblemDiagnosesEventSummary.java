package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;

public interface ProblemDiagnosesEventSummary {
  boolean getShowOngoingDateInNarrative();

  void setShowOngoingDateInNarrative(boolean showOngoingDateInNarrative);

  Coded getProblemDiagnosisIdentification();

  void setProblemDiagnosisIdentification(Coded problemDiagnosisIdentification);

  PreciseDate getDateOfOnset();

  void setDateOfOnset(PreciseDate dateOfOnset);

  String getProblemDiagnosisComment();

  void setProblemDiagnosisComment(String problemDiagnosisComment);
}

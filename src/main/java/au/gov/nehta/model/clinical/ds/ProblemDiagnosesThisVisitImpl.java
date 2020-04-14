package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class ProblemDiagnosesThisVisitImpl implements ProblemDiagnosesThisVisit {

  private ExclusionStatement exclusionStatement;
  private List<ProblemDiagnosis> problemDiagnoses;
  private StrucDocText customNarrative;

  @Override
  public ExclusionStatement getExclusionStatement() {
    return exclusionStatement;
  }

  @Override
  public List<ProblemDiagnosis> getProblemDiagnoses() {
    return problemDiagnoses;
  }

  @Override
  public void setExclusionStatement(ExclusionStatement exclusionStatement) {
    this.exclusionStatement = exclusionStatement;
  }

  @Override
  public void setProblemDiagnoses(List<ProblemDiagnosis> problemDiagnoses) {
    this.problemDiagnoses = problemDiagnoses;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }
}

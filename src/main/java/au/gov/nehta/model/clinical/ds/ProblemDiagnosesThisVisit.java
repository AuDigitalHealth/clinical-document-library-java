package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface ProblemDiagnosesThisVisit {

  /**
   * Only <code>Global Statement</code> attribute
   *
   * @return @{@link ExclusionStatement}
   */
  ExclusionStatement getExclusionStatement();

  List<ProblemDiagnosis> getProblemDiagnoses();

  void setExclusionStatement(ExclusionStatement exclusionStatement);

  void setProblemDiagnoses(
      List<ProblemDiagnosis> problemDiagnoses);


  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);
}

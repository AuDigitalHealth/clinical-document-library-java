package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public class ProblemDiagnosisImpl implements ProblemDiagnosis {

  private Coded problemDiagnosisType;
  private Coded problemDiagnosisDesc;

  @Override
  public Coded getProblemDiagnosisType() {
    return problemDiagnosisType;
  }

  @Override
  public Coded getProblemDiagnosisDesc() {
    return problemDiagnosisDesc;
  }

  @Override
  public void setProblemDiagnosisType(Coded problemDiagnosisType) {
    this.problemDiagnosisType = problemDiagnosisType;
  }

  @Override
  public void setProblemDiagnosisDesc(Coded problemDiagnosisDesc) {
    this.problemDiagnosisDesc = problemDiagnosisDesc;
  }
}

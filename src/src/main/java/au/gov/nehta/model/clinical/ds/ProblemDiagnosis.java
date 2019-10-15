package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public interface ProblemDiagnosis {

  Coded getProblemDiagnosisType();

  Coded getProblemDiagnosisDesc();

  void setProblemDiagnosisType(Coded problemDiagnosisType);

  void setProblemDiagnosisDesc(Coded problemDiagnosisDesc);
}

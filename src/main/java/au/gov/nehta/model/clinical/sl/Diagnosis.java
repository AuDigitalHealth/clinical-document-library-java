package au.gov.nehta.model.clinical.sl;

import au.gov.nehta.model.cda.common.code.Coded;

public class Diagnosis {
  private Coded diagnosisName;

  public Coded getDiagnosisName() {
    return diagnosisName;
  }

  public void setDiagnosisName(Coded diagnosisName) {
    this.diagnosisName = diagnosisName;
  }
}

package au.gov.nehta.model.clinical.sl;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class ResponseDetailsImpl implements ResponseDetails {

  private List<Diagnosis> diagnoses;
  private List<Procedure> procedures;
  private List<OtherDiagnosisProcedureEntry> otherDiagnosisProcedureEntries;
  private ResponseNarrative responseNarrative;
  private StrucDocText customNarrative;

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

  @Override
  public List<Diagnosis> getDiagnoses() {
    return diagnoses;
  }

  @Override
  public List<Procedure> getProcedures() {
    return procedures;
  }

  @Override
  public List<OtherDiagnosisProcedureEntry> getOtherDiagnosisProcedureEntries() {
    return otherDiagnosisProcedureEntries;
  }

  @Override
  public ResponseNarrative getResponseNarrative() {
    return responseNarrative;
  }

  @Override
  public void setDiagnoses(List<Diagnosis> diagnoses) {
    this.diagnoses = diagnoses;
  }

  @Override
  public void setProcedures(List<Procedure> procedures) {
    this.procedures = procedures;
  }

  @Override
  public void setOtherDiagnosisProcedureEntries(
      List<OtherDiagnosisProcedureEntry> otherDiagnosisProcedureEntries) {
    this.otherDiagnosisProcedureEntries = otherDiagnosisProcedureEntries;
  }

  @Override
  public void setResponseNarrative(ResponseNarrative responseNarrative) {
    this.responseNarrative = responseNarrative;
  }
}

package au.gov.nehta.model.clinical.ds;

public class Dosage {
  private String dosageInstruction;

  public Dosage() {
  }

  public Dosage(String dosageInstruction) {
    this.dosageInstruction = dosageInstruction;
  }

  public String getDosageInstruction() {
    return dosageInstruction;
  }

  public void setDosageInstruction(String dosageInstruction) {
    this.dosageInstruction = dosageInstruction;
  }
}

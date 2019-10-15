package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public class TherapeuticGoodImpl implements TherapeuticGood {

  private Coded therapeuticGoodIdentification;
  private Dosage dosage;
  private String unitOfUseQuantityDispensed;
  private String reasonForTherapeuticGood;
  private String additionalComments;
  private MedicationHistory medicationHistory;

  @Override
  public Coded getTherapeuticGoodIdentification() {
    return therapeuticGoodIdentification;
  }

  @Override
  public Dosage getDosage() {
    return dosage;
  }

  @Override
  public String getUnitOfUseQuantityDispensed() {
    return unitOfUseQuantityDispensed;
  }

  @Override
  public String getReasonForTherapeuticGood() {
    return reasonForTherapeuticGood;
  }

  @Override
  public String getAdditionalComments() {
    return additionalComments;
  }

  @Override
  public MedicationHistory getMedicationHistory() {
    return medicationHistory;
  }

  @Override
  public void setTherapeuticGoodIdentification(
      Coded therapeuticGoodIdentification) {
    this.therapeuticGoodIdentification = therapeuticGoodIdentification;
  }

  @Override
  public void setDosage(Dosage dosage) {
    this.dosage = dosage;
  }

  @Override
  public void setUnitOfUseQuantityDispensed(String unitOfUseQuantityDispensed) {
    this.unitOfUseQuantityDispensed = unitOfUseQuantityDispensed;
  }

  @Override
  public void setReasonForTherapeuticGood(String reasonForTherapeuticGood) {
    this.reasonForTherapeuticGood = reasonForTherapeuticGood;
  }

  @Override
  public void setAdditionalComments(String additionalComments) {
    this.additionalComments = additionalComments;
  }

  @Override
  public void setMedicationHistory(MedicationHistory medicationHistory) {
    this.medicationHistory = medicationHistory;
  }
}

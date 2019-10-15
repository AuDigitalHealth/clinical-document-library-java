package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public interface TherapeuticGood {

  Coded getTherapeuticGoodIdentification();

  Dosage getDosage();

  String getUnitOfUseQuantityDispensed();

  String getReasonForTherapeuticGood();

  String getAdditionalComments();

  MedicationHistory getMedicationHistory();

  void setTherapeuticGoodIdentification(
      Coded therapeuticGoodIdentification);

  void setDosage(Dosage dosage);

  void setUnitOfUseQuantityDispensed(String unitOfUseQuantityDispensed);

  void setReasonForTherapeuticGood(String reasonForTherapeuticGood);

  void setAdditionalComments(String additionalComments);

  void setMedicationHistory(MedicationHistory medicationHistory);
}

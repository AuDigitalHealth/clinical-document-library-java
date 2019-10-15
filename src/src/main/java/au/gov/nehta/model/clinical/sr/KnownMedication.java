package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;

public interface KnownMedication {

  Coded getTherapeuticGoodIdentification();

  void setTherapeuticGoodIdentification(Coded therapeuticGoodIdentification);

  String getDirections();

  void setDirections(String directions);

  String getClinicalIndication();

  void setClinicalIndication(String clinicalIndication);

  String getMedicationInstructionComment();

  void setMedicationInstructionComment(String medicationInstructionComment);

}

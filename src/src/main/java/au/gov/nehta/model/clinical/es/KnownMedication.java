package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

public interface KnownMedication {


  Coded getTherapeuticGoodIdentification();

  void setTherapeuticGoodIdentification(
      Coded therapeuticGoodIdentification);

  String getDirections();

  void setDirections(String directions);

  String getClinicalIndication();

  void setClinicalIndication(String clinicalIndication);

  String getMedicationInstructionComment();

  void setMedicationInstructionComment(String medicationInstructionComment);

  Coded getChangeType();

  void setChangeType(Coded changeType);

  Coded getChangeStatus();

  void setChangeStatus(Coded changeStatus);

  String getChangeDesc();

  void setChangeDesc(String changeDesc);

  String getChangeOrRecommendationReason();

  void setChangeOrRecommendationReason(String changeOrRecommendationReason);
}

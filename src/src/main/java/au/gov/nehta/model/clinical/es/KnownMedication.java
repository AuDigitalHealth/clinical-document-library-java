package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

public interface KnownMedication {

  //TODO (ICodableText) Missing Medicine (.net)

  Coded getTherapeuticGoodIdentification();  //TODO Check. Does not exist in IMedicationItem (.net), exists in CDA

  void setTherapeuticGoodIdentification(Coded therapeuticGoodIdentification); //TODO Check. Does not exist in IMedicationItem (.net), exists in CDA

  String getDirections();

  void setDirections(String directions);

  String getClinicalIndication();

  void setClinicalIndication(String clinicalIndication);

  //TODO (String) Missing Comment class (.net) - NOT in CDA Doc

  String getMedicationInstructionComment();

  void setMedicationInstructionComment(String medicationInstructionComment);

  Coded getChangeType();

  void setChangeType(Coded changeType);

  Coded getChangeStatus();

  void setChangeStatus(Coded changeStatus);

  String getChangeDesc();

  void setChangeDesc(String changeDesc);

  String getChangeOrRecommendationReason(); //TODO This is just called ChangeReason() in .Net

  void setChangeOrRecommendationReason(String changeOrRecommendationReason);
}

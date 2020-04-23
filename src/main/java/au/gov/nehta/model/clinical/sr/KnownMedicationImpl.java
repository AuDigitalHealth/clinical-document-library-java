package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;

public class KnownMedicationImpl implements KnownMedication {

  private Coded therapeuticGoodIdentification;
  private String directions;
  private String clinicalIndication;
  private String medicationInstructionComment;

  @Override
  public Coded getTherapeuticGoodIdentification() {
    return therapeuticGoodIdentification;
  }

  @Override
  public void setTherapeuticGoodIdentification(Coded therapeuticGoodIdentification) {
    this.therapeuticGoodIdentification = therapeuticGoodIdentification;
  }

  @Override
  public String getDirections() {
    return directions;
  }

  @Override
  public void setDirections(String directions) {
    this.directions = directions;
  }

  @Override
  public String getClinicalIndication() {
    return clinicalIndication;
  }

  @Override
  public void setClinicalIndication(String clinicalIndication) {
    this.clinicalIndication = clinicalIndication;
  }

  @Override
  public String getMedicationInstructionComment() {
    return medicationInstructionComment;
  }

  @Override
  public void setMedicationInstructionComment(String medicationInstructionComment) {
    this.medicationInstructionComment = medicationInstructionComment;
  }

}

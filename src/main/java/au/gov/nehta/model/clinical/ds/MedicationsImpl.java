package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class MedicationsImpl implements Medications {

  private CurrentMedicationsOnDischarge currentMedicationsOnDischarge;
  private CeasedMedications ceasedMedications;
  private StrucDocText customNarrative;
  private StrucDocText currentMedicationsOnDischargeCustomNarrative;
  private StrucDocText ceasedMedicationsCustomNarrative;



  public MedicationsImpl() {
  }

  public MedicationsImpl(CurrentMedicationsOnDischarge currentMedicationsOnDischarge,
      CeasedMedications ceasedMedications) {
    this.currentMedicationsOnDischarge = currentMedicationsOnDischarge;
    this.ceasedMedications = ceasedMedications;
  }

  @Override
  public CurrentMedicationsOnDischarge getCurrentMedicationsOnDischarge() {
    return currentMedicationsOnDischarge;
  }

  @Override
  public CeasedMedications getCeasedMedications() {
    return ceasedMedications;
  }

  @Override
  public void setCurrentMedicationsOnDischarge(
      CurrentMedicationsOnDischarge currentMedicationsOnDischarge) {
    this.currentMedicationsOnDischarge = currentMedicationsOnDischarge;
  }

  @Override
  public void setCeasedMedications(CeasedMedications ceasedMedications) {
    this.ceasedMedications = ceasedMedications;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

  @Override
  public Medications addCurrentMedicationsOnDischargeAsNarrative(StrucDocText narrative) {
    this.currentMedicationsOnDischargeCustomNarrative = narrative;
    return this;
  }

  @Override
  public Medications addCeasedMedicationsOnDischargeAsNarrative(StrucDocText narrative) {
    this.ceasedMedicationsCustomNarrative = narrative;
    return this;
  }

  @Override
  public StrucDocText getCurrentMedicationsOnDischargeCustomNarrative() {
    return currentMedicationsOnDischargeCustomNarrative;
  }

  @Override
  public StrucDocText getCeasedMedicationsCustomNarrative() {
    return ceasedMedicationsCustomNarrative;
  }
}

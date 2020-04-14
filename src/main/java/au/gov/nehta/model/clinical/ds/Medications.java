package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface Medications {
  CurrentMedicationsOnDischarge getCurrentMedicationsOnDischarge();
  CeasedMedications getCeasedMedications();

  void setCurrentMedicationsOnDischarge(
      CurrentMedicationsOnDischarge currentMedicationsOnDischarge);

  void setCeasedMedications(CeasedMedications ceasedMedications);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);

  Medications addCurrentMedicationsOnDischargeAsNarrative(StrucDocText narrative);

  Medications addCeasedMedicationsOnDischargeAsNarrative(StrucDocText narrative);

  StrucDocText getCurrentMedicationsOnDischargeCustomNarrative();

  StrucDocText getCeasedMedicationsCustomNarrative();

}

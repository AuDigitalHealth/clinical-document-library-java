package au.gov.nehta.model.clinical.es;

import java.util.List;

public class MedicationsImpl implements Medications {

  protected List<KnownMedication> knownMedications;

  @Override
  public void setKnownMedications(
      List<KnownMedication> knownMedications) {
    this.knownMedications = knownMedications;
  }

  @Override
  public List<KnownMedication> getKnownMedications() {
    return knownMedications;
  }
}

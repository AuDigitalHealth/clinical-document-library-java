package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class MedicationsImpl implements Medications {

  private List<KnownMedication> knownMedications;
  private ExclusionStatement exclusionStatement;
  private StrucDocText customNarrative;

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

  @Override
  public void setKnownMedications(
      List<KnownMedication> knownMedications) {
    this.knownMedications = knownMedications;
  }

  @Override
  public ExclusionStatement getExclusionStatement() {
    return exclusionStatement;
  }

  @Override
  public void setExclusionStatement(ExclusionStatement exclusionStatement) {
    this.exclusionStatement = exclusionStatement;
  }

  @Override
  public List<KnownMedication> getKnownMedications() {
    return knownMedications;
  }
}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.Immunisation;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class ImmunisationsImpl implements Immunisations {

  protected List<Immunisation> immunisations;
  private StrucDocText customNarrative;

  public ImmunisationsImpl(List<Immunisation> immunisations) {
    this.immunisations = immunisations;
  }

  @Override
  public List<Immunisation> getImmunisations() {
    return immunisations;
  }

  @Override
  public void setImmunisations(
      List<Immunisation> immunisations) {
    this.immunisations = immunisations;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

}

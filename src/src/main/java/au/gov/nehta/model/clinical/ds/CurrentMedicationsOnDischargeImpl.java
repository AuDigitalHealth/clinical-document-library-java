package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class CurrentMedicationsOnDischargeImpl implements CurrentMedicationsOnDischarge {

  private ExclusionStatement exclusionStatement;
  private List<TherapeuticGood> therapeuticGoods;
  private StrucDocText customNarrative;

  @Override
  public ExclusionStatement getExclusionStatement() {
    return exclusionStatement;
  }

  @Override
  public List<TherapeuticGood> getTherapeuticGoods() {
    return therapeuticGoods;
  }

  @Override
  public void setExclusionStatement(ExclusionStatement exclusionStatement) {
    this.exclusionStatement = exclusionStatement;
  }

  @Override
  public void setTherapeuticGoods(
      List<TherapeuticGood> therapeuticGoods) {
    this.therapeuticGoods = therapeuticGoods;
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

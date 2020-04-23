package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface CeasedMedications {

  ExclusionStatement getExclusionStatement();

  List<TherapeuticGood> getTherapeuticGoods();

  void setExclusionStatement(ExclusionStatement exclusionStatement);

  void setTherapeuticGoods(
      List<TherapeuticGood> therapeuticGoods);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);

}

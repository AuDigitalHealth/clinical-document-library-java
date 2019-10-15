package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.Immunisation;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface Immunisations {

  List<Immunisation> getImmunisations();

  void setImmunisations(
      List<Immunisation> immunisations);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);

}

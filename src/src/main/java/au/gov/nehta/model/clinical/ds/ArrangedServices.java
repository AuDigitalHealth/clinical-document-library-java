package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class ArrangedServices {

  private List<ArrangedService> arrangedServiceList;
  private StrucDocText customNarrative;

  public List<ArrangedService> getArrangedServiceList() {
    return arrangedServiceList;
  }

  public void setArrangedServiceList(
      List<ArrangedService> arrangedServiceList) {
    this.arrangedServiceList = arrangedServiceList;
  }

  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }


  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

}

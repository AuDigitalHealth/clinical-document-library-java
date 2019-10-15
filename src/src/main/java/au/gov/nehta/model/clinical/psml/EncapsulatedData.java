package au.gov.nehta.model.clinical.psml;

import au.gov.nehta.model.cda.common.code.Coded;

public class EncapsulatedData {

  private Coded item;

  public Coded getItem() {
    return item;
  }

  public void setItem(Coded item) {
    this.item = item;
  }
}

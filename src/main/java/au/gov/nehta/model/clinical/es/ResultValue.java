package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.Quantity;
import au.gov.nehta.model.clinical.common.types.QuantityRange;

public class ResultValue {
  private Coded codedResultValue;
  private Quantity quantityResultValue;
  private QuantityRange quantityRangeResultValue;
  private ReferenceRangeDetails referenceRangeDetails;

  public Coded getCodedResultValue() {
    return codedResultValue;
  }

  public void setCodedResultValue(Coded codedResultValue) {
    this.codedResultValue = codedResultValue;
  }

  public Quantity getQuantityResultValue() {
    return quantityResultValue;
  }

  public void setQuantityResultValue(Quantity quantityResultValue) {
    this.quantityResultValue = quantityResultValue;
  }

  public QuantityRange getQuantityRangeResultValue() {
    return quantityRangeResultValue;
  }

  public void setQuantityRangeResultValue(QuantityRange quantityRangeResultValue) {
    this.quantityRangeResultValue = quantityRangeResultValue;
  }

  public ReferenceRangeDetails getReferenceRangeDetails() {
    return referenceRangeDetails;
  }

  public void setReferenceRangeDetails(ReferenceRangeDetails referenceRangeDetails) {
    this.referenceRangeDetails = referenceRangeDetails;
  }
}

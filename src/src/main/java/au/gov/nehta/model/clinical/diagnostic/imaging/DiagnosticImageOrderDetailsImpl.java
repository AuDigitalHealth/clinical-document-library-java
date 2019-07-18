package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

public class DiagnosticImageOrderDetailsImpl extends UniqueIdentifierImpl implements
    DiagnosticImageOrderDetails {

  private UniqueIdentifier accessionNumber;
  private Coded order;
  private UniqueIdentifier id;

  public DiagnosticImageOrderDetailsImpl(UniqueIdentifier id, UniqueIdentifier accessionNumber,
      Coded order) {
    //ArgumentUtils.checkNotNull( order, "order" );
    ArgumentUtils.checkNotNull(accessionNumber, "accessionNumber");
    this.setAccessionNumber(accessionNumber);
    this.id = id;
    this.order = order;

  }

  @Override
  public UniqueIdentifier getAccessionNumber() {
    return accessionNumber;
  }

  private void setAccessionNumber(UniqueIdentifier accessionNumber) {
    this.accessionNumber = accessionNumber;
  }

  @Override
  public Coded getOrder() {
    return order;
  }

  /**
   * @param order the order to set
   */
  public void setOrder(Coded order) {
    this.order = order;
  }

  @Override
  public UniqueIdentifier getId() {
    return id;
  }

  /**
   * @param id the id to set
   */
  public void setId(UniqueIdentifier id) {
    this.id = id;
  }


}

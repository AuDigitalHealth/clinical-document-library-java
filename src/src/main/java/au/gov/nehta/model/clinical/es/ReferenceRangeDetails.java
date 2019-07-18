package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

public class ReferenceRangeDetails {

  private Coded normalStatus;
  private List<ReferenceRange> referenceRanges;

  public Coded getNormalStatus() {
    return normalStatus;
  }

  public void setNormalStatus(Coded normalStatus) {
    this.normalStatus = normalStatus;
  }

  public List<ReferenceRange> getReferenceRanges() {
    return referenceRanges;
  }

  public void setReferenceRange(List<ReferenceRange> referenceRangeList) {
    this.referenceRanges = referenceRangeList;
  }
}

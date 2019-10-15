package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;

public class MedicationHistoryImpl implements MedicationHistory {

  private Coded itemStatus;
  private ChangeDetail changeDetail;
  private RestrictedTimeInterval medicationDuration;

  @Override
  public Coded getItemStatus() {
    return itemStatus;
  }

  @Override
  public ChangeDetail getChangeDetail() {
    return changeDetail;
  }

  @Override
  public RestrictedTimeInterval getMedicationDuration() {
    return medicationDuration;
  }

  @Override
  public void setItemStatus(Coded itemStatus) {
    this.itemStatus = itemStatus;
  }

  @Override
  public void setChangeDetail(ChangeDetail changeDetail) {
    this.changeDetail = changeDetail;
  }

  @Override
  public void setMedicationDuration(
      RestrictedTimeInterval medicationDuration) {
    this.medicationDuration = medicationDuration;
  }
}

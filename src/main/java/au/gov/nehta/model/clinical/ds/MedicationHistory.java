package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;

public interface MedicationHistory {

    Coded getItemStatus();

    ChangeDetail getChangeDetail();

    RestrictedTimeInterval getMedicationDuration();

    void setItemStatus(Coded itemStatus);

    void setChangeDetail(ChangeDetail changeDetail);

    void setMedicationDuration(RestrictedTimeInterval medicationDuration);
}

package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.clinical.common.types.PAI_D;

public interface DeviceParticipant {
    PAI_D getDeviceID();

    String getSoftwareName();
}

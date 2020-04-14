package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.clinical.common.types.PAI_D;

public class DeviceParticipantImpl implements DeviceParticipant {
    private final PAI_D paid;
    private final String softwareName;
    
    public DeviceParticipantImpl( PAI_D pai_d, String softwareName ) {
        this.paid = pai_d;
        this.softwareName = softwareName;
    }
    
    
    @Override
    public PAI_D getDeviceID() {
        return paid;
    }

    @Override
    public String getSoftwareName() {
        return softwareName;
    }

}

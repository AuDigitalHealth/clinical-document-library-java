package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.ArrayList;
import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.telecom.Telecom;

public abstract class ParticipantImpl {
    protected ProviderAddress address;
    protected List<Telecom> electronicCommunicationDetail = new ArrayList<>();

    public ProviderAddress getAddresses() {
        return address;
    }

    public List<Telecom> getElectronicCommunicationDetail() {
        return electronicCommunicationDetail;
    }

    public void setAddress(ProviderAddress address) {
        ArgumentUtils.checkNotNull(address, "address");
        this.address = address;
    }

    public void addElectronicCommunicationDetail(Telecom communication) {
        electronicCommunicationDetail.add(communication);
    }

    public void setElectronicCommunicationDetail(List<Telecom> electronicCommunicationDetail) {
        ArgumentUtils.checkNotNull(electronicCommunicationDetail, "electronicCommunicationDetail");
        this.electronicCommunicationDetail = electronicCommunicationDetail;
    }
}

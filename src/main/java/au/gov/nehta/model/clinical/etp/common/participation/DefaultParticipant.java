package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.List;

import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.types.HPII;

public interface DefaultParticipant {
    public HPII getEntityIdentifiers();

    public ProviderAddress getAddresses();

    public List<Telecom> getElectronicCommunicationDetail();

    public ProviderPerson getPerson();

    public List<Entitlement> getEntitlement();

    public String getQualifications();

    public void setAddress(ProviderAddress address);

    public void setEntitlement(List<Entitlement> entitlement);

    public void addEntitlement(Entitlement entitlement);

    public void setElectronicCommunicationDetail(List<Telecom> electronicCommunicationDetail);

    public void addElectronicCommunicationDetail(Telecom electronicCommunicationDetail);

    public void setQualifications(String qualifications);

    public String getParticipantID();

    public void setParticipantID(String id);
}

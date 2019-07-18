package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.List;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;

public interface Participant {
    public AsEntityIdentifier getEntityIdentifiers();
    public ProviderAddress getAddresses();

    public List<Telecom> getElectronicCommunicationDetail();
    public void setAddress( ProviderAddress address );
    public void addElectronicCommunicationDetail( Telecom electronicCommunicationDetail );
    public void setElectronicCommunicationDetail( List<Telecom> electronicCommunicationDetail );
    
    


}

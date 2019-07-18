package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.Organisation;

import java.util.List;

public interface ServiceProvider {

    List<AsEntityIdentifier> getEntityIdentifiers();

    void setEntityIdentifiers(List<AsEntityIdentifier> entityIdentifiers);

    List<Address> getAddresses();

    void setAddresses(List<Address> addresses);

    List<ElectronicCommunicationDetail> getElectronicCommunicationDetails();

    void setElectronicCommunicationDetails(List<ElectronicCommunicationDetail> electronicCommunicationDetails);

    Organisation getOrganisation();

    void setOrganisation(Organisation organisation);

    PersonHealthcareProvider getHealthCareProvider();

    void setHealthCareProvider(PersonHealthcareProvider person);



    //TODO Misssing validation

}

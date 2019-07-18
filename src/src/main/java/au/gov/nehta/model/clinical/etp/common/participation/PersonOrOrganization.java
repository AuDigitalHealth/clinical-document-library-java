package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.util.List;

public interface PersonOrOrganization {
    UniqueIdentifier getId();

    void setId(UniqueIdentifier identifier);

    List<Address> getAddresses();

    void setAddresses(List<Address> addresses);

    List<ElectronicCommunicationDetail> getElectronicCommunicationDetails();

    void setElectronicCommunicationDetails(List<ElectronicCommunicationDetail> electronicCommunicationDetails);

    PersonWithOrganization getPersonWithOrganization();

    void setPersonWithOrganization(PersonWithOrganization personWithOrganization);

    Organisation getOrganisation();

    void setOrganisation(Organisation organisation);

    Coded getRelationshipToSubjectOfCare();

    void setRelationshipToSubjectOfCare(Coded relationshipToSubjectOfCare);

    List<Entitlement> getEntitlements();

    void setEntitlements(List<Entitlement> entitlements);

    String getQualifications();

    void setQualifications(String qualifications);

    //TODO Misssing validation
}

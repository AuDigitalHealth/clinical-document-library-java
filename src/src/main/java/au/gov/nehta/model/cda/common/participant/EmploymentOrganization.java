package au.gov.nehta.model.cda.common.participant;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;

import java.util.List;

public interface EmploymentOrganization extends Organization {
    Coded getEmploymentType();

    Coded getOccupation();

    Coded getPositionInOrganization();

    List<Address> getAddresses();

    List<ElectronicCommunicationDetail> getElectronicCommunicationDetails();

    void setEmploymentType(Coded employmentType);

    void setOccupation(Coded occupation);

    void setPositionInOrganization(Coded positionInOrganization);

    void setAddresses(List<Address> addresses);

    void setElectronicCommunicationDetails(
        List<ElectronicCommunicationDetail> electronicCommunicationDetails);

    void setIdentifiers(
            List<AsEntityIdentifier> identifiers);

    void setName(String name);

    void setDepartment(String department);

    void setOrganisationNameUsage(
        OrganisationNameUsage organisationNameUsage);

    //TODO Missing Validation
}

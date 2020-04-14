package au.gov.nehta.model.cda.common.participant;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;

import java.util.List;

public class EmploymentOrganizationImpl implements EmploymentOrganization {

  private Coded employmentType;
  private Coded occupation;
  private Coded positionInOrganization;
  private List<Address> addresses;
  private List<ElectronicCommunicationDetail> electronicCommunicationDetails;
  private List<AsEntityIdentifier> identifiers;
  private String name;
  private String department;
  private OrganisationNameUsage organisationNameUsage;

  @Override
  public Coded getEmploymentType() {
    return employmentType;
  }

  @Override
  public void setEmploymentType(Coded employmentType) {
    this.employmentType = employmentType;
  }

  @Override
  public Coded getOccupation() {
    return occupation;
  }

  @Override
  public void setOccupation(Coded occupation) {
    this.occupation = occupation;
  }

  @Override
  public Coded getPositionInOrganization() {
    return positionInOrganization;
  }

  @Override
  public void setPositionInOrganization(Coded positionInOrganization) {
    this.positionInOrganization = positionInOrganization;
  }

  @Override
  public List<Address> getAddresses() {
    return addresses;
  }

  @Override
  public void setAddresses(List<Address> addresses) {
    this.addresses = addresses;
  }

  @Override
  public List<ElectronicCommunicationDetail> getElectronicCommunicationDetails() {
    return electronicCommunicationDetails;
  }

  @Override
  public void setElectronicCommunicationDetails(
      List<ElectronicCommunicationDetail> electronicCommunicationDetails) {
    this.electronicCommunicationDetails = electronicCommunicationDetails;
  }

  @Override
  public List<AsEntityIdentifier> getIdentifiers() {
    return identifiers;
  }

  @Override
  public void setIdentifiers(
          List<AsEntityIdentifier> identifiers) {
    this.identifiers = identifiers;
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public void setName(String name) {
    this.name = name;
  }

  @Override
  public String getDepartment() {
    return department;
  }

  @Override
  public void setDepartment(String department) {
    this.department = department;
  }

  @Override
  public OrganisationNameUsage getOrganisationNameUsage() {
    return organisationNameUsage;
  }

  @Override
  public void setOrganisationNameUsage(
      OrganisationNameUsage organisationNameUsage) {
    this.organisationNameUsage = organisationNameUsage;
  }
}

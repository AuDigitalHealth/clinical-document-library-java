package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import java.util.List;

public class PersonOrOrganizationImpl implements PersonOrOrganization {

  private UniqueIdentifier id;
  private List<Address> addresses;
  private List<ElectronicCommunicationDetail> electronicCommunicationDetails;
  private PersonWithOrganization personWithOrganization;
  private Organisation organisation;
  private Coded relationshipToSubjectOfCare;
  private List<Entitlement> entitlements;
  private String qualifications;

  @Override
  public UniqueIdentifier getId() {
    return id;
  }

  @Override
  public void setId(UniqueIdentifier identifier) {
    this.id = identifier;
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
  public void setElectronicCommunicationDetails(List<ElectronicCommunicationDetail> electronicCommunicationDetails) {
    this.electronicCommunicationDetails = electronicCommunicationDetails;
  }

  @Override
  public PersonWithOrganization getPersonWithOrganization() {
    return personWithOrganization;
  }

  @Override
  public void setPersonWithOrganization(PersonWithOrganization personWithOrganization) {
    this.personWithOrganization = personWithOrganization;
  }

  @Override
  public Organisation getOrganisation() {
    return organisation;
  }

  @Override
  public void setOrganisation(Organisation organisation) {
    this.organisation = organisation;
  }

  @Override
  public Coded getRelationshipToSubjectOfCare() {
    return relationshipToSubjectOfCare;
  }

  @Override
  public void setRelationshipToSubjectOfCare(Coded relationshipToSubjectOfCare) {
    this.relationshipToSubjectOfCare = relationshipToSubjectOfCare;
  }

  @Override
  public List<Entitlement> getEntitlements() {
    return entitlements;
  }

  @Override
  public void setEntitlements(List<Entitlement> entitlements) {
    this.entitlements = entitlements;
  }

  @Override
  public String getQualifications() {
    return qualifications;
  }

  @Override
  public void setQualifications(String qualifications) {
    this.qualifications = qualifications;
  }
}

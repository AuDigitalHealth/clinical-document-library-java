package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import java.util.List;

public class ServiceProviderImpl implements ServiceProvider {

  private List<AsEntityIdentifier> entityIdentifiers;
  private List<Address> address;
  private List<ElectronicCommunicationDetail> electronicCommunicationDetails;
  private Organisation organisation;
  private PersonHealthcareProvider person;
  private Class executingClass;

  @Override
  public List<AsEntityIdentifier> getEntityIdentifiers() {
    return entityIdentifiers;
  }

  @Override
  public void setEntityIdentifiers(List<AsEntityIdentifier> entityIdentifiers) {
    this.entityIdentifiers = entityIdentifiers;
  }

  @Override
  public List<Address> getAddresses() {
    return address;
  }

  @Override
  public void setAddresses(List<Address> addresses) {
    this.address = addresses;
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
  public Organisation getOrganisation() {
    return organisation;
  }

  @Override
  public void setOrganisation(Organisation organisation) {
    this.organisation = organisation;
  }

  @Override
  public PersonHealthcareProvider getHealthCareProvider() {
    return person;
  }

  @Override
  public void setHealthCareProvider(PersonHealthcareProvider person) {
    this.person = person;
  }

  public void setExecutingClass(Class executingClass) {
    this.executingClass = executingClass;
  }

  @Override
  public Class getExecutingClass() {
    return executingClass;
  }

}

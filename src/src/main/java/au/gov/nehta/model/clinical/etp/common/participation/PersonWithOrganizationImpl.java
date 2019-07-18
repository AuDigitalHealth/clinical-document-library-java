package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.util.List;

public class PersonWithOrganizationImpl implements PersonWithOrganization {

  private EmploymentOrganization employmentOrganization;
  private List<UniqueIdentifier> identifiers;
  private List<PersonName> personNames;

  @Override
  public EmploymentOrganization getEmploymentOrganisation() {
    return employmentOrganization;
  }

  @Override
  public void setEmploymentOrganisation(EmploymentOrganization employmentOrganisation) {
    this.employmentOrganization = employmentOrganisation;
  }

  @Override
  public List<UniqueIdentifier> getIdentifiers() {
    return identifiers;
  }

  @Override
  public void setIdentifiers(List<UniqueIdentifier> identifiers) {
      this.identifiers = identifiers;
  }

  @Override
  public List<PersonName> getPersonNames() {
    return personNames;
  }

  @Override
  public void setPersonNames(List<PersonName> personNames) {
    this.personNames = personNames;
  }
}

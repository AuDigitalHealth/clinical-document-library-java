package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PathologyOrganisationParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class RequesterParticipantImpl extends PathologyOrganisationParticipantImpl implements
    RequesterParticipant {

  private AsEntityIdentifier entityIdentifier;
  private List<AsEntityIdentifier> organisationIdentifiers;
  private ProviderPerson person;
  private List<Entitlement> entitlement;
  private String qualifications;
  private String id = UUID.randomUUID().toString();


  public RequesterParticipantImpl(AsEntityIdentifier personIdentifier,
      List<AsEntityIdentifier> organisationIdentifiers, Organisation org,
      ProviderPerson person) {
    //ArgumentUtils.checkNotNull(personIdentifier, "entityIdentifier");
    ArgumentUtils.checkNotNull(person, "person");
    //ArgumentUtils.checkNotNull(org, "organisation");
    //ArgumentUtils.checkNotNullNorEmpty(organisationIdentifiers, "organisationIdentifiers");

    this.entityIdentifier = personIdentifier;
    this.person = person;
    this.organisationIdentifiers = organisationIdentifiers;
    this.organisation = org;
  }

  @Override
  public AsEntityIdentifier getEntityIdentifiers() {
    return entityIdentifier;
  }

  @Override
  public ProviderPerson getPerson() {
    return person;
  }

  @Override
  public List<Entitlement> getEntitlement() {
    return entitlement;
  }

  @Override
  public void setEntitlement(List<Entitlement> entitlement) {
    ArgumentUtils.checkNotNull(entitlement, "entitlement");
    this.entitlement = entitlement;
  }

  @Override
  public String getQualifications() {
    return qualifications;
  }

  @Override
  public void setQualifications(String qualifications) {
    ArgumentUtils.checkNotNull(qualifications, "qualifications");
    this.qualifications = qualifications;
  }

  @Override
  public void addEntitlement(Entitlement entitlement) {
    ArgumentUtils.checkNotNull(entitlement, "entitlement");
    if (this.entitlement == null) {
      this.entitlement = new ArrayList<>();
    }
    this.entitlement.add(entitlement);
  }

  @Override
  public UniqueIdentifier getRoleId() {
    return null;
  }

  @Override
  public Coded getHealthcareFacilityType() {
    return null;
  }

  @Override
  public List<AsEntityIdentifier> getOrganisationIdentifiers() {
    return organisationIdentifiers;
  }

  public void setOrganisation(Organisation org) {
    this.organisation = org;
  }

  /**
   * Retuurns a random UUID unless explicitly set
   */
  @Override
  public String getAssignedAuthorId() {
    return id;
  }

  @Override
  public void setAssignedAuthorId(String id) {
    this.id = id;
  }

}

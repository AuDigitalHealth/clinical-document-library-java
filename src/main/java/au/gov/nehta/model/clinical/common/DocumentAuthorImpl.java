package au.gov.nehta.model.clinical.common;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisation;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;

import java.time.ZonedDateTime;
import java.util.List;
import java.util.UUID;

public class DocumentAuthorImpl implements DocumentAuthor {

    private Coded role;
    private ZonedDateTime participationPeriod;
    private List<AsEntityIdentifier> entityIdentifiers;
    private List<AddressContext> addresses;
    private List<Telecom> electronicCommunicationDetails;
    private List<PersonName> personNames;
    private ExtendedEmploymentOrganisation employmentDetail;
    private String id = UUID.randomUUID().toString();
    private List<? extends Entitlement> entitlements;

    /**
     * Creates an author section without the optional participation period
     */
    public DocumentAuthorImpl(
            Coded role,
            List<AsEntityIdentifier> entityIdentifiers,
            List<PersonName> personNames,
            ExtendedEmploymentOrganisation employmentDetail) {
        this(role, null, entityIdentifiers, null, null, personNames, employmentDetail);
    }

    /**
     * Creates an author section with the optional participation period
     */
    public DocumentAuthorImpl(Coded role,
                              ZonedDateTime participationPeriod,
                              List<AsEntityIdentifier> entityIdentifiers,
                              List<AddressContext> addresses,
                              List<Telecom> electronicCommunicationDetails,
                              List<PersonName> personNames,
                              ExtendedEmploymentOrganisation employmentDetail) {

        ArgumentUtils.checkNotNull(role, "role");
        ArgumentUtils.checkNotNullNorEmpty(entityIdentifiers, "entityIdentifiers");

        ArgumentUtils.checkNotNullNorEmpty(personNames, "personNames");
        ArgumentUtils.checkNotNull(employmentDetail, "employmentDetail");

        this.role = role;
        this.participationPeriod = participationPeriod;
        this.entityIdentifiers = entityIdentifiers;
        this.addresses = addresses;
        this.electronicCommunicationDetails = electronicCommunicationDetails;
        this.personNames = personNames;
        this.employmentDetail = employmentDetail;
    }

    /**
     * The involvement or role of the participant in the related action from a healthcare perspective
     * rather than the specific participation perspective.
     *
     * <p>Role SHOULD have a value chosen from 1220.0 - ANZSCO - Australian and New Zealand Standard
     * Classification of Occupations, First Edition, 2006 - METeOR 350899. [ABS2006]. However, if a
     * suitable value in this set cannot be found, then any code set that is both registered with HL7
     * and publicly available MAY be used.
     */
    @Override
    public Coded getRole() {
        return role;
    }

    /**
     * This element will hold the same value as Shared Health Summary > Date- Time Attested
     * (ClinicalDocument/ legalAuthenticator/ time) Although the definition of this element states
     * that it is a time interval, the following applies: "The end of the participation period of a
     * Document Author participation is the time associated with the completion of editing the content
     * of a document.". Thus only the end time need be recorded.
     */
    @Override
    public ZonedDateTime getParticipationPeriod() {
        return participationPeriod;
    }

    /**
     * A number or code issued for the purpose of identifying a participant within a healthcare
     * context.
     */
    @Override
    public List<AsEntityIdentifier> getEntityIdentifiers() {
        return entityIdentifiers;
    }

    /**
     * The description of a location where an entity is located or can be otherwise reached or found
     * and a description of the purpose for which that address is primarily used by that entity.
     */
    @Override
    public List<AddressContext> getAddresses() {
        return addresses;
    }

    /**
     * The electronic communication details of entities.
     */
    @Override
    public List<Telecom> getElectronicCommunicationDetails() {
        return electronicCommunicationDetails;
    }

    /**
     * The appellation by which an individual may be identified separately from any other within a
     * social context.
     */
    @Override
    public List<PersonName> getPersonNames() {
        return personNames;
    }


    /**
     * A person's occupation and employer
     */
    @Override
    public ExtendedEmploymentOrganisation getEmploymentDetail() {
        return employmentDetail;
    }

    /**
     * The entitlement or right of a participant to act in a given capacity (as defined by Entitlement
     * Type) within a healthcare context.
     */
    @Override
    public List<? extends Entitlement> getEntitlements() {
        return entitlements;
    }

    /**
     * author/assignedAuthor/id
     *
     * <p>THIS WILL BE A RANDOM UUID UNLESS EXPLICITLY SET
     *
     * <p>UUID. Required CDA element. This is a technical identifier that is used for system purposes
     * such as matching. If a suitable internal key is not available, a UUID MAY be used.
     */
    @Override
    public String getID() {
        return id;
    }

    /**
     * author/assignedAuthor/id
     *
     * <p>Overrides the default value, which is a random UUID
     *
     * <p>this is a required CDA element, a technical identifier that is used for system purposes
     * such
     * as matching. If a suitable internal key is not available, a UUID MAY be used.
     */
    public void setID(String id) {
        this.id = id;
    }
}

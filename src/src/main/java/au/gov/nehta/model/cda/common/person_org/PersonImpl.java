package au.gov.nehta.model.cda.common.person_org;

import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PersonWithOrganization;

import java.util.List;

public class PersonImpl implements Person, PeronWithRelationship, PersonWithOrganization, PersonSubjectOfCare,
                                   PersonDispenser, PersonPrescriberInstructionRecipient, PersonPrescriber,
                                   PersonConsumer, PersonHealthcareProvider {

    private List<UniqueIdentifier> identifiers;
    private RelationshipRoleType relationshipRoleType;
    private List<PersonName> personNames;
    private Gender gender;
    private List<Entitlement> entitlements;
    private String qualifications;
    private Occupation occupation;
    private EmploymentOrganization employmentOrganization;
    private PreciseDate dateOfBirth;

    @Override
    public RelationshipRoleType getRelationshipToSubjectOfCare() {
        return relationshipRoleType;
    }

    @Override
    public void setRelationshipToSubjectOfCare(RelationshipRoleType relationshipRoleType) {
        this.relationshipRoleType = relationshipRoleType;
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

    @Override
    public Gender getGender() {
        return gender;
    }

    @Override
    public void setGender(Gender gender) {
        this.gender = gender;
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

    @Override
    public Occupation getOccupation() {
        return occupation;
    }

    @Override
    public void setOccupation(Occupation occupation) {
        this.occupation = occupation;
    }

    @Override
    public EmploymentOrganization getEmploymentOrganisation() {
        return employmentOrganization;
    }

    @Override
    public void setEmploymentOrganisation(EmploymentOrganization employmentOrganisation) {
        this.employmentOrganization = employmentOrganisation;
    }

    @Override
    public PreciseDate getDateOfBirth() {
        return dateOfBirth;
    }

    @Override
    public void setDateOfBirth(PreciseDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}

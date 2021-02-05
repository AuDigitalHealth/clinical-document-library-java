package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.UUID;

import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.HPIO;

public abstract class OrganisationParticipantImpl extends ParticipantImpl implements OrganisationParticipant {
    protected HPIO entityIdentifier;
    protected Organisation organisation;
    protected String healthCareFacilityID = UUID.randomUUID().toString();
    
    @Override
    public HPIO getEntityIdentifiers() {
        return entityIdentifier;
    }

    @Override
    public Organisation getOrganisation() {
        return organisation;
    }

    /**
     * Defaults to a Random UUID if not explicitly set
     **/
    @Override
    public String getHealthCareFacilityID() {
        return healthCareFacilityID;
    }


    public void setHealthCareFacilityID(String healthCareFacilityID) {
        this.healthCareFacilityID = healthCareFacilityID;
    }
}

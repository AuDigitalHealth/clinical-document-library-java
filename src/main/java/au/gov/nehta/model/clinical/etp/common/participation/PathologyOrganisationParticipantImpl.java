package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.Organisation;

public abstract class PathologyOrganisationParticipantImpl extends ParticipantImpl implements PathologyOrganisationParticipant {
    protected  AsEntityIdentifier entityIdentifier;
    protected Organisation organisation;
    
    @Override
    public AsEntityIdentifier getEntityIdentifiers() {
        return entityIdentifier;
    }

    @Override
    public Organisation getOrganisation() {
        return organisation;
    }

}

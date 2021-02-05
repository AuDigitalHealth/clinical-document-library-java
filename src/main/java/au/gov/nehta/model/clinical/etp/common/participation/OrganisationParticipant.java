package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.HPIO;

public interface OrganisationParticipant extends Participant{
    public HPIO getEntityIdentifiers();
    public Organisation getOrganisation();
    
    public String getHealthCareFacilityID();
}

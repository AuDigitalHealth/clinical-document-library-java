package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface PathologyOrganisationParticipant extends Participant{
    public AsEntityIdentifier getEntityIdentifiers();
    public Organisation getOrganisation();
    public UniqueIdentifier getRoleId();
    
    /**
     * The involvement or role of the participant in the related action from a
     * healthcare perspective rather than the specific participation perspective.
     * Role SHOULD have a value representing the type of Healthcare Facility
     * e.g. Hospital, Clinic.  
     */
    public Coded getHealthcareFacilityType();
}

package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.Role;

public interface DispensingOrganisationParticipation {
    public Role getRole();

    public DispensingOrganisationParticipant getParticipant();
}

package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.Role;

public interface PrescriberOrganisationParticipation {

    Role getRole();

    PrescriberOrganisationParticipant getParticipant();
}

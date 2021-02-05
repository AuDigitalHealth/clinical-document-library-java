package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.Role;

public class PrescriberOrganisationParticipationImpl implements PrescriberOrganisationParticipation {
    private Role role;
    private PrescriberOrganisationParticipant participant;

    public PrescriberOrganisationParticipationImpl(Role role, PrescriberOrganisationParticipant participant) {
        ArgumentUtils.checkNotNull(role, "role");
        ArgumentUtils.checkNotNull(participant, "participant");
        this.role = role;
        this.participant = participant;
    }

    public Role getRole() {
        return role;
    }

    public PrescriberOrganisationParticipant getParticipant() {
        return participant;
    }
}

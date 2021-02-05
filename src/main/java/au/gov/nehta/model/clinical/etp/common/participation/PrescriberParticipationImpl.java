package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.Role;

public class PrescriberParticipationImpl implements PrescriberParticipation {

    private Role role;
    private DefaultParticipant participant;

    public PrescriberParticipationImpl(Role role, DefaultParticipant participant) {
        ArgumentUtils.checkNotNull(role, "role");
        ArgumentUtils.checkNotNull(participant, "participant");
        this.role = role;
        this.participant = participant;
    }

    public Role getRole() {
        return role;
    }

    public DefaultParticipant getParticipant() {
        return participant;
    }
}

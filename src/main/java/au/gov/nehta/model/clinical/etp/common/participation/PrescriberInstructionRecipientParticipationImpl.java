package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.Role;

public class PrescriberInstructionRecipientParticipationImpl implements PrescriberInstructionRecipientParticipation {
	private Role role;
	private PrescriberInstructionRecipientParticipant participant;

	public PrescriberInstructionRecipientParticipationImpl( Role role, PrescriberInstructionRecipientParticipant participant ) {
		ArgumentUtils.checkNotNull( role, "role" );
		ArgumentUtils.checkNotNull( participant, "participant" );
		this.role = role;
		this.participant = participant;
	}


	public Role getRole() {
		return role;
	}

	public PrescriberInstructionRecipientParticipant getParticipant() {
		return participant;
	}
}

package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.types.HPII;

public class PrescriberInstructionRecipientParticipantImpl extends QualifiedParticipantImpl implements PrescriberInstructionRecipientParticipant {

    private PrescriberInstructionRecipientPerson person;

    public PrescriberInstructionRecipientParticipantImpl(HPII entityIdentifier, PrescriberInstructionRecipientPerson person) {
        ArgumentUtils.checkNotNull(entityIdentifier, "entityIdentifier");
        ArgumentUtils.checkNotNull(person, "person");
        this.entityIdentifier = entityIdentifier;
        this.person = person;
    }

    public PrescriberInstructionRecipientPerson getPerson() {
        return person;
    }
}

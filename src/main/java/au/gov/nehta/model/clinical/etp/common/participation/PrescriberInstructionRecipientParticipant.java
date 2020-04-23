package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.types.HPII;

public interface PrescriberInstructionRecipientParticipant extends QualifiedParticipant{
    public HPII getEntityIdentifiers();

    public PrescriberInstructionRecipientPerson getPerson();
}

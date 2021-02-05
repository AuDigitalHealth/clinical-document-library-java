package au.gov.nehta.model.cda.etp;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

import java.time.ZonedDateTime;

public class PrescriptionRequestCdaModel extends CDAModelImpl {
    private ZonedDateTime prescriberInstructionAssignedAuthorTime;
    private String prescriberInstructionRecipientParticipantId;

    public PrescriptionRequestCdaModel(BaseClinicalDocument clinicalDocument,
                                       LegalAuthenticator legalAuthenticator,
                                       Custodian custodian,
                                       String assignedAuthorId,
                                       String prescriberInstructionAssignedAuthorId,
                                       ZonedDateTime prescriberInstructionAssignedAuthorTime,
                                       String prescriberInstructionRecipientParticipantId) {

        super(clinicalDocument, legalAuthenticator, custodian);

        this.prescriberInstructionAssignedAuthorTime = prescriberInstructionAssignedAuthorTime;
        this.prescriberInstructionRecipientParticipantId = prescriberInstructionRecipientParticipantId;
    }

    public ZonedDateTime getPrescriberInstructionAuthorTime() {
        return prescriberInstructionAssignedAuthorTime;
    }

    public String getPrescriberInstructionRecipientParticipantId() {
        return prescriberInstructionRecipientParticipantId;
    }
}

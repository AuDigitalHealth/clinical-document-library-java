package au.gov.nehta.model.cda.etp;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

public class PrescriptionRequestCdaModel extends CDAModelImpl{
	private DateTime prescriberInstructionAssignedAuthorTime;
	private String prescriberInstructionRecipientParticipantId;

	public PrescriptionRequestCdaModel( BaseClinicalDocument clinicalDocument, LegalAuthenticator legalAuthenticator, Custodian custodian,String assignedAuthorId,
			 String prescriberInstructionAssignedAuthorId, DateTime prescriberInstructionAssignedAuthorTime, String prescriberInstructionRecipientParticipantId ) {
	    super(clinicalDocument,legalAuthenticator,custodian);
	
		this.prescriberInstructionAssignedAuthorTime = prescriberInstructionAssignedAuthorTime ; 
		this.prescriberInstructionRecipientParticipantId = prescriberInstructionRecipientParticipantId;
	}

	public DateTime getPrescriberInstructionAuthorTime() {
		return  prescriberInstructionAssignedAuthorTime  ;  
	}

	public String getPrescriberInstructionRecipientParticipantId() {
		return prescriberInstructionRecipientParticipantId;
	}
}

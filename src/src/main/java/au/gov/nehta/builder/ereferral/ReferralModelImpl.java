package au.gov.nehta.builder.ereferral;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.common.CDAModelImpl;

public class ReferralModelImpl extends CDAModelImpl implements ReferralModel {
	private ReferralAuthor author;
	private ReferralParticipant participant;
	private SubjectOfCareParticipant soc;
	
	public ReferralModelImpl(ClinicalDocument document, SubjectOfCareParticipant subjectOfCare, ReferralAuthor author, ReferralParticipant participant, Custodian custodian){
		super(document, null, custodian);
		this.author=author;
		this.participant=participant;
		this.soc = subjectOfCare;
		
	}
	
	public ClinicalDocument getClinicalDocument(){
		return (ClinicalDocument) clinicalDocument;
	}
	
	@Override
	public ReferralAuthor getAuthor() {
		return author;
	}

	public void setAuthor(ReferralAuthor author) {
		this.author = author;
	}

	@Override
	public ReferralParticipant getReferee() {
		return participant;
	}

	public void setParticipant(ReferralParticipant participant) {
		this.participant = participant;
	}

	@Override
	public SubjectOfCareParticipant getSubjectOfCare() {
		return soc;
	}

	public void setSoc(SubjectOfCareParticipant soc) {
		this.soc = soc;
	}
	
}

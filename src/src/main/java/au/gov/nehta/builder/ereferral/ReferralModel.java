package au.gov.nehta.builder.ereferral;

import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.common.CDAModel;

public interface ReferralModel extends CDAModel {

	public abstract ClinicalDocument getClinicalDocument();
	
	public abstract ReferralAuthor getAuthor();

	public abstract ReferralParticipant getReferee();

	public abstract SubjectOfCareParticipant getSubjectOfCare();

}
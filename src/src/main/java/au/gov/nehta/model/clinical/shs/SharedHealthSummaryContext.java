package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public interface SharedHealthSummaryContext {
	public SubjectOfCareParticipant getSubjectOfCare();
	public SharedHealthSummaryAuthor getDocumentAuthor();
}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public interface EventSummaryContext {

    DocumentAuthor getDocumentAuthor();

    SubjectOfCareParticipant getSubjectOfCare();

    RestrictedTimeInterval getEncounterPeriod();

}

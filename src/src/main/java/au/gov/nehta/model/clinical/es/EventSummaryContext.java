package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public interface EventSummaryContext {


    EventSummaryAuthor getDocumentAuthor();

    SubjectOfCareParticipant getSubjectOfCare();

    RestrictedTimeInterval getEncounterPeriod();

    //TODO DateTime Attested  (As per CDA Implementation Guide)

    //TODO Validation (See .net implementation) -  Validate the CDA Context for this EventSummary

}

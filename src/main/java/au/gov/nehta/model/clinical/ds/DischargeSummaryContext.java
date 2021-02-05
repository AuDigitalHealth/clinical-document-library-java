package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public interface DischargeSummaryContext {

    DocumentAuthor getDocumentAuthor();

    SubjectOfCareParticipant getSubjectOfCare();

    ParticipationServiceProvider getFacility();

    RestrictedTimeInterval getEncounterPeriod();

    PreciseDate getDateTimeAttested();

    String getCareSetting();

    void setDocumentAuthor(DocumentAuthor documentAuthor);

    void setSubjectOfCareParticipant(SubjectOfCareParticipant subjectOfCareParticipant);

    void setFacility(ParticipationServiceProvider facility);

    void setEncounterPeriod(RestrictedTimeInterval encounterPeriod);

    void setDateTimeAttested(PreciseDate dateTimeAttested);

    void setCareSetting(String careSetting);
}

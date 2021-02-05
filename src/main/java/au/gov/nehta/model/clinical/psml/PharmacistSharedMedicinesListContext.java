package au.gov.nehta.model.clinical.psml;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public interface PharmacistSharedMedicinesListContext {

    DocumentAuthor getDocumentAuthor();

    void setDocumentAuthor(DocumentAuthor documentAuthor);

    SubjectOfCareParticipant getSubjectOfCare();

    void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare);

    PreciseDate getDateTimeAuthored();

    void setDateTimeAuthored(PreciseDate dateTimeAuthored);

    void setDateTimeAttested(PreciseDate dateTimeAttested);

    PreciseDate getDateTimeAttested();

    ParticipationServiceProvider getParticipant();

    void setParticipant(ParticipationServiceProvider participant);

    ParticipationServiceProvider getFacility();

    void setFacility(ParticipationServiceProvider participationServiceProvider);
}

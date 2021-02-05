package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.clinical.common.participation.PersonName;

public interface SubjectOfCarePerson {
    PersonName getPersonName();

    SubjectOfCareDemographicData getDemographicData();
}

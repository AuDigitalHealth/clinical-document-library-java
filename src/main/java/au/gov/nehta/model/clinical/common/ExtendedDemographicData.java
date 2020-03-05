package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.clinical.common.participation.CountryState;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;

public interface ExtendedDemographicData extends SubjectOfCareDemographicData {
    DateOfDeath getDateOfDeath();
    String getMothersOriginalFamilyName();
    CountryState getBirthPlace();
}

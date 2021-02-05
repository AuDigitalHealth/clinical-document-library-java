package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetail;
import au.gov.nehta.model.clinical.common.participation.IndigenousStatus;
import au.gov.nehta.model.clinical.common.participation.Sex;

public interface SubjectOfCareDemographicData {
    Sex getSex();

    DateOfBirthDetail getDateOfBirthDetail();

    int getAgeInYears();

    Boolean isAgeAccurate();

    Integer getBirthPlurality();

    Integer getBirthOrder();

    IndigenousStatus getIndigenousStatus();

    void setAgeAccurate(Boolean isAgeAccurate);

    void setAgeInYears(int ageDetail);

    void setBirthPlurality(Integer birthPlurality);

    void setBirthOrder(Integer birthOrder);

    void setIndigenousStatus(IndigenousStatus indigenousStatus);
}

package au.gov.nehta.model.clinical.common;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetail;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetailImpl;
import au.gov.nehta.model.clinical.common.participation.IndigenousStatus;
import au.gov.nehta.model.clinical.common.participation.Sex;

import java.time.ZonedDateTime;
import java.time.temporal.ChronoUnit;

public class SubjectOfCareDemographicDataImpl implements SubjectOfCareDemographicData {
    private Sex sex;
    private DateOfBirthDetail dateOfBirthDetail;
    private int age;
    private Boolean isAgeAccurate;
    private Integer birthPlurality;
    private Integer birthOrder;
    private IndigenousStatus indigenousStatus;

    public SubjectOfCareDemographicDataImpl() {
    }

    /**
     * This is a convenience constructor that will calculate the age from the date of birth
     *
     * @param sex
     * @param dateOfBirthDetail
     */
    public SubjectOfCareDemographicDataImpl(Sex sex, DateOfBirthDetail dateOfBirthDetail) {
        ArgumentUtils.checkNotNull(sex, "sex");
        ArgumentUtils.checkNotNull(dateOfBirthDetail, "Date Of Birth Detail ");
        this.sex = sex;
        this.dateOfBirthDetail = dateOfBirthDetail;
        setAgeFromDOB();
        isAgeAccurate = true;
    }

    /**
     * This is a constructor that will calculate the dateOfBirth from an age in years.
     * It will also set Age accuracy UUA and the DOBIsCalculatedFromAge flag
     *
     * @param sex
     * @param age
     */
    public SubjectOfCareDemographicDataImpl(Sex sex, int age) {
        ArgumentUtils.checkNotNull(sex, "sex");
        this.sex = sex;
        this.dateOfBirthDetail = new DateOfBirthDetailImpl(age);
    }

    public Sex getSex() {
        return sex;
    }

    public DateOfBirthDetail getDateOfBirthDetail() {
        return dateOfBirthDetail;
    }

    public int getAgeInYears() {
        return age;
    }

    public Integer getBirthPlurality() {
        return birthPlurality;
    }

    public Integer getBirthOrder() {
        return birthOrder;
    }

    public IndigenousStatus getIndigenousStatus() {
        return indigenousStatus;
    }

    public void setIndigenousStatus(IndigenousStatus indigenousStatus) {
        this.indigenousStatus = indigenousStatus;
    }

    public void setBirthPlurality(Integer birthPlurality) {
        ArgumentUtils.checkNotNull(birthPlurality, "birthPlurality");
        this.birthPlurality = birthPlurality;
    }

    public void setBirthOrder(Integer birthOrder) {
        ArgumentUtils.checkNotNull(birthOrder, "birthOrder");
        this.birthOrder = birthOrder;
    }

    public void setAgeInYears(int ageInYears) {
        this.age = ageInYears;
    }

    public int calculateAgeInYearsFromDOB(ZonedDateTime dateOfBirth) {
        ZonedDateTime now = ZonedDateTime.now().plus(1L, ChronoUnit.DAYS);
        return (int) ChronoUnit.YEARS.between(dateOfBirth.toLocalDate(), now.toLocalDate());
    }

    public void setAgeFromDOB() {
        this.age = calculateAgeInYearsFromDOB(dateOfBirthDetail.getDateOfBirth().getDateTime());
    }

    @Override
    public Boolean isAgeAccurate() {
        return isAgeAccurate;
    }

    @Override
    public void setAgeAccurate(Boolean isAgeAccurate) {
        this.isAgeAccurate = isAgeAccurate;
    }
}

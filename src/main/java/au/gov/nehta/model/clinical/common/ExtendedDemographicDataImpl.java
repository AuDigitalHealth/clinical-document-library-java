package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.clinical.common.participation.CountryState;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetail;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;
import au.gov.nehta.model.clinical.common.participation.Sex;

public class ExtendedDemographicDataImpl extends SubjectOfCareDemographicDataImpl implements ExtendedDemographicData {

    private DateOfDeath dateOfDeath;
    private String mothersOriginalFamilyName;
    private CountryState birthPlace;
    
    public ExtendedDemographicDataImpl() {
    }
    
    /**
     * This is a convenience constructor that will calculate the age from the date of birth
     * 
     * @param sex
     * @param dateOfBirthDetail
     */
    public ExtendedDemographicDataImpl( Sex sex, DateOfBirthDetail dateOfBirthDetail ) {
        super(sex,dateOfBirthDetail);
    }
    
    /**
     * This is a constructor that will calculate the dateOfBirth from an age in years.
     * It will also set Age accuracy UUA and the DOBIsCalucaltedFromAge flag
     * 
     * @param sex
     * @param dateOfBirthDetail
     */
    public ExtendedDemographicDataImpl( Sex sex, int age ) {
        super(sex,age);
    }
    
    
    @Override
    public DateOfDeath getDateOfDeath() {
        return dateOfDeath;
    }

    public void setDateOfDeath( DateOfDeath dateOfDeath ) {
        this.dateOfDeath = dateOfDeath;
    }

    public String getMothersOriginalFamilyName() {
        return mothersOriginalFamilyName;
    }

    public void setMothersOriginalFamilyName( String mothersOriginalFamilyName ) {
        this.mothersOriginalFamilyName = mothersOriginalFamilyName;
    }

    public CountryState getBirthPlace() {
        return birthPlace;
    }

    public void setBirthPlace( CountryState birthPlace ) {
        this.birthPlace = birthPlace;
    }

}

package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.clinical.common.participation.PersonName;

public class ExtendedSubjectOfCarePerson extends SubjectOfCarePersonImpl implements  SubjectOfCarePerson{
    public ExtendedSubjectOfCarePerson( PersonName personName, ExtendedDemographicData demographicData ) {
        super( personName, demographicData);
        
    }

    @Override
    public ExtendedDemographicData getDemographicData() {
        return (ExtendedDemographicData) super.getDemographicData();
    }
    
    

}

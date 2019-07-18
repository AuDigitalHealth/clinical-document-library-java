package au.gov.nehta.model.clinical.common;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.PersonName;

public class SubjectOfCarePersonImpl implements SubjectOfCarePerson {
	private PersonName personName;
	private SubjectOfCareDemographicData demographicData;

	public SubjectOfCarePersonImpl( PersonName personName, SubjectOfCareDemographicData demographicData ) {
		ArgumentUtils.checkNotNull( personName, "personName" );
		ArgumentUtils.checkNotNull( demographicData, "demographicData" );
		this.personName = personName;
		this.demographicData = demographicData;
	}

	public PersonName getPersonName() {
		return personName;
	}

	public SubjectOfCareDemographicData getDemographicData() {
		return demographicData;
	}
}

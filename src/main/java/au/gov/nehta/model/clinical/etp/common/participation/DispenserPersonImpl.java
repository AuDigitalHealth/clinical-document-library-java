package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.PersonName;

public class DispenserPersonImpl implements DispenserPerson {
	private PersonName personName;
	private ProviderIndividualDemographicData demographicData;

	public DispenserPersonImpl( PersonName personName, ProviderIndividualDemographicData demographicData ) {
		ArgumentUtils.checkNotNull( personName, "personName" );
		ArgumentUtils.checkNotNull( demographicData, "demographicData" );
		this.personName = personName;
		this.demographicData = demographicData;
	}

	public PersonName getPersonName() {
		return personName;
	}

	public ProviderIndividualDemographicData getProviderIndividualDemographicData() {
		return demographicData;
	}
}

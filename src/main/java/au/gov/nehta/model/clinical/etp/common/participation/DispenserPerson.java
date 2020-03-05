package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.PersonName;

public interface DispenserPerson {
	public PersonName getPersonName();

	public ProviderIndividualDemographicData getProviderIndividualDemographicData();
}
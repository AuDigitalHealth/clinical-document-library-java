package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.Sex;

public interface ProviderIndividualDemographicData {
	Sex getSex();

	ProviderIndividualDateOfBirthDetail getDateOfBirthDetail();
}

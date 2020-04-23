package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.Sex;

public class ProviderIndividualDemographicDataImpl implements ProviderIndividualDemographicData {
	private Sex sex;
	private ProviderIndividualDateOfBirthDetail dateOfBirthDetail;

	public ProviderIndividualDemographicDataImpl( Sex sex, ProviderIndividualDateOfBirthDetail dateOfBirthDetail ) {
		ArgumentUtils.checkNotNull( sex, "sex" );
		ArgumentUtils.checkNotNull( dateOfBirthDetail, "dateOfBirthDetail" );
		this.sex = sex;
		this.dateOfBirthDetail = dateOfBirthDetail;
	}

	public Sex getSex() {
		return sex;
	}

	public ProviderIndividualDateOfBirthDetail getDateOfBirthDetail() {
		return dateOfBirthDetail;
	}
}

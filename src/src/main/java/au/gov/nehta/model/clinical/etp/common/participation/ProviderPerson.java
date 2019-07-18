package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.PersonName;

public interface ProviderPerson {
	public PersonName getPersonName();

	public ProviderEmploymentDetail getEmploymentDetail();

	// ProviderIndividualDemographicData getDemographicData();
	public void setEmploymentDetail( ProviderEmploymentDetail prescriberEmploymentDetail );
}

package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.PersonName;

public class ProviderPersonImpl implements ProviderPerson {
	private PersonName personName;
	private ProviderEmploymentDetail employmentDetail;


    public ProviderPersonImpl( PersonName personName ) {
        ArgumentUtils.checkNotNull( personName, "personName" );
        this.personName = personName;
    }

	public PersonName getPersonName() {
		return personName;
	}

	public ProviderEmploymentDetail getEmploymentDetail() {
		return employmentDetail;
	}


	public void setEmploymentDetail( ProviderEmploymentDetail employmentDetail ) {
		ArgumentUtils.checkNotNull( employmentDetail, "employmentDetail" );
		this.employmentDetail = employmentDetail;
	}
}

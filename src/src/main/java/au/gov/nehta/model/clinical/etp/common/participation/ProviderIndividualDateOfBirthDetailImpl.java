package au.gov.nehta.model.clinical.etp.common.participation;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;

public class ProviderIndividualDateOfBirthDetailImpl extends PrecisionDate implements ProviderIndividualDateOfBirthDetail {

    public ProviderIndividualDateOfBirthDetailImpl( DateTime dateOfBirth ) {
		super(Precision.DAY, dateOfBirth);
	}

    @Override
    public DateTime getDateOfBirth() {
        return this.getDateTime();
    }

}

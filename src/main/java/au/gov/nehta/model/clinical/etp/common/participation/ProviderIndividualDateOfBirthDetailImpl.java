package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;

import java.time.ZonedDateTime;

public class ProviderIndividualDateOfBirthDetailImpl extends PrecisionDate implements ProviderIndividualDateOfBirthDetail {

    public ProviderIndividualDateOfBirthDetailImpl(ZonedDateTime dateOfBirth) {
        super(Precision.DAY, dateOfBirth);
    }

    @Override
    public ZonedDateTime getDateOfBirth() {
        return this.getDateTime();
    }
}

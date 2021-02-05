package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.participation.Occupation;
import au.gov.nehta.model.clinical.common.participation.OccupationImpl;

public class ProviderEmploymentDetailImpl implements ProviderEmploymentDetail {

    private Occupation occupation;

    public ProviderEmploymentDetailImpl(Occupation occupation) {
        ArgumentUtils.checkNotNull(occupation, "occupation");
        this.occupation = occupation;
    }

    public ProviderEmploymentDetailImpl(Coded occupation) {
        ArgumentUtils.checkNotNull(occupation, "occupation");
        this.occupation = new OccupationImpl(occupation);
    }

    public Occupation getOccupation() {
        return occupation;
    }
}

package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.PersonName;

public interface ProviderPerson {

    PersonName getPersonName();

    ProviderEmploymentDetail getEmploymentDetail();

    // ProviderIndividualDemographicData getDemographicData();
    void setEmploymentDetail(ProviderEmploymentDetail prescriberEmploymentDetail);
}

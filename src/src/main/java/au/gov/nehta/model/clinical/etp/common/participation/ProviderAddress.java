package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.AustralianAddress;

public interface ProviderAddress extends AddressContext{
    AustralianAddress getAddress();
}

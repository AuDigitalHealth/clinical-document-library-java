package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;

public interface Entitlement {

  AsEntityIdentifier getEntitlementNumber();

  void setEntitlementNumber(AsEntityIdentifier entitlementNumber);

  EntitlementType getEntitlementType();

  void setEntitlementType(EntitlementType entitlementType);

  RestrictedTimeInterval getEntitlementValidityDuration();

  void setEntitlementValidityDuration(RestrictedTimeInterval entitlementValidityDuration);
}

package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.time.ZonedDateTime;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface SpecimenDetail {

    ZonedDateTime getCollectionTime();

    UniqueIdentifier getId();
}

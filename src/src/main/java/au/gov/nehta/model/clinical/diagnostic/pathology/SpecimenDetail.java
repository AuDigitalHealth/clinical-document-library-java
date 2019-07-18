package au.gov.nehta.model.clinical.diagnostic.pathology;

import org.joda.time.DateTime;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface SpecimenDetail {

    public DateTime getCollectionTime();
    public UniqueIdentifier getId();

}

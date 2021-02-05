package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.time.ZonedDateTime;

public class SpecimenDetailImpl implements SpecimenDetail {

    private final ZonedDateTime collectionTime;
    private final UniqueIdentifier id;

    /**
     * @param collectionTime the time the specimen was collected
     * @param id             the Unique identifier of the specimen, normally assigned by the laboratory
     */
    public SpecimenDetailImpl(UniqueIdentifier id, ZonedDateTime collectionTime) {
        this.collectionTime = collectionTime;
        this.id = id;
    }

    @Override
    public ZonedDateTime getCollectionTime() {
        return collectionTime;
    }

    @Override
    public UniqueIdentifier getId() {
        return id;
    }
}

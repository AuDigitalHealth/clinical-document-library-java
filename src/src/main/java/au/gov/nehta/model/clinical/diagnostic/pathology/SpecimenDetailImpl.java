package au.gov.nehta.model.clinical.diagnostic.pathology;

import org.joda.time.DateTime;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public class SpecimenDetailImpl implements SpecimenDetail {

    private final DateTime collectionTime;
    private final UniqueIdentifier id;
    
    /**
     * 
     * @param collectionTime the time the specimen was collected
     * @param id             the Unique identifier of the specimen, normally assigned by the laboratory
     */
    public SpecimenDetailImpl( UniqueIdentifier id, DateTime collectionTime){
        this.collectionTime=collectionTime;
        this.id=id;
    }
    
    
    
    @Override
    public DateTime getCollectionTime() {
        return collectionTime;
    }



    @Override
    public UniqueIdentifier getId() {
        return id;
    }

}

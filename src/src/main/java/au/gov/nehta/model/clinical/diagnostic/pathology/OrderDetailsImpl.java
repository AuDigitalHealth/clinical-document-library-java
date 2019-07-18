package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public class OrderDetailsImpl implements OrderDetails {
    
    private Coded order;
    private UniqueIdentifier id;
    
    public OrderDetailsImpl( UniqueIdentifier id, Coded order ) {
        ArgumentUtils.checkNotNull( order, "order" );
        ArgumentUtils.checkNotNull( id, "id" );
        this.order = order;
        this.id=id;
    }
    
    
    
    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.diagnostic.pathology.OrderDetails#getOrder()
     */
    @Override
    public Coded getOrder() {
        return order;
    }
    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.diagnostic.pathology.OrderDetails#getId()
     */
    @Override
    public UniqueIdentifier getId() {
        return id;
    }
    /**
     * @param order the order to set
     */
    public void setOrder( Coded order ) {
        this.order = order;
    }
    /**
     * @param id the id to set
     */
    public void setId( UniqueIdentifier id ) {
        this.id = id;
    } 
    
    
}

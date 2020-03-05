package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface OrderDetails {

    /**
     * @return the order
     */
    public abstract Coded getOrder();

    /**
     * @return the id
     */
    public abstract UniqueIdentifier getId();

}
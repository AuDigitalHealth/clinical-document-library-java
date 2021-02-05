package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface OrderDetails {

    /**
     * @return the order
     */
    Coded getOrder();

    /**
     * @return the id
     */
    UniqueIdentifier getId();
}

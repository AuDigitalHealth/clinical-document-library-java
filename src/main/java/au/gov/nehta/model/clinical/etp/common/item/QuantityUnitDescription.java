package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.clinical.common.types.RealQuantity;

public interface QuantityUnitDescription {

    public RealQuantity getRealQuantity();
    
    /**
     * The coded value in units for this Quantity.
     * Usually this will be a SNOMED CT AU Code.
     * 
     * @return codeUnit SNOMED CT-AU Code
     */
    public Code getCodedUnit();
    
    /**
     * A free text description of the quantity involved
     * @return quantityDescription - free text description of the quantity 
     */
    public String getQuantityDescription();

}
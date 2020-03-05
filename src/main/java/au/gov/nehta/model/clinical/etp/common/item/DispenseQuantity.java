package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.clinical.common.types.RealQuantity;


/**
 * A quantity of prescription items to dispense.
 * 
 * This may be constructed with either a Real valued Physical Quantity
 * or a quanity with units specified in a particular code system.
 * <br>
 * example:
 * <pre>
 * DispenseQuantity quantity = DispenseQuantity.create( new RealQuantity(3,"tablets"));
 * 
 * or
 * 
 * DispenseQuantity quantity = DispenseQuantity.create( 3, new SNOMEDCode("foo", "units") );
 * </pre>
 * 
 * @author Nehta
 *
 */
public class DispenseQuantity {

	RealQuantity quantityToDispense;
	Code unitCode;
	
	
	private DispenseQuantity(){}
	
	private DispenseQuantity(RealQuantity quantityToDispense){
		this.quantityToDispense=quantityToDispense;
	}
	
	private DispenseQuantity(RealQuantity quantityToDispense, Code unitCode){
		this.quantityToDispense=quantityToDispense;
		this.unitCode=unitCode;
	}
	
		
	/**
     * Create a dispense quantity using a real valued quantity.
     * 
     * @param quantityDescription
     * @return DispenseQuantity
     */
	public static DispenseQuantity create(RealQuantity quantityWithUnits){
		return new DispenseQuantity(quantityWithUnits);
	}
	
	/**
     * Create a dispense quantity using a SNOMED CT-AU unit code
     * @param quantityDescription
     * @return DispenseQuantity
     */
	public static DispenseQuantity create(double quantity, SNOMED_AU_Code unitCode){
		return new DispenseQuantity(new RealQuantity(quantity,null), unitCode);
	}
	
	public RealQuantity getQuantityToDispense() {
		return quantityToDispense;
	}

	public void setQuantityToDispense( RealQuantity quantityToDispense ) {
		this.quantityToDispense = quantityToDispense;
	}

	public Code getUnitCode() {
		return unitCode;
	}

	public void setUnitCode( Code unitCode ) {
		this.unitCode = unitCode;
	}
	
}

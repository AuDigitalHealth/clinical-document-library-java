package au.gov.nehta.model.clinical.common.types;


/**
 * Created to model the HL7 PQ values
 *<br>
 *
 * A dimensioned quantity expressing the result of a
 * measurement act.
 */
public class Quantity {

	protected String value;
	protected String unit;

	public Quantity( String value, String unit){
		this.unit=unit;
		this.value=value;
	}
	
	public String getValue() {
		return value;
	}
	public void setValue( String value ) {
		this.value = value;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit( String unit ) {
		this.unit = unit;
	}
	
	@Override
	public String toString() {
	    if(unit == null && value == null)
	        return "";
	    else if( unit == null)
	        return value;
	    else if (value == null)
	        return unit;
	    else
	        return value+" "+unit;
	}
	
}

package au.gov.nehta.model.clinical.common.types;

import au.gov.nehta.model.cda.common.time.TimeQuantity;

public class Ratio {

	private Quantity numerator;
	private Quantity denominator;
	

	/**
	 * A convenience method to get a ratio over 1
	 */
	public static Ratio numeratorOnly(Quantity numerator){
		Quantity denominator = new RealQuantity(1,null);
		Ratio r = new Ratio(numerator, denominator);
		return r;
	}
	
	/**
	 * A convenience method to get get a ratio of some quantity of time
	 * @return
	 */
	public static Ratio getUnitsOverTime(double value, String unit, TimeQuantity time){
		Ratio r = new Ratio( new RealQuantity(value, unit) , time );
		return r;
	}
	
	public Ratio(Quantity numerator, Quantity denominator){
		this.numerator=numerator;
		this.denominator=denominator;
	}
	
	public Quantity getNumerator() {
		return numerator;
	}

	public void setNumerator( Quantity numerator ) {
		this.numerator = numerator;
	}

	public Quantity getDenominator() {
		return denominator;
	}
	

	public void setDenominator( Quantity denominator ) {
		this.denominator = denominator;
	}
	
	@Override
	public String toString() {
	    if(denominator == null || (denominator.value.equals("1") &&denominator.unit == null)){
	        return numerator.toString();
	    }else {
            return numerator.toString()+ " / "+denominator.toString();
        }
	    
	}

}

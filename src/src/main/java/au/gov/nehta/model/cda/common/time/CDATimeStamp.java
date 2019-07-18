package au.gov.nehta.model.cda.common.time;


/**
 * Created to model CDA TS objects
 * 
 * 
 * @author NeHTA
 *
 */
public class CDATimeStamp {
	protected PreciseDate value;
	
	public PreciseDate getValue() {
		return value;
	}

	public void setValue( PreciseDate value ) {
		this.value = value;
	}

	public CDATimeStamp() {
		 
	}
	
	public CDATimeStamp(PreciseDate date){
		value=date;
	}
	
}

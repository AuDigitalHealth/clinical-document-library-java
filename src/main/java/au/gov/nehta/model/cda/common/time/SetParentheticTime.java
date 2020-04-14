package au.gov.nehta.model.cda.common.time;

import java.util.ArrayList;
import java.util.List;

/**
 * LogicalSetTime
 * <br>
 * A Class that models the combinations of time intervals in the SXPR_TS CDA HL7 datatype
 * in a logical set
 * <p>
 * A set-component that is itself made up of set of contained components that
 * are evaluated as one value.
 * <p>
 * 
 * 
 * @author NeHTA
 *
 */
public class SetParentheticTime extends SetComponentTime {

	List<? extends SetComponentTime> components;
	
	public SetParentheticTime(List<? extends SetComponentTime> components) {
		this.components = components;
	}

	public List<? extends SetComponentTime> getComponents() {
		if(components==null) components = new ArrayList<SetComponentTime>();
		return components;
	}
	
	
}

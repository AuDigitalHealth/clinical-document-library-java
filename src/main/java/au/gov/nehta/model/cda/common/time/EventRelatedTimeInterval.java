package au.gov.nehta.model.cda.common.time;

/**
 * EventRelatedTimeInterval
 * A class to model the EIVL_TS CDA class
 * 
 * Definition: Specifies a periodic interval of time where the recurrence is based on activities
 * of daily living or other important events that are time-related but not fully determined by
 * time.
 * 
 * <p>
 * 
 * event = A code for a common (periodical) activity of daily living based on which the event related
 * periodic interval is specified.
 * <p>
 * offset= An interval of elapsed time (duration, not absolute point in time) that marks the offsets for
 * the beginning, width and end of the event-related periodic interval measured from the time
 * each such event actually occurred.
 * 
 * <p>
 * Example: <br/>
	<pre>
 	Width oneHour = new Width( 1.0, TimeUnitOfMeasure.HOUR ); 
	EventCode afterDinner = EventCode.AFTER_DINNER; 
	EventRelatedTimeInterval whenToTake = new EventRelatedTimeInterval(oneHour, afterDinner);
	<pre>
 * 
 * @author NeHTA
 *
 */
public class EventRelatedTimeInterval extends SetComponentTime{

	private EventCode code;
	private TimeQuantity offset;
	
	public EventRelatedTimeInterval() {	}

	public EventRelatedTimeInterval( TimeQuantity offset, EventCode code ) {
		this.offset=offset;
		this.code=code;
	}
	
	public EventCode getCode() {
		return code;
	}

	public void setCode( EventCode code ) {
		this.code = code;
	}

	public TimeQuantity getOffset() {
		return offset;
	}

	public void setOffset( TimeQuantity offset ) {
		this.offset = offset;
	}

	
	
}


package au.gov.nehta.model.cda.common.time;

import org.joda.time.DateTime;

/**
 * A date with specified precision 
 *
 */
public interface PreciseDate {

	/**
	 * @return Precision the precision relevant to this date
	 */
	public Precision getPrecision();

	/* The Joda DateTime */
	public DateTime getDateTime();

	/**
	 * Return a string representation using the narrative form of formatter specified
	 * in the Precision 
	 */
	public String toNarrativeForm();

}
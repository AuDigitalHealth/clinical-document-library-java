package au.gov.nehta.model.cda.common.time;

/**
 * Analogous to the CalendarCycle supplied with CDA HL7
 * but with more information
 * @author NeHTA
 *
 */
public enum CalendarCycleCode {


    /// <summary>
    /// year
    /// </summary>
	YEAR("CY","year"),

    /// <summary>
    /// Form the set-difference.
    /// </summary>
    MONTH_OF_THE_YEAR("MY","month of the year"),

    /// <summary>
    /// month (continuous)
    /// </summary>
    MONTH_CONTINUOUS("CM","month (continuous)"),

    /// <summary>
    /// week (continuous)
    /// </summary>
    WEEK_CONTINUOUS("CW","week (continuous)"),

    /// <summary>
    /// week of the year
    /// </summary>
    WEEK_OF_THE_YEAR("WY","week of the year"),

    /// <summary>
    /// day of the month
    /// </summary>
    DAY_OF_THE_MONTH("DM","day of the month"),

    /// <summary>
    /// day (continuous)
    /// </summary>
    DAY_CONTINUOUS("CD","day (continuous)"),

    /// <summary>
    /// day of the year
    /// </summary>
    DAY_OF_THE_YEAR("DY","day of the year"),

    /// <summary>
    /// day of the week (begins with Monday
    /// </summary>
    DAY_OF_THE_WEEK_BEGINING_WITH_MONDAY("DW","day of the week (begins with Monday)"),

    /// <summary>
    /// hour of the day
    /// </summary>
    HOUR_OF_THE_DAY("HD","hour of the day"),

    /// <summary>
    /// hour (continuous)
    /// </summary>
    HOUR_CONTINUOUS("DW","hour (continuous)"),

    /// <summary>
    /// minute of the hour
    /// </summary>
    MINUTE_OF_THE_HOUR("NH","minute of the hour"),

    /// <summary>
    /// minute (continuous)
    /// </summary>
    MINUTE_CONTINUOUS("CN","minute (continuous)"),

    /// <summary>
    /// second of the minute
    /// </summary>
    SECOND_OF_THE_MINUTE("SN","second of the minute"),

    /// <summary>
    /// second (continuous)
    /// </summary>
    SECOND_CONTINUOUS("CS","second (continuous)");

    private String code;
	private String name;
    

	private CalendarCycleCode(String code, String name){
    	this.code=code;
    	this.name=name;
    }
	
	public String getCode() {
		return code;
	}

	public void setCode( String code ) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName( String name ) {
		this.name = name;
	}

	
}

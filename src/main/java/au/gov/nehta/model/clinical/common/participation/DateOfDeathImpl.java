package au.gov.nehta.model.clinical.common.participation;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;


/**
 * Details of the accuracy and value of a person's date of death.
 */
public class DateOfDeathImpl extends PrecisionDate implements DateOfDeath {
    final private DateAccuracy accuracy;
    final private Coded deathNotificationSource;
    
    /**
     * DateOfDeath
     * @param date The date or date and time at which a person was estimated or certified to have died.
     * @param accuracy The level of certainty or estimation of a person's date of death.
     * @param deathNotificationSource The person, location, organisation or other originator of information relating to the date of death.
     * 								@see SourceOfDeathNotification
     */
    public DateOfDeathImpl(DateTime date, DateAccuracy accuracy, Coded deathNotificationSource ){
        super(Precision.DAY, date);
        this.accuracy=accuracy;
        this.deathNotificationSource = deathNotificationSource;
    }
    
    /**
     * DateOfDeath
     * @param date The date or date and time at which a person was estimated or certified to have died.
     * @param accuracy The level of certainty or estimation of a person's date of death.
     */
    public DateOfDeathImpl(DateTime date, DateAccuracy accuracy  ){
        super(Precision.DAY, date);
        this.accuracy=accuracy;
        this.deathNotificationSource=null;
    }
    
    /* (non-Javadoc)
	 * @see au.gov.nehta.model.clinical.common.participation.DateOfDeath#getDateOfDeathAccuracyIndicator()
	 */
    @Override
	public DateAccuracy getDateOfDeathAccuracyIndicator(){
        return accuracy;
    }

    /* (non-Javadoc)
	 * @see au.gov.nehta.model.clinical.common.participation.DateOfDeath#getDeathNotificationSource()
	 */
    @Override
	public Coded getDeathNotificationSource() {
        return deathNotificationSource;
    }

   
}

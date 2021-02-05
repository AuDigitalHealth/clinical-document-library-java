package au.gov.nehta.model.clinical.common.participation;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;

public interface DateOfDeath extends PreciseDate {

    /**
     * The date or date and time at which a person was estimated or certified to have died.
     */
    DateAccuracy getDateOfDeathAccuracyIndicator();

    /**
     * The person, location, organisation or other originator of information relating to the date of death.
     *
     * @see SourceOfDeathNotification
     */
    Coded getDeathNotificationSource();
}

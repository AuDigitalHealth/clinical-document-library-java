package au.gov.nehta.model.cda.common.time;

import java.time.ZonedDateTime;

/**
 * A date with specified precision
 */
public interface PreciseDate {

    /**
     * @return Precision the precision relevant to this date
     */
    Precision getPrecision();

    /* The ZonedDateTime */
    ZonedDateTime getDateTime();

    /**
     * Return a string representation using the narrative form of formatter specified
     * in the Precision
     */
    String toNarrativeForm();
}

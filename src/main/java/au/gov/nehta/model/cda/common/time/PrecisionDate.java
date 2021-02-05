/*
 * Copyright 2011 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package au.gov.nehta.model.cda.common.time;

import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;

/**
 * PrecisionDate
 * <p>
 * A Java Time ZonedDateTime that also holds a Precision type indicating the accuracy of the date.
 */
public class PrecisionDate implements PreciseDate {

    private final ZonedDateTime DateTime;

    private Precision precision;

    /**
     * Create a Date with a Precision <br/> The default constructor creates dates with seconds
     * precision, ie:yyyyMMddHHmmssZ
     * <p>
     * For other precise date use Precision(Precision p) or Precision(Precision p, long
     * timeInMilliseconds)
     *
     * @see Precision
     */
    public PrecisionDate() {
        precision = Precision.SECOND; // full precision if you don't specify
        DateTime = ZonedDateTime.now();
    }

    /**
     * Constructed with a default precision of seconds
     *
     * @param timeInMilliseconds the milliseconds since January 1, 1970, 00:00:00 GMT.
     * @see java.lang.System#currentTimeMillis()
     */
    public PrecisionDate(long timeInMilliseconds) {
        DateTime = ZonedDateTime.ofInstant(Instant.ofEpochMilli(timeInMilliseconds), ZoneId.systemDefault());
        precision = Precision.SECOND;
    }

    /**
     * Construct a date with the specified precision
     *
     * @param timeInMilliseconds the milliseconds since January 1, 1970, 00:00:00 GMT.
     * @param timePrecision      the amount of time to use. eg: Precision.day indicating that hours,
     *                           minutes and seconds are to be ignored
     * @see java.lang.System#currentTimeMillis()
     */
    public PrecisionDate(Precision timePrecision, long timeInMilliseconds) {
        DateTime = ZonedDateTime.ofInstant(Instant.ofEpochMilli(timeInMilliseconds), ZoneId.systemDefault());
        precision = timePrecision;
    }

    /**
     * * Construct a date with the specified precision equivalent to this(timePrecision,
     * date.getTime())
     *
     * @param timePrecision the amount of time to use. eg: Precision.day indicating that hours,
     *                      minutes and seconds are to be ignored
     * @see java.lang.System#currentTimeMillis()
     */
    public PrecisionDate(Precision timePrecision, ZonedDateTime date) {
        DateTime = date;
        precision = timePrecision;
    }

    /**
     * Constructed with a default precision of seconds
     *
     * @see java.lang.System#currentTimeMillis()
     */
    public PrecisionDate(Precision timePrecision) {
        precision = timePrecision;
        DateTime = ZonedDateTime.now();
    }

    /**
     * Convenience method to return the current date with DAY precision
     */
    public static PreciseDate today() {
        return new PrecisionDate(Precision.DAY);
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.time.PreciseDate#getPrecision()
     */
    @Override
    public Precision getPrecision() {
        return precision;
    }

    /**
     * A String representation using only the required precision in HL7 ISO 8601 format
     * <p>
     * For example, a PrecisionDate with a Precision.Day accuracy will print yyyyMMdd while a
     * PrecisionDate with a Precision.Millisecond with a millisecond accuracy will print
     * yyyyMMddHHmmss.SSSZ
     */
    @Override
    public String toString() {
        return precision.format(this.getDateTime());
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.time.PreciseDate#getDateTime()
     */
    @Override
    public ZonedDateTime getDateTime() {
        return DateTime;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.cda.common.time.PreciseDate#toNarrativeForm()
     */
    @Override
    public String toNarrativeForm() {
        return precision.narrativeForm(this.getDateTime());
    }


}
 
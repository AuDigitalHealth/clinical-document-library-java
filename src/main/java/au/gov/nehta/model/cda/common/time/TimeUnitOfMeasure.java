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

public enum TimeUnitOfMeasure {

    MILLISECOND("millisecond", "ms"),
    SECOND("second", "s"),
    MINUTE("minute", "min"),
    HOUR("hour", "h"),
    DAY("day", "d"),
    // TROPICAL_YEAR( "tropical year", "a_t" ),
    // MEAN_JULIAN_YEAR( "mean Julian year", "a_j" ),
    MEAN_GREGORIAN_YEAR("mean Gregorian year", "a_g"),
    YEAR("year", "a"),
    WEEK("week", "wk"),
    SYNODAL_MONTH("synodal month", "mo_s"),
    // MEAN_JULIAN_MONTH( "mean Julian month", "mo_j" ),
    MEAN_GREGORIAN_MONTH("mean Gregorian month", "mo_g"),
    MONTH("month", "mo");

    private String name;
    private String code;

    private TimeUnitOfMeasure(String name, String code) {
        this.name = name;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public String getCode() {
        return code;
    }
}

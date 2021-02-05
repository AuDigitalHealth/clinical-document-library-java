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

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

/**
 * An enumeration representing time accuracy
 *
 * @author NeHTA
 */
public enum Precision implements Comparable<Precision> {
    // Mental note:
    // be careful when adding new values as the ordinal value
    // will be used for comparison

    MILLISECOND("yyyyMMddHHmmss.SSSZ", "d MMM yyyy HH:mm:ss.SSS Z"),
    SECOND("yyyyMMddHHmmssZ", "d MMM yyyy HH:mm:ss Z"),
    MINUTE("yyyyMMddHHmmZ", "d MMM yyyy HH:mm Z"),
    HOUR("yyyyMMddHHZ", "d MMM yyyy HH:mm Z"),
    DAY("yyyyMMdd", "d MMM yyyy"),
    MONTH("yyyyMM", "MMM yyyy"),
    YEAR("yyyy", "yyyy");

    DateTimeFormatter format;
    DateTimeFormatter narrativeForm;

    Precision(String timeFormat, String narrativeFormat) {
        format = DateTimeFormatter.ofPattern(timeFormat);
        narrativeForm = DateTimeFormatter.ofPattern(narrativeFormat);
    }

    public String format(ZonedDateTime d) {
        return d.format(format);
    }

    public String narrativeForm(ZonedDateTime d) {
        return d.format(narrativeForm);
    }
}

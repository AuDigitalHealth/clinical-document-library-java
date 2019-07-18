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

package au.gov.nehta.model.clinical.common.participation;

/**
 * The level of certainty or estimation of a date 
 */
public class DateAccuracyImpl implements DateAccuracy {
	private final Boolean dayAccuracyIndicator;
	private final Boolean monthAccuracyIndicator;
	private final Boolean yearAccuracyIndicator;

	public DateAccuracyImpl( boolean dayAccurate, boolean monthAccurate, boolean yearAccurate ) {
		this.dayAccuracyIndicator = dayAccurate;
		this.monthAccuracyIndicator = monthAccurate;
		this.yearAccuracyIndicator = yearAccurate;
	}

	/**
	 * The accuracy of the day component of a date 
	 */
	public Boolean getDayAccuracyIndicator() {
		return dayAccuracyIndicator;
	}

	/**
	 * The accuracy of the month component of a date 
	 */
	public Boolean getMonthAccuracyIndicator() {
		return monthAccuracyIndicator;
	}

	
	
	/**
	 * The accuracy of the year component of a date 
	 */
	public Boolean getYearAccuracyIndicator() {
		return yearAccuracyIndicator;
	}
	
	
	/* Used for the narrative rendering in the UUA format */
	@Override
	public String toString() {
	    StringBuilder codeStringBuilder = new StringBuilder();

        if (getDayAccuracyIndicator()) {
            codeStringBuilder.append( "A" );
        } else {
            codeStringBuilder.append( "U" );
        }

        if (getMonthAccuracyIndicator()) {
            codeStringBuilder.append( "A" );
        } else {
            codeStringBuilder.append( "U" );
        }

        if (getYearAccuracyIndicator()) {
            codeStringBuilder.append( "A" );
        } else {
            codeStringBuilder.append( "U" );
        }
	    return codeStringBuilder.toString();
	}
}

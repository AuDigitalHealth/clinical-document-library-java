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

import org.joda.time.DateTime;
import org.joda.time.LocalDate;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;

public class DateOfBirthDetailImpl implements DateOfBirthDetail {
	private PreciseDate dateOfBirth;
	private Boolean dobCalculatedFromAge;
	private DateAccuracy accuracy;
	
	public DateOfBirthDetailImpl(){}
	
	public DateOfBirthDetailImpl( DateTime dateOfBirth, DateAccuracy accuracy ) {
		ArgumentUtils.checkNotNull( dateOfBirth, "Date Of Birth" );
		ArgumentUtils.checkNotNull( accuracy, "Date Of Birth accuracy" );
		this.dateOfBirth = new PrecisionDate(Precision.DAY, dateOfBirth);
		this.accuracy=accuracy;
	}
	
	public DateOfBirthDetailImpl( DateTime dateOfBirth ) {
        ArgumentUtils.checkNotNull( dateOfBirth, "Date Of Birth" );
        this.dateOfBirth = new PrecisionDate(Precision.DAY, dateOfBirth);
    }
	
	
	/**
	 * Create a date of birth from the age.
	 * Automatically gives an Accuracy of UUA and marks the calucatledFromAge flag as true
	 * @param age - the age of the subject in question
	 */
	public DateOfBirthDetailImpl( int age ) {
	    DateTime d = calucalteDOBFromAge(age);
        this.dateOfBirth = new PrecisionDate(Precision.DAY, d);
        accuracy = new DateAccuracyImpl( false,false,true );
        dobCalculatedFromAge=true;
    }
	
	
	public PreciseDate getDateOfBirth() {
		return dateOfBirth;
	}

	public Boolean getDateOfBirthIsCalculatedFromAge() {
		return dobCalculatedFromAge;
	}

	public DateAccuracy getDateOfBirthAccuracyIndicator() {
		return accuracy;
	}

	public void setDateOfBirthIsCalculatedFromAge( boolean dateOfBirthIsCalculatedFromAge ) {
		this.dobCalculatedFromAge = dateOfBirthIsCalculatedFromAge;
	}

	public void setDateOfBirthAccuracyIndicator( DateAccuracy dateOfBirthAccuracyIndicator ) {
		this.accuracy = dateOfBirthAccuracyIndicator;
	}
	
	public DateTime calucalteDOBFromAge(int age){
	    LocalDate dobFromAge = new LocalDate();
	    dobFromAge.minusYears( age );
        return dobFromAge.toDateTimeAtStartOfDay();
    }
}

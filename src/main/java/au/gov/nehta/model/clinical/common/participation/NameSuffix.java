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

import au.gov.nehta.model.clinical.common.types.EnumTuple;

public enum NameSuffix implements EnumTuple {
	JUNIOR( "Junior", "Jnr" ), MEMBER_OF_PARLIAMENT( "Member of Parliament", "MP" ), QUEENS_COUNSEL( "Queens Counsel", "QC" ), SENIOR( "Senior", "Snr" ), FIRST( "First", "I" ), SECOND( "Second", "II" ), THIRD(
			"Third", "III" ), FOURTH( "Fourth", "IV" ), FIFTH( "Fifth", "V" ), SIXTH( "Sixth", "VI" ), SEVENTH( "Seventh", "VII" ), EIGHTH( "Eighth", "VIII" ), NINTH( "Ninth", "IX" ), TENTH( "Tenth",
			"X" );

	private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.10220";
	private final String CODE_SYSTEM_NAME = "AS 5017 (2006) - Healthcare Client Identification: Name Suffix; AS 4846 (2006) - Healthcare Provider Identification: Name Suffix";
	private final String CODE_SYSTEM_VERSION = "2006";
	private final String descriptor;
	private final String abbreviation;

	NameSuffix( String descriptor, String abbreviation ) {
		this.descriptor = descriptor;
		this.abbreviation = abbreviation;
	}

	public String getDescriptor() {
		return descriptor;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public String getCode() {
		return descriptor;
	}

	public String getOriginalText() {
		return descriptor;
	}

	public String getCodeSystem() {
		return CODE_SYSTEM;
	}

	public String getCodeSystemName() {
		return CODE_SYSTEM_NAME;
	}

	public String getCodeSystemVersion() {
		return CODE_SYSTEM_VERSION;
	}

	public String getDisplayName() {
		return abbreviation;
	}

	public boolean hasDisplayName() {
		return true;
	}
}

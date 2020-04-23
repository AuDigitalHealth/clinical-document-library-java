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

package au.gov.nehta.model.clinical.common.types;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;

/**
 *	A wrapper around AsEntityIdentifier for convenience.
 * This implementation will automatically fill all fields except the 16 digit HPIO number
 */
public final class HPIO extends AsEntityIdentifierImpl implements AsEntityIdentifier {
	private static final String ROOT_OID = "1.2.36.1.2001.1003.0.";
	private static final String IDENTIFIER_NAME = "HPI-O";
	private static final String ASSIGNING_GEOGRAPHIC_AREA_NAME = "National Identifier";

	public HPIO( String hpioNumber ) {
		ArgumentUtils.checkNotNull( hpioNumber, "HPIO Number" );

		if (hpioNumber.length() != 16) {
			throw new IllegalArgumentException( "the hpioNumber parameter needs to be a 16 digit number" );
		}

		try {
			Long.parseLong( hpioNumber );
		} catch (NumberFormatException exception) {
			throw new IllegalArgumentException( "the hpioNumber parameter needs to be a 16 digit number" );
		}

		setRoot (ROOT_OID + hpioNumber);
		setAssigningAuthorityName(IDENTIFIER_NAME);
		setAssigningGeographicAreaName( ASSIGNING_GEOGRAPHIC_AREA_NAME );
		setAssigningGeographicAreaClassCode( PLC );
		setClassCode(CLASS_CODE_IDENT);
	}



	public String getNarrativeForm() {
		String hi = getRoot().substring( ROOT_OID.length() + 1 );
		return hi.substring( 0, 4 ) + " " + hi.substring( 4, 8 ) + " " + hi.substring( 8, 12 ) + " " + hi.substring( 12, 16 );
	}
}

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

/**
 * A codified value representing the purpose of a an address.
 *
 * @author NeHTA
 */
public enum AddressPurpose implements EnumTuple {
  BUSINESS("1", "Business", "B"),
  MAILING_OR_POSTAL("2", "Mailing or Postal", "M"),
  TEMPORARY_ACCOMMODATION("3", "Temporary Accommodation", "T"),
  RESIDENTIAL_PERMANENT("4", "Residential (permanent)", "R"),
  NOT_STATED_OR_UNKNOWN_OR_INADEQUATELY_DESCRIBED(
      "9", "Not Stated/Unknown/Inadequately Described", "U");

	private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.10264";
  private final String CODE_SYSTEM_NAME =
      "AS 5017 (2006) - Healthcare Client Identification; AS 4846 (2006) - Healthcare Provider Identification";
	private final String CODE_SYSTEM_VERSION = "2006";
	private final String code;
	private final String descriptor;
	private final String alternativeCode;

  AddressPurpose(String code, String descriptor, String alternativeCode) {
		this.descriptor = descriptor;
		this.code = code;
		this.alternativeCode = alternativeCode;
	}

  @Override
  public String getCode() {
    return code;
  }

  @Override
  public String getDescriptor() {
    return descriptor;
  }

	public String getAlternativeCode() {
		return alternativeCode;
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
		return descriptor;
	}

	public boolean hasDisplayName() {
		return true;
	}
}

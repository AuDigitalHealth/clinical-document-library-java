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

public enum PersonNameUsage implements EnumTuple {
    REGISTERED_NAME_OR_LEGAL_NAME("1", "Registered Name (Legal Name)", "L"),
    REPORTING_NAME("2", "Reporting Name", "R"),
    NEWBORN_NAME("3", "Newborn Name", "N"),
    PROFESSIONAL_OR_BUSINESS_NAME("4", "Professional or Business Name", "B"),
    MAIDEN_NAME_OR_NAME_AT_BIRTH("5", "Maiden Name (Name at birth)", "M"),
    OTHER_NAME_OR_ALIAS("8", "Other Name (Alias)", "O");

    private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.16282";
    private final String CODE_SYSTEM_NAME = "AS 5017 (2006) - Healthcare Client Identification: Name Usage; AS 4846 (2006) - Healthcare Provider Identification: Name Usage";
    private final String CODE_SYSTEM_VERSION = "2006";
    private final String code;
    private final String descriptor;
    private final String alternativeCode;

    PersonNameUsage(String code, String descriptor, String alternativeCode) {
        this.code = code;
        this.descriptor = descriptor;
        this.alternativeCode = alternativeCode;
    }

    public String getCode() {
        return code;
    }

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

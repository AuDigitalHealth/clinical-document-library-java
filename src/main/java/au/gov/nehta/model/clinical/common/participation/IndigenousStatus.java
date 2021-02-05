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

public enum IndigenousStatus implements EnumTuple {
    ABORIGINAL_BUT_NOT_TORRES_STRAIT_ISLANDER_ORGIN("1",
            "Aboriginal but not Torres Strait Islander origin"),
    TORRES_STRAIT_ISLANDER_BUT_NOT_ABORIGINAL_ORIGIN("2",
            "Torres Strait Islander but not Aboriginal origin"),
    BOTH_ABORIGINAL_AND_TORRES_STRAIT_ISLANDER_ORIGIN("3",
            "Both Aboriginal and Torres Strait Islander origin"),
    NEITHER__ABORIGINAL_NOR_TORRES_STRAIT_ISLANDER_ORIGIN("4",
            "Neither Aboriginal nor Torres Strait Islander origin"),
    NOT_STATED_OR_INADEQUATELY_DESCRIBED("9", "Not stated/inadequately described");

    private final String CODE_SYSTEM = "2.16.840.1.113883.3.879.291036"; // "1.2.36.1.2001.1001.101.104.16263";METeOR
    // Indigenous
    // Status
    private final String CODE_SYSTEM_NAME = "METeOR Indigenous Status"; // "PersonIndigenous status (METeOR id: 291036)";
    private final String CODE_SYSTEM_VERSION = null; // "TBD";
    private final String code;
    private final String descriptor;

    IndigenousStatus(String code, String descriptor) {
        this.code = code;
        this.descriptor = descriptor;
    }

    public String getCode() {
        return code;
    }

    public String getDescriptor() {
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
        return descriptor;
    }

    public boolean hasDisplayName() {
        return true;
    }
}

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

package au.gov.nehta.model.clinical.etp.eprescription;

import au.gov.nehta.model.clinical.common.types.EnumTuple;

public enum GroundsForConcurrentSupply implements EnumTuple {
    PURSUANT_TO_REGULATION_24("1",
            "Supply is in accord with Regulation 24 of the National Health (Pharmaceutical Benefits) Regulations 1960."),
    HARDSHIP_CONDITIONS_APPLY("2",
            "Supply is in accord with the Hardship conditions provision of RPBS prescribing guidelines."),
    NO_GROUNDS("3",
            "There are no grounds for concurrent supply.");

    private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.16139";
    private final String CODE_SYSTEM_NAME = "NEHTA";
    private final String CODE_SYSTEM_VERSION = "2010";
    private final String code;
    private final String descriptor;

    GroundsForConcurrentSupply(String code, String descriptor) {
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

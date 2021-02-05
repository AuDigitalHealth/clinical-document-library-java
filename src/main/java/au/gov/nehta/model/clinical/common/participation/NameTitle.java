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

public enum NameTitle implements EnumTuple {
    BROTHER("Brother", "Br"), DAME("Dame", "Dame"), DOCTOR("Doctor", "Dr"), MASTER("Master", "Mstr"), MISS("Miss", "Miss"), MISTER("Mister", "Mr"), MRS("Mrs", "Mrs"), MS("Ms", "Ms"), PROFESSOR(
            "Professor", "Prof"), REVEREND("Reverend", "Rev"), SIR("Sir", "Sir"), SISTER("Sister", "Sr");

    private static final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.10217";
    private static final String CODE_SYSTEM_NAME = "AS 5017 (2006) - Healthcare Client Identification: Name Title; AS 4846 (2006) - Healthcare Provider Identification: Name Title";
    private static final String CODE_SYSTEM_VERSION = "2006";
    private final String descriptor;
    private final String abbreviation;

    NameTitle(String descriptor, String abbreviation) {
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
}

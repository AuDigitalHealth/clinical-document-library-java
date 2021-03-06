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

public enum Sex implements EnumTuple {
    MALE("1", "Male"), FEMALE("2", "Female"),
    INTERSEX_OR_INDETERMINATE("3", "Intersex or Indeterminate"),
    NOT_STATED_OR_INADEQUATELY_DESCRIBED("9", "Not Stated / Inadequately Described");

    private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.20107";
    private final String CODE_SYSTEM_NAME = "AS 5017 (2006) - Healthcare Client Identification";
    private final String CODE_SYSTEM_VERSION = "2006";
    private final String code;
    private final String descriptor;

    Sex(String code, String descriptor) {
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

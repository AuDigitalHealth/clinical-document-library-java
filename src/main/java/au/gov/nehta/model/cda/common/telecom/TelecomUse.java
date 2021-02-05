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

package au.gov.nehta.model.cda.common.telecom;

public enum TelecomUse {
    BUSINESS("1", "Business"),
    PERSONAL("2", "Personal"),
    BUSINESS_AND_PERSONAL("3", "Both Business and Personal");

    private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.10272";
    private final String CODE_SYSTEM_NAME = "AS 5017 (2006) - Healthcare Client Identification: Electronic Communication Usage Code; AS 4846 (2006) - Healthcare Provider Identification: Electronic Communication Usage Code";
    private final String CODE_SYSTEM_VERSION = "2006";
    private final String code;
    private final String descriptor;

    TelecomUse(String code, String descriptor) {
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
}

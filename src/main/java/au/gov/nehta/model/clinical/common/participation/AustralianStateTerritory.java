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

public enum AustralianStateTerritory {
    NEW_SOUTH_WALES("1", "NSW", "New South Wales"),
    VICTORIA("2", "VIC", "Victoria"),
    QUEENSLAND("3", "QLD", "Queensland"),
    SOUTH_AUSTRALIA("3", "SA", "South Australia"),
    WESTERN_AUSTRALIA("4", "WA", "Western Australia"),
    TASMANIA("5", "TAS", "Tasmania"),
    NORTHERN_TERRITORY("3", "NT", "Northern Territory"),
    AUSTRALIAN_CAPITAL_TERRITORY("4", "ACT", "Australian Capital Territory"),
    UNKNOWN("U", "Unknown", "Unknown");

    private final String codeSystem = "1.2.36.1.2001.1001.101.103.10302";
    private final String codeSystemName = "AS 5017 (2006) - Healthcare Client Identification; AS 4846 (2006) - Healthcare Provider Identification";
    private final String codeSystemVersion = "2006";
    private final String code;
    private final String descriptor;
    private final String abbreviation;

    private AustralianStateTerritory(String code, String abbreviation, String descriptor) {
        this.code = code;
        this.abbreviation = abbreviation;
        this.descriptor = descriptor;
    }

    public String getCode() {
        return code;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public String getOriginalText() {
        return code;
    }

    public String getCodeSystem() {
        return codeSystem;
    }

    public String getCodeSystemName() {
        return codeSystemName;
    }

    public String getCodeSystemVersion() {
        return codeSystemVersion;
    }

    public String getDisplayName() {
        return code;
    }

    public boolean hasDisplayName() {
        return true;
    }

    public static AustralianStateTerritory fromAbreviation(String stateAbbreviation) {
        for (AustralianStateTerritory state : AustralianStateTerritory.values()) {
            if (state.getAbbreviation().equals(stateAbbreviation)) return state;
        }
        return AustralianStateTerritory.UNKNOWN;
    }
}

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

package au.gov.nehta.model.clinical.etp.dispenserecord;

import java.util.Collections;
import java.util.List;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;

public enum ClaimTypeCategory implements Coded {
    GENERAL_BENEFIT("1", "G - General benefit."),
    CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT("2", "C - Concessional or Safety Net Concession benefit."),
    SAFETY_NET_ENTITLEMENT_CARD_BENEFIT("3", "E - Safety Net ParticipantEntitlement Card benefit."),
    RPBS_BENEFIT("4", "R - RPBS benefit."),
    CLOSING_THE_GAP_BENEFIT("5", "CTG - Closing the Gap benefit."),
    NO_BENEFIT("9", "No Benefit - This item is not covered by any Medicare registered benefit.");

    private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16060";
    private final String CODE_SYSTEM_NAME = "Claim Category Type Values";
    //    private final String CODE_SYSTEM_VERSION = "2010";
    private String code;
    private String displayName;
    private String originalText;

    ClaimTypeCategory(String code, String displayName) {
        this.code = code;
        this.displayName = displayName;
    }

    @Override
    public String getCode() {
        return code;
    }

    @Override
    public String getCodeSystem() {
        return CODE_SYSTEM;
    }

    @Override
    public String getCodeSystemName() {
        return CODE_SYSTEM_NAME;
    }

    @Override
    public String getCodeSystemVersion() {
        return null;
    }

    @Override
    public String getDisplayName() {
        return displayName;
    }

    @Override
    public boolean isCoded() {
        return code != null;
    }

    @Override
    public String getOriginalText() {
        return originalText;
    }

    @Override
    public List<Code> getTranslations() {
        return Collections.emptyList();
    }
}

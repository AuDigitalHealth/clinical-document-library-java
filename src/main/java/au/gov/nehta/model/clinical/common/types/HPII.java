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
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;

/**
 * A wrapper around AsEntityIdentifier for convenience.
 * This implementation will automatically fill all fields except the 16 digit HPII number
 */
public final class HPII extends AsEntityIdentifierImpl implements AsEntityIdentifier {

    private static final String ROOT_OID = "1.2.36.1.2001.1003.0.";
    private static final String IDENTIFIER_NAME = "HPI-I";
    private static final String ASSIGNING_GEOGRAPHIC_AREA_NAME = "National Identifier";

    public HPII(String hpiiNumber) {
        super(ROOT_OID + hpiiNumber);
        ArgumentUtils.checkNotNull(hpiiNumber, "HPII Number");

        if (hpiiNumber.length() != 16) {
            throw new IllegalArgumentException("the hpiiNumber parameter needs to be a 16 digit number");
        }

        try {
            Long.parseLong(hpiiNumber);
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException("the hpiiNumber parameter needs to be a 16 digit number");
        }


        setAssigningAuthorityName(IDENTIFIER_NAME);
        setAssigningGeographicAreaName(ASSIGNING_GEOGRAPHIC_AREA_NAME);
        setAssigningGeographicAreaClassCode(PLC);
    }

    public String getNarrativeForm() {
        String hi = getRoot().substring(ROOT_OID.length() + 1);
        return hi.substring(0, 4) + " " + hi.substring(4, 8) + " " + hi.substring(8, 12) + " " + hi.substring(12, hi.length());
    }

    /*
     * To allow override of HPII for local Identifier for relaxed template packages
     */
    public HPII(String rootId, String hl7IdOID, String hpiiNumber, String assigningAuthorityName, String assigningGeographicAreaName, String localId, String codeType, String displayName) {
        super(rootId + hpiiNumber);
        setAssigningAuthorityName(assigningAuthorityName);
        setAssigningGeographicAreaName(assigningGeographicAreaName);
        setAssigningGeographicAreaClassCode(PLC);
        this.setExtension(localId);
        this.setCode(new CodeImpl(codeType, hl7IdOID, Coded.HL7_CODE_SYSTEM, displayName));

    }
}

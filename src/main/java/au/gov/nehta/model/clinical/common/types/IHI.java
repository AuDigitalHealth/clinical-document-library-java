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
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;


/**
 * A wrapper around AsEntityIdentifier for convenience.
 * This implementation will automatically fill all fields except the 16 digit IHI number
 */
public final class IHI extends AsEntityIdentifierImpl implements AsEntityIdentifier {
    private static final String ROOT_OID = "1.2.36.1.2001.1003.0.";
    private static final String IDENTIFIER_NAME = "IHI";
    private static final String ASSIGNING_GEOGRAPHIC_AREA_NAME = "National Identifier";
    private static final int IHI_NUMBER_LENGTH = 16;

    public IHI(String ihiNumber) {
        ArgumentUtils.checkNotNull(ihiNumber, "ihiNumber");

        if (ihiNumber.length() != IHI_NUMBER_LENGTH) {
            throw new IllegalArgumentException("the ihiNumber parameter needs to a be " + IHI_NUMBER_LENGTH + " character string");
        }

        try {
            Long.parseLong(ihiNumber);
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException("the ihiNumber parameter needs to be a " + IHI_NUMBER_LENGTH + " digit number");
        }

        setRoot(ROOT_OID + ihiNumber);
        setAssigningAuthorityName(IDENTIFIER_NAME);
        setAssigningGeographicAreaName(ASSIGNING_GEOGRAPHIC_AREA_NAME);
    }

    public String getNarrativeForm() {
        String hi = getRoot().substring(ROOT_OID.length() + 1);
        return hi.substring(0, 4) + " " + hi.substring(4, 8) + " " + hi.substring(8, 12) + " " + hi.substring(12, 16);
    }
}

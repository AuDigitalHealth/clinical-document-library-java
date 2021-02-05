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

public interface StructuredAustralianAddressLine {
    String getUnitType();

    String getUnitNumber();

    String getAddressSiteName();

    String getLevelType();

    String getLevelNumber();

    String getStreetNumber();

    String getLotNumber();

    String getStreetName();

    String getStreetType();

    String getStreetSuffix();

    String getPostalDeliveryType();

    String getPostalDeliveryNumber();

    void setUnitType(String unitType);

    void setUnitNumber(String unitNumber);

    void setAddressSiteName(String addressSiteName);

    void setLevelType(String levelType);

    void setLevelNumber(String levelNumber);

    void setStreetNumber(String streetNumber);

    void setLotNumber(String lotNumber);

    void setStreetName(String streetName);

    void setStreetType(String streetType);

    void setStreetSuffix(String streetSuffix);

    void setPostalDeliveryType(String postalDeliveryType);

    void setPostalDeliveryNumber(String postalDeliveryNumber);
}

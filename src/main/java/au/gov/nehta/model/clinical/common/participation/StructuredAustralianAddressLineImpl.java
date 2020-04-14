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


public class StructuredAustralianAddressLineImpl implements StructuredAustralianAddressLine {
	private String australianUnitType;
	private String australianUnitNumber;
	private String australianAddressSiteName;
	private String australianLevelType;
	private String australianLevelNumber;
	private String australianStreetNumber;
	private String australianLotNumber;
	private String australianStreetName;
	private String australianStreetType;
	private String australianStreetSuffix;
	private String australianPostalDeliveryType;
	private String australianPostalDeliveryNumber;

	public StructuredAustralianAddressLineImpl() {
	}

	public String getUnitType() {
		return australianUnitType;
	}

	public String getUnitNumber() {
		return australianUnitNumber;
	}

	public String getAddressSiteName() {
		return australianAddressSiteName;
	}

	public String getLevelType() {
		return australianLevelType;
	}

	public String getLevelNumber() {
		return australianLevelNumber;
	}

	public String getStreetNumber() {
		return australianStreetNumber;
	}

	public String getLotNumber() {
		return australianLotNumber;
	}

	public String getStreetName() {
		return australianStreetName;
	}

	public String getStreetType() {
		return australianStreetType;
	}

	public String getStreetSuffix() {
		return australianStreetSuffix;
	}

	public String getPostalDeliveryType() {
		return australianPostalDeliveryType;
	}

	public String getPostalDeliveryNumber() {
		return australianPostalDeliveryNumber;
	}

	public void setUnitType( String australianUnitType ) {
		this.australianUnitType = australianUnitType;
	}

	public void setUnitNumber( String australianUnitNumber ) {
		this.australianUnitNumber = australianUnitNumber;
	}

	public void setAddressSiteName( String australianAddressSiteName ) {
		this.australianAddressSiteName = australianAddressSiteName;
	}

	public void setLevelType( String australianLevelType ) {
		this.australianLevelType = australianLevelType;
	}

	public void setLevelNumber( String australianLevelNumber ) {
		this.australianLevelNumber = australianLevelNumber;
	}

	public void setStreetNumber( String australianStreetNumber ) {
		this.australianStreetNumber = australianStreetNumber;
	}

	public void setLotNumber( String australianLotNumber ) {
		this.australianLotNumber = australianLotNumber;
	}

	public void setStreetName( String australianStreetName ) {
		this.australianStreetName = australianStreetName;
	}

	public void setStreetType( String australianStreetType ) {
		this.australianStreetType = australianStreetType;
	}

	public void setStreetSuffix( String australianStreetSuffix ) {
		this.australianStreetSuffix = australianStreetSuffix;
	}

	public void setPostalDeliveryType( String australianPostalDeliveryType ) {
		this.australianPostalDeliveryType = australianPostalDeliveryType;
	}

	public void setPostalDeliveryNumber( String australianPostalDeliveryNumber ) {
		this.australianPostalDeliveryNumber = australianPostalDeliveryNumber;
	}
}

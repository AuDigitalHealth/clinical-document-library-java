package au.gov.nehta.model.clinical.common.address;

import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianStateTerritory;
import java.util.Formatter;

public class AustralianAddress {

  private UnitType unitType;

  private String unitNumber;

  private String addressSiteName;

  private AustralianAddressLevelType australianAddressLevelType;

  private String levelNumber;

  private int streetNumber;

  private String lotNumber;

  private String streetName;

  private StreetType streetType;

  private StreetSuffix streetSuffix;

  private PostalDeliveryType postalDeliveryType;

  private String suburbTownLocality;

  private AustralianStateTerritory australianStateTerritory;

  private String postCode;

  private int deliveryPointId;

  private AddressAbsentIndicator addressAbsentIndicator;

  private AddressPurpose addressPurpose;


  public void setAddressAbsentIndicator(AddressAbsentIndicator addressAbsentIndicator) {
    this.addressAbsentIndicator = addressAbsentIndicator;
  }


  public void setAddressPurpose(AddressPurpose addressPurpose) {
    this.addressPurpose = addressPurpose;
  }

  public AddressPurpose getAddressPurpose() {
    return this.addressPurpose;
  }

  public UnitType getUnitType() {
    return unitType;
  }


  public void setUnitType(UnitType unitType) {
    this.unitType = unitType;
  }


  public String getUnitNumber() {
    return unitNumber;
  }


  public void setUnitNumber(String unitNumber) {
    this.unitNumber = unitNumber;
  }


  public String getAddressSiteName() {
    return addressSiteName;
  }


  public void setAddressSiteName(String addressSiteName) {
    this.addressSiteName = addressSiteName;
  }


  public AustralianAddressLevelType getAustralianAddressLevelType() {
    return australianAddressLevelType;
  }


  public void setAustralianAddressLevelType(
      AustralianAddressLevelType australianAddressLevelType) {
    this.australianAddressLevelType = australianAddressLevelType;
  }


  public String getLevelNumber() {
    return levelNumber;
  }


  public void setLevelNumber(String levelNumber) {
    this.levelNumber = levelNumber;
  }


  public int getStreetNumber() {
    return streetNumber;
  }


  public void setStreetNumber(int streetNumber) {
    this.streetNumber = streetNumber;
  }


  public String getLotNumber() {
    return lotNumber;
  }


  public void setLotNumber(String lotNumber) {
    this.lotNumber = lotNumber;
  }


  public String getStreetName() {
    return streetName;
  }


  public void setStreetName(String streetName) {
    this.streetName = streetName;
  }


  public StreetType getStreetType() {
    return streetType;
  }


  public void setStreetType(StreetType streetType) {
    this.streetType = streetType;
  }


  public StreetSuffix getStreetSuffix() {
    return streetSuffix;
  }


  public void setStreetSuffix(StreetSuffix streetSuffix) {
    this.streetSuffix = streetSuffix;
  }


  public PostalDeliveryType getPostalDeliveryType() {
    return postalDeliveryType;
  }


  public void setPostalDeliveryType(PostalDeliveryType postalDeliveryType) {
    this.postalDeliveryType = postalDeliveryType;
  }


  public String getSuburbTownLocality() {
    return suburbTownLocality;
  }


  public void setSuburbTownLocality(String suburbTownLocality) {
    this.suburbTownLocality = suburbTownLocality;
  }


  public AustralianStateTerritory getAustralianStateTerritory() {
    return australianStateTerritory;
  }


  public void setAustralianStateTerritory(AustralianStateTerritory australianStateTerritory) {
    this.australianStateTerritory = australianStateTerritory;
  }


  public String getPostCode() {
    return postCode;
  }


  public void setPostCode(String postCode) {
    this.postCode = postCode;
  }


  public int getDeliveryPointId() {
    return deliveryPointId;
  }


  public void setDeliveryPointId(int deliveryPointId) {
    this.deliveryPointId = deliveryPointId;
  }

  //OLD NARRATIVE
/*  public String toNarrative() {
    if (null != addressAbsentIndicator) {
      return addressAbsentIndicator.getCode();
    }
    StringBuilder addressAsNarrative = new StringBuilder()
        .append(" Address Purpose: ").append(addressPurpose.getDisplayName()).append("\n")
        .append(" Delivery Type: ").append(postalDeliveryType.getName()).append("\n");
    //U12 L15 NameOfBldg
    if (null != unitNumber) {
      addressAsNarrative.append("U").append(unitNumber).append(" Unit Type").append(unitType);
    }
    if (null != levelNumber) {
      addressAsNarrative.append(australianAddressLevelType.getName()).append(" ")
          .append(levelNumber);
    }
    if (null != addressSiteName) {
      addressAsNarrative.append(" ").append(addressSiteName);
    }
    addressAsNarrative.append("\n");
    //1 Eagle St
    addressAsNarrative.append(streetNumber).append(" ").append(streetName).append(" ")
        .append(streetSuffix).append(" ").append(streetType);
    addressAsNarrative.append("\n");
    addressAsNarrative.append(null != lotNumber ? lotNumber : "").append("\n");
    addressAsNarrative.append(suburbTownLocality);
    addressAsNarrative.append(australianStateTerritory).append("\nPost-").append(postCode);
    return addressAsNarrative.toString();
  }*/

  public String toNarrative() {
    if (null != addressAbsentIndicator) {
      return addressAbsentIndicator.getCode();
    }

    StringBuilder output = new StringBuilder();
    Formatter formatter = new Formatter(output);

    return formatter.format("%s: %d %s, %s, %s, %s",
            addressPurpose.getOriginalText(),
            streetNumber,
            streetName,
            suburbTownLocality,
            australianStateTerritory.getAbbreviation(),
            postCode)
            .toString();




    /*StringBuilder addressAsNarrative = new StringBuilder()
            .append(addressPurpose.getDisplayName()).append(":\n")
            .append(" Delivery Type: ").append(postalDeliveryType.getName()).append("\n");
    //U12 L15 NameOfBldg
    if (null != unitNumber) {
      addressAsNarrative.append("U").append(unitNumber).append(" Unit Type").append(unitType);
    }
    if (null != levelNumber) {
      addressAsNarrative.append(australianAddressLevelType.getName()).append(" ")
              .append(levelNumber);
    }
    if (null != addressSiteName) {
      addressAsNarrative.append(" ").append(addressSiteName);
    }
    addressAsNarrative.append("\n");
    //1 Eagle St
    addressAsNarrative.append(streetNumber).append(" ").append(streetName).append(" ")
            .append(streetSuffix).append(" ").append(streetType);
    addressAsNarrative.append("\n");
    addressAsNarrative.append(null != lotNumber ? lotNumber : "").append("\n");
    addressAsNarrative.append(suburbTownLocality);
    addressAsNarrative.append(australianStateTerritory).append("\nPost-").append(postCode);
    return addressAsNarrative.toString();*/
  }


}

package au.gov.nehta.builder.util;

import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.clinical.common.participation.Address;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.CountryEnum;
import au.gov.nehta.model.clinical.common.participation.CountryState;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.net.electronichealth.ns.cda._2_0.AD;
import au.net.electronichealth.ns.cda._2_0.AdxpAdditionalLocator;
import au.net.electronichealth.ns.cda._2_0.AdxpCity;
import au.net.electronichealth.ns.cda._2_0.AdxpCountry;
import au.net.electronichealth.ns.cda._2_0.AdxpPostalCode;
import au.net.electronichealth.ns.cda._2_0.AdxpState;
import au.net.electronichealth.ns.cda._2_0.AdxpStreetAddressLine;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.PostalAddressUse;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import javax.xml.bind.JAXBElement;

public class AddressConverter {

  private static ObjectFactory objectFactory = new ObjectFactory();

  public static AD convert(PostalAddress postalAddress) {
    Address model = postalAddress.getAddress();

    AD address = objectFactory.createAD();
    addBaseAddressComponenets(model, address);

    String modelAdditionalLocator = model.getAdditionalLocator();
    addDPID(address, modelAdditionalLocator);

    address.getUse().add(getPostalAddressUse(postalAddress.getUse()));
    return address;
  }

  public static AD convert(CountryState cs) {
    AD address = objectFactory.createAD();
    getCountryState(cs, address);
    return address;
  }

  private static void getCountryState(CountryState cs, AD address) {
    addState(address, cs.getState());
    addCountry(address, cs.getCountry());
  }

  public static List<AD> convert(List<? extends AddressContext> ctx) {
    if (ctx == null) {
      return null;
    }
    List<AD> addressElements = new ArrayList<>(ctx.size());
    for (AddressContext ac : ctx) {
      addressElements.add(convert(ac));
    }
    return addressElements;
  }

  public static AD convert(AddressContext ctx) {
    AD address = objectFactory.createAD();

    if (ctx.getNoFixedAddressIndicator() || ctx.getAddress() == null) {
      AdxpStreetAddressLine adxpStreetAddressLine = objectFactory.createAdxpStreetAddressLine();
      adxpStreetAddressLine.getContent().add("Unknown");
      JAXBElement<AdxpStreetAddressLine> streetAddressLine =
          objectFactory.createADStreetAddressLine(adxpStreetAddressLine);
      address.getContent().add(streetAddressLine);
    } else {
      if (ctx.getAddress() instanceof AustralianAddress) {
        addAustralianAddress(ctx, address);
      } else {
        addAddress(ctx, address);
      }
    }

    return address;
  }

  private static void addAddress(AddressContext ctx, AD address) {
    Address model = ctx.getAddress();
    addBaseAddressComponenets(model, address);

    AddressPurpose addressPurpose = ctx.getAddressPurpose();
    PostalAddressUse postalAddressUse = AddressConverter.getPostalAddressUse(addressPurpose);
    if (postalAddressUse != null) {
      address.getUse().add(postalAddressUse);
    }
  }

  private static void addAustralianAddress(AddressContext ctx, AD address) {
    AustralianAddress model = (AustralianAddress) ctx.getAddress();

    addBaseAddressComponenets(model, address);
    // addStructuredAddress( model, address );
    addDPID(address, model.getDeliveryPointIdentifier());

    AddressPurpose addressPurpose = ctx.getAddressPurpose();
    PostalAddressUse postalAddressUse = AddressConverter.getPostalAddressUse(addressPurpose);
    if (postalAddressUse != null) {
      address.getUse().add(postalAddressUse);
    }
  }

  private static void addDPID(AD address, String dpid) {
    if (isNotEmpty(dpid)) {
      AdxpAdditionalLocator adxpAdditionalLocator = objectFactory.createAdxpAdditionalLocator();
      adxpAdditionalLocator.getContent().add(dpid);
      JAXBElement<AdxpAdditionalLocator> additionalLocator =
          objectFactory.createADAdditionalLocator(adxpAdditionalLocator);
      address.getContent().add(additionalLocator);
    }
  }

  private static void addBaseAddressComponenets(Address model, AD address) {
    addAddressLines(address, model.getUnstructuredAddressLines());
    addPostcode(address, model.getPostcode());
    addCity(model.getCity(), address);
    getCountryState(model, address);
  }

  private static void addCountry(AD address, String modelCountry) {
    if (isNotEmpty(modelCountry)) {
      AdxpCountry adxpCountry = objectFactory.createAdxpCountry();
      adxpCountry.getContent().add(modelCountry);
      JAXBElement<AdxpCountry> country = objectFactory.createADCountry(adxpCountry);
      address.getContent().add(country);
    }
  }

  private static void addPostcode(AD address, String modelPostalCode) {
    if (isNotEmpty(modelPostalCode)) {
      AdxpPostalCode adxpPostalCode = objectFactory.createAdxpPostalCode();
      adxpPostalCode.getContent().add(modelPostalCode);
      JAXBElement<AdxpPostalCode> postalCode =
          objectFactory.createADPostalCode(adxpPostalCode);
      address.getContent().add(postalCode);
    }
  }

  private static void addState(AD address, String modelState) {
    if (isNotEmpty(modelState)) {
      AdxpState adxpState = objectFactory.createAdxpState();
      adxpState.getContent().add(modelState);
      JAXBElement<AdxpState> state = objectFactory.createADState(adxpState);
      address.getContent().add(state);
    }
  }

  private static void addAddressLines(AD address, List<String> addressLines) {
    if (addressLines != null) {
      for (String cdaModelPostalAddressStreetAddressLine : addressLines) {
        AdxpStreetAddressLine adxpStreetAddressLine = objectFactory.createAdxpStreetAddressLine();
        adxpStreetAddressLine.getContent().add(cdaModelPostalAddressStreetAddressLine);
        JAXBElement<AdxpStreetAddressLine> streetAddressLine =
            objectFactory.createADStreetAddressLine(adxpStreetAddressLine);
        address.getContent().add(streetAddressLine);
      }
    }
  }

  private static void addCity(String modelCity, AD address) {
    if (isNotEmpty(modelCity)) {
      AdxpCity adxpCity = objectFactory.createAdxpCity();
      adxpCity.getContent().add(modelCity);
      JAXBElement<AdxpCity> city = objectFactory.createADCity(adxpCity);
      address.getContent().add(city);
    }
  }

  private static PostalAddressUse getPostalAddressUse(AddressPurpose purpose) {
    PostalAddressUse postalAddressUse;

    switch (purpose) {
      case BUSINESS: {
        postalAddressUse = PostalAddressUse.WP;
        break;
      }
      case MAILING_OR_POSTAL: {
        postalAddressUse = PostalAddressUse.PST;
        break;
      }
      case TEMPORARY_ACCOMMODATION: {
        postalAddressUse = PostalAddressUse.TMP;
        break;
      }
      case RESIDENTIAL_PERMANENT: {
        postalAddressUse = PostalAddressUse.H;
        break;
      }
      default: {
        postalAddressUse = null;
        break;
      }
    }
    return postalAddressUse;
  }

  private static PostalAddressUse getPostalAddressUse(PostalAddressUseEnum addressUse) {
    PostalAddressUse postalAddressUse;

    switch (addressUse) {
      case WORKPLACE: {
        postalAddressUse = PostalAddressUse.WP;
        break;
      }
      case POSTAL_ADDRESS: {
        postalAddressUse = PostalAddressUse.PST;
        break;
      }
      case TEMPORARY_ADDRESS: {
        postalAddressUse = PostalAddressUse.TMP;
        break;
      }

      case HOME_ADDRESS: {
        postalAddressUse = PostalAddressUse.H;
        break;
      }
      default: {
        postalAddressUse = null;
        break;
      }
    }

    return postalAddressUse;
  }

  private static boolean isNotEmpty(String s) {
    return s != null && s.length() > 0;
  }

  public static Collection<? extends AD> convertAustralianAddress(
      List<au.gov.nehta.model.clinical.common.address.Address> addresses) {

    List<AD> adList = new ArrayList<>();

    if (addresses != null && !addresses.isEmpty()) {
      addresses.stream().filter(Objects::nonNull).forEach(
          address -> {
            AD ad = objectFactory.createAD();

            au.gov.nehta.model.clinical.common.address.AustralianAddress australianAddress =
                address.getAustralianAddress();
            if (null != australianAddress.getAddressPurpose()) {
              ad.getUse().add(getPostalAddressUse(australianAddress.getAddressPurpose()));
            }
            // Street Address Line
            AdxpStreetAddressLine adxpStreetAddressLine = objectFactory
                .createAdxpStreetAddressLine();
            adxpStreetAddressLine.getContent().add(
                australianAddress.getStreetNumber() + " " + australianAddress.getStreetName());
            JAXBElement<AdxpStreetAddressLine> streetAddressLine =
                objectFactory.createADStreetAddressLine(adxpStreetAddressLine);
            ad.getContent().add(streetAddressLine);

            // City
            AdxpCity adxpCity = objectFactory.createAdxpCity();
            adxpCity.getContent().add(australianAddress.getSuburbTownLocality());
            JAXBElement<AdxpCity> city = objectFactory.createADCity(adxpCity);
            ad.getContent().add(city);

            // State
            AdxpState adxpState = objectFactory.createAdxpState();
            adxpState.getContent()
                .add(australianAddress.getAustralianStateTerritory().getAbbreviation());
            JAXBElement<AdxpState> state = objectFactory.createADState(adxpState);
            ad.getContent().add(state);

            // Postal Code
            AdxpPostalCode adxpPostalCode = objectFactory.createAdxpPostalCode();
            adxpPostalCode.getContent().add(australianAddress.getPostCode());
            JAXBElement<AdxpPostalCode> postalCode =
                objectFactory.createADPostalCode(adxpPostalCode);
            ad.getContent().add(postalCode);

            // Country
            AdxpCountry adxpCountry = objectFactory.createAdxpCountry();
            adxpCountry.getContent().add(CountryEnum.AUSTRALIA.getDescriptor());
            JAXBElement<AdxpCountry> country = objectFactory.createADCountry(adxpCountry);
            ad.getContent().add(country);

            //Add addres to the list
            adList.add(ad);
          });

    }

    return adList;
  }
}

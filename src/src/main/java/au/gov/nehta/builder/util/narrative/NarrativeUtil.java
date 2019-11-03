package au.gov.nehta.builder.util.narrative;

import static au.gov.nehta.builder.DocumentCreatorUtil.isServiceReferralExecuting;
import static au.gov.nehta.builder.DocumentCreatorUtil.link;
import static au.gov.nehta.builder.DocumentCreatorUtil.print;
import static au.gov.nehta.builder.DocumentCreatorUtil.safe;

import au.gov.nehta.builder.DocumentCreatorUtil;
import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderIndividualDemographicData;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocItem;
import au.net.electronichealth.ns.cda._2_0.StrucDocList;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocTh;
import au.net.electronichealth.ns.cda._2_0.StrucDocTr;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import javax.xml.bind.JAXBElement;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class NarrativeUtil {

  private final static String NARRATIVE_DATE_TIME_FORMAT = "d MMM yyyy HH:mm:ssZ";
  private final static String NARRATIVE_DATE_FORMAT = "d MMM yyyy";
  public final static DateTimeFormatter NARRATIVE_DATE_TIME_FORMATTER = DateTimeFormat
      .forPattern(NARRATIVE_DATE_TIME_FORMAT);
  public final static DateTimeFormatter NARRATIVE_DATE_FORMATTER = DateTimeFormat
      .forPattern(NARRATIVE_DATE_FORMAT);
  private final static ObjectFactory objectFactory = new ObjectFactory();

  public static StrucDocTr getTableHeaderRow(List<String> cellValues) {
    StrucDocTr tableRow = new StrucDocTr();

    for (String cellValue : cellValues) {
      StrucDocTh cell = new StrucDocTh();
      cell.getContent().add(cellValue);
      tableRow.getThOrTd().add(cell);
    }

    return tableRow;
  }

  public static StrucDocTr getTableHeaderRow(String... cellValues) {
    StrucDocTr tableRow = new StrucDocTr();

    for (String cellValue : cellValues) {
      StrucDocTh cell = new StrucDocTh();
      cell.getContent().add(cellValue);
      tableRow.getThOrTd().add(cell);
    }

    return tableRow;
  }


  public static String render(PersonName name) {
    StringBuilder nameBuilder = new StringBuilder();
    if (name.getNameTitle() != null) {
      for (String title : name.getNameTitle()) {
        nameBuilder.append(title).append(" ");
      }
    }

    if (name.getGivenName() != null) {
      for (String fname : name.getGivenName()) {
        char[] f_name = fname.toLowerCase().toCharArray();
        f_name[0] = Character.toTitleCase(f_name[0]);
        nameBuilder.append(f_name).append(" ");
      }
    }

    if (name.getFamilyName() != null) {
      nameBuilder.append(name.getFamilyName().toUpperCase()).append(" ");
    }

    if (name.getNameSuffix() != null) {
      for (String suffix : name.getNameSuffix()) {
        nameBuilder.append(suffix).append(" ");
      }
    }
    return nameBuilder.toString();
  }

  public static StrucDocTr createTableBodyRowWithCellValues(List<String> cellValues) {
    StrucDocTr tableRow = new StrucDocTr();

    for (String cellValue : cellValues) {
      StrucDocTd cell = cell(cellValue);
      tableRow.getThOrTd().add(cell);
    }

    return tableRow;
  }

  public static StrucDocTd cell(Serializable cellValue) {
    StrucDocTd cell = new StrucDocTd();
    cell.getContent().add(cellValue);
    return cell;
  }

  public static StrucDocTr createTableBodyRowWithCells(List<StrucDocTd> cells) {
    StrucDocTr tableRow = new StrucDocTr();

    for (StrucDocTd cell : cells) {
      tableRow.getThOrTd().add(cell);
    }

    return tableRow;
  }

  public static StrucDocTr createTableBodyRowWithCells(StrucDocTd... cells) {
    StrucDocTr tableRow = new StrucDocTr();

    for (StrucDocTd cell : cells) {
      tableRow.getThOrTd().add(cell);
    }

    return tableRow;
  }

  public static StrucDocTr createTableBodyRowWithCellValuesAndColours(List<String> cellValues) {
    StrucDocTr tableRow = new StrucDocTr();

    for (String cellValue : cellValues) {
      StrucDocTd cell = cell(cellValue);
      tableRow.getThOrTd().add(cell);
    }

    return tableRow;
  }

  public static StrucDocTr createTableBodyRowWithCellsAndColours(List<StrucDocTd> cells) {
    StrucDocTr tableRow = new StrucDocTr();

    for (StrucDocTd cell : cells) {
      tableRow.getThOrTd().add(cell);
    }

    return tableRow;
  }

  public static String booleanToYesNo(Boolean value) {
    ArgumentUtils.checkNotNull(value, "value");
    if (value) {
      return "Yes";
    } else {
      return "No";
    }
  }

  public static List<StrucDocTd> getProviderIndividualCells(String fieldName,
      HPII providerIndividualEntityIdentifier, PersonName providerIndividualName,
      ProviderIndividualDemographicData providerIndividualDemographicData, String qualifications) {

    List<StrucDocTd> result = new ArrayList<>();

    result.add(getTableBodyCell(fieldName));

    StrucDocTd fieldValueCell = new StrucDocTd();
    fieldValueCell.getContent()
        .add("HPI-I: " + providerIndividualEntityIdentifier.getNarrativeForm());
    br(fieldValueCell);

    StringBuilder name = new StringBuilder();
    if (providerIndividualName.getNameTitle() != null) {
      for (String title : providerIndividualName.getNameTitle()) {
        name.append(title);
      }
    }

    if (providerIndividualName.getGivenName() != null) {
      for (String givenName : providerIndividualName.getGivenName()) {
        name.append(givenName);
      }
    }
    name.append(providerIndividualName.getFamilyName());
    if (providerIndividualName.getNameSuffix() != null) {
      for (String suffix : providerIndividualName.getNameSuffix()) {
        name.append(suffix);
      }
    }
    fieldValueCell.getContent().add("NAME: " + name.toString());
    br(fieldValueCell);

    if (providerIndividualDemographicData != null) {
      String sex = providerIndividualDemographicData.getSex().getDisplayName();
      fieldValueCell.getContent().add("SEX: " + sex);
      br(fieldValueCell);

      String dateOfBirth = NARRATIVE_DATE_TIME_FORMATTER
          .print(providerIndividualDemographicData.getDateOfBirthDetail().getDateOfBirth());
      fieldValueCell.getContent().add("DATE OF BIRTH: " + dateOfBirth);
      br(fieldValueCell);

      if (qualifications != null) {
        fieldValueCell.getContent().add("QUALIFICATIONS: " + qualifications);
      }

    }
    result.add(fieldValueCell);
    return result;
  }

  public static StrucDocTd getTableBodyCell(String value) {
    return cell(value);
  }

  public static List<StrucDocTd> getProviderAddressCells(String fieldName,
      ProviderAddress providerAddress) {
    List<StrucDocTd> result = new ArrayList<>();
    result.add(getTableBodyCell(fieldName));
    result.add(getProviderAddressCell(providerAddress));

    return result;
  }

  public static List<StrucDocTd> getElectronicCommunicationCells(String fieldName,
      List<Telecom> electronicCommunicationDetail) {
    List<StrucDocTd> result = new ArrayList<>();
    result.add(getTableBodyCell(fieldName));
    result.add(getElectronicCommunicationDetailCell(electronicCommunicationDetail));

    return result;
  }

  public static StrucDocTd getProviderAddressCell(ProviderAddress providerAddress) {
    StrucDocTd result = new StrucDocTd();

    if (providerAddress.getNoFixedAddressIndicator()) {
      result.getContent().add("No fixed address.");
    } else {
      if (providerAddress.getAddress() != null) {
        AustralianAddress providerAustralianAddress = providerAddress.getAddress();

        if (providerAustralianAddress.getUnstructuredAddressLines() != null) {
          for (String unstructuredAddressLine : providerAustralianAddress
              .getUnstructuredAddressLines()) {
            result.getContent().add(unstructuredAddressLine);
            br(result);
          }
        }

        if (providerAustralianAddress.getCity() != null) {
          String australianSuburbTownLocality = providerAustralianAddress.getCity();

          result.getContent().add(australianSuburbTownLocality);

          br(result);
        }

        if (providerAustralianAddress.getPostcode() != null) {
          String australianPostcode = providerAustralianAddress.getPostcode();
          result.getContent().add(australianPostcode);
          br(result);
        }

        if (providerAustralianAddress.getDeliveryPointIdentifier() != null) {
          String australianDeliveryPointIdentifier = providerAustralianAddress
              .getDeliveryPointIdentifier();
          result.getContent()
              .add("DELIVERY POINT IDENTIFIER: " + australianDeliveryPointIdentifier);
          br(result);
        }

        if (providerAddress.getAddressPurpose() != null) {
          AddressPurpose postalAddressUse = providerAddress.getAddressPurpose();
          result.getContent().add("ADDRESS TYPE: " + postalAddressUse.getDisplayName());
          br(result);
        }
      }
    }

    return result;
  }

  public static StrucDocTd getAddressCell(AddressContext addressContext) {
    StrucDocTd result = new StrucDocTd();
    if (addressContext.getNoFixedAddressIndicator()) {
      result.getContent().add("No fixed address.");
    } else {
      if (addressContext.getAddress() != null) {
        au.gov.nehta.model.clinical.common.participation.Address australianAddress
            = addressContext.getAddress();
        if (australianAddress.getUnstructuredAddressLines() != null) {
          for (String unstructuredAddressLine : australianAddress
              .getUnstructuredAddressLines()) {
            result.getContent().add(unstructuredAddressLine);
            br(result);
          }
        }

        if (australianAddress.getCity() != null) {
          String australianSuburbTownLocality = australianAddress.getCity();

          result.getContent().add(australianSuburbTownLocality);

          br(result);
        }

        if (australianAddress.getPostcode() != null) {
          String australianPostcode = australianAddress.getPostcode();
          result.getContent().add(australianPostcode);
          br(result);
        }

        if (addressContext.getAddressPurpose() != null) {
          AddressPurpose postalAddressUse = addressContext.getAddressPurpose();
          result.getContent().add("ADDRESS TYPE: " + postalAddressUse.getDisplayName());
          br(result);
        }
      }
    }

    return result;
  }

  public static void br(StrucDocTd result) {
    result.getContent().add(createTdBr());
  }

  private static JAXBElement<String> createTdBr() {
    return objectFactory.createStrucDocTdBr("");
  }

  public static StrucDocTd getElectronicCommunicationDetailCell(
      List<Telecom> electronicCommunicationDetail) {
    StrucDocTd result = new StrucDocTd();

    for (Telecom electronicCommunicationDetailItem : electronicCommunicationDetail) {
      String usage = "";
      if (electronicCommunicationDetailItem.getTelecomUse() != null) {
        usage = " (" + electronicCommunicationDetailItem.getTelecomUse().getDisplayName() + ")";
      }

      result.getContent().add(
          electronicCommunicationDetailItem.getTelecomMedium().getDisplayName() + ":"
              + electronicCommunicationDetailItem.getTelecomValue() + usage);
      br(result);
    }

    return result;
  }

  public static List<StrucDocTd> getEntitlementCells(String fieldName,
      List<Entitlement> entitlement) {
    List<StrucDocTd> result = new ArrayList<>();
    result.add(getTableBodyCell(fieldName));
    result.add(getEntitlementCell(entitlement));

    return result;
  }

  public static List<StrucDocTd> getSubjectOfCareEntitlementCells(String fieldName,
      List<Entitlement> entitlement) {
    List<StrucDocTd> result = new ArrayList<>();
    result.add(getTableBodyCell(fieldName));
    result.add(getSubjectOfCareEntitlementCell(entitlement));

    return result;
  }

  public static StrucDocTd getEntitlementCell(List<Entitlement> entitlement) {
    StrucDocTd result = new StrucDocTd();

    for (Entitlement entitlementItem : entitlement) {
      StringBuilder entitlementStringBuilder = new StringBuilder();

      entitlementStringBuilder.append(entitlementItem.getEntitlementNumber().getExtension());
      entitlementStringBuilder.append(" (Type: ")
          .append(entitlementItem.getEntitlementType().getDisplayName()).append(")");

      if (entitlementItem.getEntitlementValidityDuration() != null) {
        RestrictedTimeInterval validityDuration = entitlementItem.getEntitlementValidityDuration();
        entitlementStringBuilder.append(validityDuration.getNarrative());
      }

      result.getContent().add(entitlementStringBuilder.toString());
      br(result);
    }

    return result;
  }

  public static StrucDocTd getSubjectOfCareEntitlementCell(List<Entitlement> entitlement) {
    StrucDocTd result = new StrucDocTd();

    for (Entitlement entitlementItem : entitlement) {
      StringBuilder entitlementStringBuilder = new StringBuilder();

      entitlementStringBuilder.append(entitlementItem.getEntitlementNumber().getExtension());
      entitlementStringBuilder.append(" (Type: ")
          .append(entitlementItem.getEntitlementType().getDisplayName()).append(")");

      if (entitlementItem.getEntitlementValidityDuration() != null) {

//				TimeInterval validityDuration = entitlementItem.getEntitlementValidityDuration();
//				entitlementStringBuilder.append( " (Validity: " + validityDuration.getStart() + " till " + validityDuration.getEnd() + " - " + validityDuration.getDuration() + ")" );

        String entitlementNarrative = DocumentCreatorUtil
            .narrativeVersion(entitlementItem.getEntitlementValidityDuration());
        entitlementStringBuilder.append(" (Duration: ").append(entitlementNarrative).append(")");

//				RestrictedTimeInterval validityDuration = entitlementItem.getEntitlementValidityDuration();
//				if(validityDuration.getNarrative() != null){
//				    entitlementStringBuilder.append( validityDuration.getNarrative() );
//				}
      }

      result.getContent().add(entitlementStringBuilder.toString());
      //br( result );
    }

    return result;
  }

  public static List<StrucDocTd> getProviderOrganisationCells(String fieldName,
      HPIO providerOrganisationEntityIdentifier, Organisation organisation) {
    List<StrucDocTd> result = new ArrayList<>();

    result.add(getTableBodyCell(fieldName));

    StrucDocTd fieldValueCell = new StrucDocTd();
    fieldValueCell.getContent()
        .add("HPI-O: " + providerOrganisationEntityIdentifier.getNarrativeForm());
    br(fieldValueCell);

    fieldValueCell.getContent().add("ORGANISATION NAME: " + organisation.getOrganisationName());
    br(fieldValueCell);

    if (organisation.getDepartmentUnit() != null) {
      fieldValueCell.getContent().add("DEPARTMENT/UNIT: " + organisation.getDepartmentUnit());
      br(fieldValueCell);
    }

    result.add(fieldValueCell);

    return result;
  }

  public static String nullToEmpty(String text) {
    return text == null ? "" : text;
  }

  public static StrucDocTd getParticipationServiceProviderTdNarrative(
      ParticipationServiceProvider participationServiceProvider) {
    StrucDocTd addresseeTd = objectFactory.createStrucDocTd();
    JAXBElement<StrucDocList> serviceProviderDetails = getServiceProviderDetails(
        participationServiceProvider, Optional.empty());
    addresseeTd.getContent().add(serviceProviderDetails);
    return addresseeTd;
  }

  public static JAXBElement<StrucDocList> getServiceProviderDetails(
      ParticipationServiceProvider participationServiceProvider, Optional<String> caption) {
    StrucDocList addresseeDetails = objectFactory.createStrucDocList();
    caption.ifPresent(s -> addresseeDetails.setCaption(new StrucDocCaption() {{
      getContent().add(s);
    }}));
    if (null != participationServiceProvider.getParticipant().getHealthCareProvider()) {
      addresseeDetails.getItem()
          .addAll(getHealthcareProviderNarrative(participationServiceProvider));
    } else if (null != participationServiceProvider.getParticipant().getOrganisation()) {
      addresseeDetails.getItem()
          .addAll(getOrganisationServiceProviderNarrative(participationServiceProvider));
    }
    return objectFactory
        .createStrucDocTdList(addresseeDetails);
  }

  private static List<StrucDocItem> getOrganisationServiceProviderNarrative(
      ParticipationServiceProvider participationServiceProvider) {
    ServiceProvider serviceProvider;
    List<StrucDocItem> addresseeDetailsItems = new LinkedList<>();
    serviceProvider = participationServiceProvider.getParticipant();
    StrucDocItem participationPeriodItem = objectFactory.createStrucDocItem();
    participationPeriodItem.getContent().add(
        print(participationServiceProvider.getParticipationPeriod().getLow()) + " -> "
            + print(participationServiceProvider.getParticipationPeriod().getHigh()));
    addresseeDetailsItems.add(participationPeriodItem);
    StrucDocItem participationRoleItem = objectFactory.createStrucDocItem();
    participationRoleItem.getContent()
        .add(print(participationServiceProvider.getRole()));
    addresseeDetailsItems.add(participationRoleItem);
    StrucDocItem orgNameItem = objectFactory.createStrucDocItem();
    orgNameItem.getContent().add(String.format("Dept: %s, Organisation Name: %s",
        serviceProvider.getOrganisation().getDepartmentUnit(),
        serviceProvider.getOrganisation().getOrganisationName()));
    addresseeDetailsItems.add(orgNameItem);
    serviceProvider.getAddresses().stream().filter(Objects::nonNull)
        .forEach(address -> {
          StrucDocItem serviceProviderAddressItem = objectFactory.createStrucDocItem();
          serviceProviderAddressItem.getContent()
              .add(address.getAustralianAddress().toNarrative());
          addresseeDetailsItems.add(serviceProviderAddressItem);
        });
    return addresseeDetailsItems;
  }

  private static List<StrucDocItem> getHealthcareProviderNarrative(
      ParticipationServiceProvider participationServiceProvider) {
    ServiceProvider serviceProvider = participationServiceProvider.getParticipant();
    List<StrucDocItem> addresseeDetailsItems = new LinkedList<>();
    serviceProvider.getHealthCareProvider().getPersonNames().stream().filter(Objects::nonNull)
        .forEach(personName -> {
          StrucDocItem personNameDetailsItem = objectFactory.createStrucDocItem();
          personNameDetailsItem.getContent().add(String
              .format("%s %s %s %s", getPersonNameTitles(personName, ";"),
                  getPersonGivenName(personName, ";"), personName.getFamilyName(),
                  getPersonNameSuffixes(personName, ";")));
          addresseeDetailsItems.add(personNameDetailsItem);
          StrucDocItem personNameUsagesItem = objectFactory.createStrucDocItem();
          personNameUsagesItem.getContent().add(getPersonNameUsages(personName));
          addresseeDetailsItems.add(personNameUsagesItem);
        });
    if (null != serviceProvider.getHealthCareProvider().getGender()) {
      getStringInListForm(serviceProvider.getHealthCareProvider().getGender().getName(), "Gender",
          addresseeDetailsItems);
    }
    if (null != serviceProvider.getHealthCareProvider().getDateOfBirth()) {
      getStringInListForm(
          serviceProvider.getHealthCareProvider().getDateOfBirth().toNarrativeForm(),
          "Date Of Birth",
          addresseeDetailsItems);
    }
    if (null != serviceProvider.getAddresses()) {
      addresseeDetailsItems
          .add(getAddressesAsStrucDocItem(serviceProvider.getAddresses(), "Healthcare Provider"));
    }
    if (null != serviceProvider.getElectronicCommunicationDetails()) {
      addresseeDetailsItems.add(getElectronicCommunicationDetailsAsStrucDocItem(
          serviceProvider.getElectronicCommunicationDetails(), "Healthcare Provider",
          serviceProvider.getExecutingClass()));
    }
    StrucDocItem orgDetailsItem = objectFactory.createStrucDocItem();
    orgDetailsItem.getContent().add(getHealthcareProviderEmploymentOrgNarrative(
        serviceProvider.getHealthCareProvider().getEmploymentOrganisation(),
        serviceProvider.getExecutingClass()));
    addresseeDetailsItems.add(orgDetailsItem);
    return addresseeDetailsItems;
  }

  private static void getStringInListForm(String value, String caption,
      List<StrucDocItem> addresseeDetailsItems) {
    StrucDocList genderList = objectFactory.createStrucDocList();
    genderList.setCaption(new StrucDocCaption() {{
      getContent().add(caption);
    }});
    genderList.getItem().add(new StrucDocItem() {{
      getContent().add(value);
    }});
    addresseeDetailsItems.add(new StrucDocItem() {{
      getContent().add(objectFactory.createStrucDocTdList(genderList));
    }});
  }

  private static String getPersonNameUsages(PersonName personName) {
    return personName.getPersonNameUsage().stream().filter(Objects::nonNull)
        .map(PersonNameUsage::getDescriptor).collect(Collectors.joining(";"));
  }

  private static String getPersonNameTitles(PersonName personName, String delimiter) {
    return personName.getNameTitle().stream().filter(Objects::nonNull).collect(
        Collectors.joining(delimiter));
  }

  private static String getPersonNameSuffixes(PersonName personName, String delimiter) {
    return personName.getNameSuffix().stream().filter(Objects::nonNull).collect(
        Collectors.joining(delimiter));
  }

  private static String getPersonGivenName(PersonName personName, String delimiter) {
    return personName.getGivenName().stream().filter(Objects::nonNull).collect(
        Collectors.joining(delimiter));
  }

  private static JAXBElement<StrucDocList> getHealthcareProviderEmploymentOrgNarrative(
      EmploymentOrganization employmentOrganization, Class executingClass) {
    StrucDocList orgDetailsList = objectFactory.createStrucDocList();
    orgDetailsList.setCaption(new StrucDocCaption() {{
      getContent()
          .add(String.format("Organization Details for %s", employmentOrganization.getName()));
    }});
    List<StrucDocItem> employmentOrgItems = new LinkedList<>();
    StrucDocItem employmentTypeItem = objectFactory.createStrucDocItem();
    employmentTypeItem.getContent().add(String.format("Employment Type: %s",
        print(employmentOrganization.getEmploymentType())));
    employmentOrgItems.add(employmentTypeItem);
    StrucDocItem employmentOccupationItem = objectFactory.createStrucDocItem();
    employmentOccupationItem.getContent().add(String.format("Occupation: %s",
        print(employmentOrganization.getOccupation())));
    employmentOrgItems.add(employmentOccupationItem);
    StrucDocItem positionInOrgItem = objectFactory.createStrucDocItem();
    positionInOrgItem.getContent().add(String.format("Position in Organisation: %s",
        print(employmentOrganization.getPositionInOrganization())));
    employmentOrgItems.add(positionInOrgItem);
    StrucDocItem orgDeptItem = objectFactory.createStrucDocItem();
    orgDeptItem.getContent()
        .add(String.format("Department: %s", employmentOrganization.getDepartment()));
    employmentOrgItems.add(orgDeptItem);
    StrucDocItem orgNameItem = objectFactory.createStrucDocItem();
    orgNameItem.getContent().add(String.format("Organisation Name: %s, Usage: %s",
        employmentOrganization.getName(),
        employmentOrganization.getOrganisationNameUsage().getDisplayName()));
    employmentOrgItems.add(orgNameItem);
    if (null != employmentOrganization.getElectronicCommunicationDetails()) {
      employmentOrgItems.add(getElectronicCommunicationDetailsAsStrucDocItem(
          employmentOrganization.getElectronicCommunicationDetails(),
          employmentOrganization.getName(), executingClass));
    }
    if (null != employmentOrganization.getAddresses()) {
      employmentOrgItems.add(getAddressesAsStrucDocItem(employmentOrganization.getAddresses(),
          employmentOrganization.getName()));
    }
    orgDetailsList.getItem().addAll(employmentOrgItems);
    return objectFactory.createStrucDocTdList(orgDetailsList);
  }

  private static StrucDocItem getElectronicCommunicationDetailsAsStrucDocItem(
      List<ElectronicCommunicationDetail> electronicCommunicationDetails, String caption,
      Class executingClass) {

    StrucDocList electronicCommDetailsList = objectFactory.createStrucDocList();
    electronicCommDetailsList.setCaption(new StrucDocCaption() {{
      getContent().add(String.format("Electronic Communication Details for %s",
          safe(caption)));
    }});

    electronicCommunicationDetails.stream().filter(Objects::nonNull)
        .forEach(electronicCommunicationDetail -> {
          StrucDocItem electronicCommDetailItem = objectFactory.createStrucDocItem();
          //ServiceReferral has a different way to represent  communication
          if (isServiceReferralExecuting(executingClass)) {
            electronicCommDetailItem.getContent()
                .add(electronicCommunicationDetail.getAddress());
          } else {
            electronicCommDetailItem.getContent()
                .add(link(electronicCommunicationDetail.getAddress(),
                    electronicCommunicationDetail.getAddress()));
          }

          electronicCommDetailsList.getItem().add(electronicCommDetailItem);
        });
    return new StrucDocItem() {{
      getContent().add(objectFactory.createStrucDocTdList(electronicCommDetailsList));
    }};
  }

  private static StrucDocItem getAddressesAsStrucDocItem(
      List<Address> addresses, String caption) {
    StrucDocList addressList = objectFactory.createStrucDocList();
    addressList.setCaption(new StrucDocCaption() {{
      getContent().add(String.format("Addresses for %s", safe(caption)));
    }});
    addresses.stream().filter(Objects::nonNull)
        .forEach(address -> {
          StrucDocItem addressItem = objectFactory.createStrucDocItem();
          addressItem.getContent().add(address.getAustralianAddress().toNarrative());
          addressList.getItem().add(addressItem);
        });
    return new StrucDocItem() {{
      getContent().add(objectFactory.createStrucDocTdList(addressList));
    }};
  }
}

package au.gov.nehta.builder.util;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.person.PersonNameUseEnum;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.time.EventRelatedTimeInterval;
import au.gov.nehta.model.cda.common.time.PeriodicIntervalTime;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.common.time.SetParentheticTime;
import au.gov.nehta.model.cda.common.time.SimplifiedPeriodicIntervalTime;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.Quantity;
import au.gov.nehta.model.clinical.common.types.Ratio;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.es.ReferenceRange;
import au.net.electronichealth.ns.cda._2_0.AD;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.CS;
import au.net.electronichealth.ns.cda._2_0.CV;
import au.net.electronichealth.ns.cda._2_0.EIVLEvent;
import au.net.electronichealth.ns.cda._2_0.EIVLTS;
import au.net.electronichealth.ns.cda._2_0.EN;
import au.net.electronichealth.ns.cda._2_0.EnFamily;
import au.net.electronichealth.ns.cda._2_0.EnGiven;
import au.net.electronichealth.ns.cda._2_0.EnPrefix;
import au.net.electronichealth.ns.cda._2_0.EnSuffix;
import au.net.electronichealth.ns.cda._2_0.EntityClass;
import au.net.electronichealth.ns.cda._2_0.EntityNameUse;
import au.net.electronichealth.ns.cda._2_0.II;
import au.net.electronichealth.ns.cda._2_0.INT;
import au.net.electronichealth.ns.cda._2_0.IVLPQ;
import au.net.electronichealth.ns.cda._2_0.IVLTS;
import au.net.electronichealth.ns.cda._2_0.IVXBPQ;
import au.net.electronichealth.ns.cda._2_0.NullFlavor;
import au.net.electronichealth.ns.cda._2_0.ON;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.PIVLTS;
import au.net.electronichealth.ns.cda._2_0.PN;
import au.net.electronichealth.ns.cda._2_0.PQ;
import au.net.electronichealth.ns.cda._2_0.RTO;
import au.net.electronichealth.ns.cda._2_0.RTOPQPQ;
import au.net.electronichealth.ns.cda._2_0.ST;
import au.net.electronichealth.ns.cda._2_0.SXCMTS;
import au.net.electronichealth.ns.cda._2_0.SXPRTS;
import au.net.electronichealth.ns.cda._2_0.TEL;
import au.net.electronichealth.ns.cda._2_0.TS;
import au.net.electronichealth.ns.cda._2_0.TelecommunicationAddressUse;
import au.net.electronichealth.ns.cda._2_0.URGPQ;
import au.net.electronichealth.ns.ci.cda.extensions._3.EntityIdentifier;
import au.net.electronichealth.ns.ci.cda.extensions._3.GeographicArea;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.xml.bind.JAXBElement;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 * A utility to convert from Model classes to HL7 XML classes
 */
public class Converter {

  private static final String HL7_DATE_TIME_FORMAT = "yyyyMMddHHmmssZ";
  // joda date time formatters are threadsafe
  public static final DateTimeFormatter HL7_DATE_TIME_FORMATTER =
      DateTimeFormat.forPattern(HL7_DATE_TIME_FORMAT);
  private static final String HL7_DATE_ONLY_FORMAT = "yyyyMMdd";
  private static final DateTimeFormatter HL7_DATE_ONLY_FORMATTER =
      DateTimeFormat.forPattern(HL7_DATE_ONLY_FORMAT);

  public static ON getOrganizationNameAndUse(Organisation scsOrganisation) {
    ON organizationName = new ON();

    if (scsOrganisation.getOrganisationName() != null) {
      organizationName.getContent().add(scsOrganisation.getOrganisationName());
      if (scsOrganisation.getOrganisationNameUsage() != null) {
        organizationName
            .getUse()
            .add(getEntityOrganisationNameUse(scsOrganisation.getOrganisationNameUsage()));
      }
    }

    return organizationName;
  }

  public static ON getOrganizationNameAndUse(String name) {
    ON organizationName = new ON();
    organizationName.getContent().add(name);
    return organizationName;
  }

  private static EntityNameUse getEntityOrganisationNameUse(
      OrganisationNameUsage scsOrganisationNameUsage) {
    EntityNameUse entityNameUse = null;
    switch (scsOrganisationNameUsage) {
      case ORGANISATIONAL_UNIT_SECTION_DIVISION_NAME: {
        entityNameUse = EntityNameUse.ORGU;
        break;
      }
      case SERVICE_LOCATION_NAME: {
        entityNameUse = EntityNameUse.ORGS;
        break;
      }
      case BUSINESS_NAME: {
        entityNameUse = EntityNameUse.ORGB;
        break;
      }
      case LOCALLY_USED_NAME: {
        entityNameUse = EntityNameUse.ORGL;
        break;
      }
      case ABBREVIATED_NAME: {
        entityNameUse = EntityNameUse.ORGA;
        break;
      }
      case ENTERPRISE_NAME: {
        entityNameUse = EntityNameUse.ORGE;
        break;
      }
      case OTHER: {
        entityNameUse = EntityNameUse.ORGX;
        break;
      }
      case UNKNOWN: {
        entityNameUse = EntityNameUse.ORGY;
        break;
      }
    }

    return entityNameUse;
  }

  public static Collection<? extends TEL> convertElectronicCommunicationDetail(
      List<ElectronicCommunicationDetail> electronicCommunicationDetails) {
    if (electronicCommunicationDetails == null) {
      return new ArrayList<>(1);
    }

    List<TEL> telecom = new ArrayList<>();

    for (ElectronicCommunicationDetail ecd : electronicCommunicationDetails) {
      TEL tel = convertEcd(ecd);
      telecom.add(tel);
    }

    return telecom;
  }

  public static List<TEL> convert(List<? extends Telecom> telecoms) {
    if (telecoms == null) {
      return new ArrayList<>(1);
    }

    List<TEL> telecom = new ArrayList<>();

    for (Telecom tel : telecoms) {
      TEL telecom1 = convert(tel);
      telecom.add(telecom1);
    }

    return telecom;
  }

  public static IVLTS convert(DateTime date) {
    IVLTS result = new IVLTS();
    result.setValue(HL7_DATE_TIME_FORMATTER.print(date));
    return result;
  }

  public static IVLTS convert(PreciseDate date) {
    IVLTS result = new IVLTS();

    // use the internal formatter to print to the correct precision
    result.setValue(date.toString());

    return result;
  }

  public static IVLTS convertScsDateToIVLTSWithoutTime(DateTime date) {
    IVLTS result = new IVLTS();
    result.setValue(HL7_DATE_ONLY_FORMATTER.print(date));
    return result;
  }

  public static TEL convert(Telecom ecd) {
    TEL telecom = new TEL();
    String telecomValuePrefix;

    switch (ecd.getTelecomMedium()) {
      case EMAIL: {
        telecomValuePrefix = "mailto:";
        break;
      }

      case FAX: {
        telecomValuePrefix = "fax:";
        break;
      }
      case MOBILE:
      case TELEPHONE: {
        telecomValuePrefix = "tel:";
        break;
      }

      default: {
        telecomValuePrefix = "";
        break;
      }
    }

    telecom.setValue(telecomValuePrefix + ecd.getTelecomValue());

    if (ecd.getTelecomUse() != null) {
      switch (ecd.getTelecomUse()) {
        case BUSINESS: {
          telecom.getUse().add(TelecommunicationAddressUse.WP);
          break;
        }
        case PERSONAL: {
          telecom.getUse().add(TelecommunicationAddressUse.H);
          break;
        }
        case BUSINESS_AND_PERSONAL: {
          telecom.getUse().add(TelecommunicationAddressUse.WP);
          telecom.getUse().add(TelecommunicationAddressUse.H);
          break;
        }
      }
    }

    return telecom;
  }

  /**
   * New converter for electronic communication detail
   */
  private static TEL convertEcd(ElectronicCommunicationDetail ecd) {
    TEL telecom = new TEL();
    String telecomValuePrefix;

    switch (ecd.getMedium()) {
      case EMAIL: {
        telecomValuePrefix = "mailto:";
        break;
      }

      case FAX:
      case MOBILE:
      case TELEPHONE: {
        telecomValuePrefix = "tel:";
        break;
      }

      default: {
        telecomValuePrefix = "";
        break;
      }
    }

    telecom.setValue(telecomValuePrefix + ecd.getAddress());

    if (ecd.getUsage() != null) {
      switch (ecd.getUsage()) {
        case WORKPLACE: {
          telecom.getUse().add(TelecommunicationAddressUse.WP);
          break;
        }
        case HOME: {
          telecom.getUse().add(TelecommunicationAddressUse.H);
          break;
        }
          /* case WORKPLACE_AND_HOME:
          {
            telecom.getUse().add(TelecommunicationAddressUse.WP);
            telecom.getUse().add(TelecommunicationAddressUse.H);
            break;
          }*/
      }
    }

    return telecom;
  }

  /**
   * Special override for ATS 4888 Prescrptions that need URG_PQ where PCEHR Prescriptions need PQ
   * only
   *
   * @param interval PeriodicTimeInterval
   * @return PIVLTS elements
   */
  public static PIVLTS convertURG_PQ_Minimal_interval(PeriodicIntervalTime interval) {
    PIVLTS time = new PIVLTS();

    TimeQuantity frequency = interval.getFrequency();
    if (frequency != null) {
      RTO rto = new RTO();

      if (interval.getDenominator() != null) {
        INT denominator = new INT();
        denominator.setValue(BigInteger.valueOf(interval.getDenominator()));
        rto.setDenominator(denominator);
      }
      URGPQ numerator = new URGPQ();
      numerator.setUnit(frequency.getUnit());
      numerator.setValue(frequency.getValue());
      rto.setNumerator(numerator);
      time.setFrequency(rto);
    }

    if (interval.getPhase() != null) {
      time.setPhase(convert(interval.getPhase()));
    }

    if (interval.getPeriod() != null) {

      PQ period = new PQ();
      period.setUnit(interval.getCycleAlignment().getCode());
      period.setValue(interval.getPeriod().toString());
      time.setPeriod(period);
    }

    return time;
  }

  public static PIVLTS convert(PeriodicIntervalTime interval) {
    PIVLTS time = new PIVLTS();

    TimeQuantity frequency = interval.getFrequency();
    if (frequency != null) {
      RTO rto = new RTO();

      if (interval.getDenominator() != null) {
        PQ denominator = new PQ();
        denominator.setValue(Integer.toString(interval.getDenominator()));
        rto.setDenominator(denominator);
      }
      PQ numerator = new PQ();
      numerator.setUnit(frequency.getUnit());
      numerator.setValue(frequency.getValue());
      rto.setNumerator(numerator);
      time.setFrequency(rto);
    }

    if (interval.getPhase() != null) {
      time.setPhase(convert(interval.getPhase()));
    }

    if (interval.getPeriod() != null) {

      PQ period = new PQ();
      period.setUnit(interval.getCycleAlignment().getCode());
      period.setValue(interval.getPeriod().toString());
      time.setPeriod(period);
    }

    return time;
  }

  public static PIVLTS convertPIVLWithPeriod(PeriodicIntervalTime interval) {
    PIVLTS time = new PIVLTS();

    TimeQuantity frequency = interval.getFrequency();
    if (frequency != null) {
      RTO rto = new RTO();

      if (interval.getDenominator() != null) {
        PQ denominator = new PQ();
        denominator.setValue(Integer.toString(interval.getDenominator()));
        rto.setDenominator(denominator);
      }
      PQ numerator = new PQ();
      numerator.setUnit(frequency.getUnit());
      numerator.setValue(frequency.getValue());
      rto.setNumerator(numerator);
      time.setFrequency(rto);
    }

    if (interval.getPhase() != null) {
      time.setPhase(convert(interval.getPhase()));
    }

    if (interval.getPeriod() != null) {

      PQ period = new PQ();
      period.setUnit(interval.getCycleAlignment().getCode());
      period.setValue(interval.getPeriod().toString());
      time.setPeriod(period);
    }

    return time;
  }

  public static PIVLTS convert(SimplifiedPeriodicIntervalTime time) {
    PIVLTS ivlTime = new PIVLTS();

    if (time != null) {
      PQ pq = new PQ();
      pq.setValue(time.getPeriod());
      pq.setUnit(time.getUnit());
      ivlTime.setPeriod(pq);
    }

    return ivlTime;
  }

  public static IVLTS convert(RestrictedTimeInterval ivl) {
    IVLTS ivlts = new IVLTS();

    // must add low before High!
    if (ivl.getLow() != null) {
      IVXBPQ low = new IVXBPQ();
      low.setValue(ivl.getLow().toString());
      JAXBElement<IVXBPQ> pqLow = new ObjectFactory().createIVLPQLow(low);
      ivlts.getRest().add(pqLow);
    }

    if (ivl.getWidth() != null) {
      PQ width = new PQ();
      TimeQuantity ivlWidth = ivl.getWidth();
      width.setUnit(ivlWidth.getUnit());
      if (ivlWidth.getValue() != null) {
        width.setValue(ivlWidth.getValue());
      }
      JAXBElement<PQ> pqWidth = new ObjectFactory().createIVLPQWidth(width);
      ivlts.getRest().add(pqWidth);
    }

    if (ivl.getCenter() != null) {
      PQ centre = new PQ();
      centre.setValue(ivl.getCenter().toString());
      JAXBElement<PQ> pqCentre = new ObjectFactory().createIVLPQCenter(centre);
      ivlts.getRest().add(pqCentre);
    }

    if (ivl.getHigh() != null) {
      IVXBPQ high = new IVXBPQ();
      high.setValue(ivl.getHigh().toString());
      JAXBElement<IVXBPQ> pqHigh = new ObjectFactory().createIVLPQHigh(high);
      ivlts.getRest().add(pqHigh);
    }

    return ivlts;
  }

  public static SXCMTS convert(SetComponentTime time) {

    if (time instanceof PeriodicIntervalTime) {
      return convert((PeriodicIntervalTime) time);
    } else if (time instanceof EventRelatedTimeInterval) {
      return convert((EventRelatedTimeInterval) time);
    } else if (time instanceof RestrictedTimeInterval) {
      return convert((RestrictedTimeInterval) time);
    } else if (time instanceof SetParentheticTime) {
      return convert((SetParentheticTime) time);
    } else if (time instanceof SimplifiedPeriodicIntervalTime) {
      return convert((SimplifiedPeriodicIntervalTime) time);
    }

    SXCMTS s = new SXCMTS();

    if (null == time) {
      s.setNullFlavor(NullFlavor.NA);
    } else {
      s.setOperator(time.getOperator());
      s.setValue(time.getValue().toString());
    }
    return s;
  }

  public static SXPRTS convert(SetParentheticTime time) {
    SXPRTS s = new SXPRTS();

    if (null == time) {
      s.setNullFlavor(NullFlavor.NA);
    } else {

      for (SetComponentTime c : time.getComponents()) {
        s.getComp().add(convert(c));
      }
      s.setOperator(time.getOperator());

      if (null != time.getValue()) {
        s.setValue(time.getValue().toString());
      }
    }
    return s;
  }

  public static EIVLTS convert(EventRelatedTimeInterval time) {
    EIVLTS e = new EIVLTS();

    if (null == time) {
      e.setNullFlavor(NullFlavor.NA);
    } else {

      if (null != time.getCode()) {
        EIVLEvent ce = new EIVLEvent();
        ce.setCode(time.getCode().getCode());
        e.setEvent(ce);
      }

      if (null != time.getOffset()) {
        IVLPQ pq = new IVLPQ();
        pq.setUnit(time.getOffset().getUnit());
        pq.setValue(time.getOffset().getValue());
        e.setOffset(pq);
      }

      e.setOperator(time.getOperator());

      if (null != time.getValue()) {
        e.setValue(time.getValue().toString());
      }
    }
    return e;
  }

  public static PQ convert(Quantity quantity) {
    PQ pq = new PQ();
    if (quantity.getUnit() != null) {
      pq.setUnit(quantity.getUnit());
    }

    if (quantity.getValue() != null) {
      pq.setValue(quantity.getValue());
    }
    return pq;
  }

  public static CS convertScsAccuracyIndicator(DateAccuracy dateOfBirthAccuracyIndicator) {
    CS result = new CS();
    result.setCode(dateOfBirthAccuracyIndicator.toString());
    return result;
  }

  public static INT convertIntegerToINT(Integer integer) {
    INT result = new INT();
    result.setValue(new BigInteger(String.valueOf(integer)));

    return result;
  }

  public static CE convert(Sex sex) {
    CE administrativeGenderCode = new CE();
    administrativeGenderCode.setCodeSystem("2.16.840.1.113883.13.68");
    administrativeGenderCode.setCodeSystemName("AS 5017-2006 Health Care Client Identifier Sex");

    switch (sex) {
      case MALE: {
        administrativeGenderCode.setDisplayName("Male");
        administrativeGenderCode.setCode("M");
        break;
      }
      case FEMALE: {
        administrativeGenderCode.setDisplayName("Female");
        administrativeGenderCode.setCode("F");
        break;
      }
      case INTERSEX_OR_INDETERMINATE: {
        administrativeGenderCode.setDisplayName("Intersex or Indeterminate");
        administrativeGenderCode.setCode("I");
        break;
      }
      case NOT_STATED_OR_INADEQUATELY_DESCRIBED: {
        administrativeGenderCode.setDisplayName("Not Stated/Inadequately Described");
        administrativeGenderCode.setCode("N");
        break;
      }
    }

    return administrativeGenderCode;
  }

  private static EntityNameUse getEntityNameUse(PersonNameUsage scsPersonNameUsage) {
    EntityNameUse entityNameUse = null;
    switch (scsPersonNameUsage) {
      case REGISTERED_NAME_OR_LEGAL_NAME: {
        entityNameUse = EntityNameUse.L;
        break;
      }
      case REPORTING_NAME: {
        entityNameUse = EntityNameUse.C;
        break;
      }
      case NEWBORN_NAME: {
        entityNameUse = EntityNameUse.NB;
        break;
      }
      case PROFESSIONAL_OR_BUSINESS_NAME: {
        entityNameUse = EntityNameUse.A;
        break;
      }
      case MAIDEN_NAME_OR_NAME_AT_BIRTH: {
        entityNameUse = EntityNameUse.M;
        break;
      }
      case OTHER_NAME_OR_ALIAS: {
        entityNameUse = EntityNameUse.P;
        break;
      }
    }

    return entityNameUse;
  }

  public static List<PN> convertNames(List<PersonName> names) {
    if (names == null) {
      return null;
    }

    List<PN> pns = new ArrayList<>(names.size());
    for (PersonName name : names) {
      pns.add(getPersonName(name));
    }
    return pns;
  }

  public static PN getPersonName(PersonName scsPersonName) {
    PN personName = new PN();

    if (scsPersonName.getNameTitle() != null) {
      for (String nameTitle : scsPersonName.getNameTitle()) {
        EnPrefix prefix = new EnPrefix();
        prefix.getContent().add(nameTitle);
        JAXBElement<EnPrefix> jaxbPrefix = new ObjectFactory().createENPrefix(prefix);
        personName.getContent().add(jaxbPrefix);
      }
    }

    if (scsPersonName.getFamilyName() != null) {
      EnFamily family = new EnFamily();
      family.getContent().add(scsPersonName.getFamilyName());
      JAXBElement<EnFamily> jaxbFamily = new ObjectFactory().createENFamily(family);
      personName.getContent().add(jaxbFamily);
    }

    if (scsPersonName.getGivenName() != null) {
      for (String givenName : scsPersonName.getGivenName()) {
        EnGiven given = new EnGiven();
        given.getContent().add(givenName);
        JAXBElement<EnGiven> jaxbGiven = new ObjectFactory().createENGiven(given);
        personName.getContent().add(jaxbGiven);
      }
    }

    if (scsPersonName.getNameSuffix() != null) {
      for (String nameSuffix : scsPersonName.getNameSuffix()) {
        EnSuffix suffix = new EnSuffix();
        suffix.getContent().add(nameSuffix);
        JAXBElement<EnSuffix> jaxbSuffix = new ObjectFactory().createENSuffix(suffix);
        personName.getContent().add(jaxbSuffix);
      }
    }

    if (scsPersonName.getPreferredNameIndicator() != null
        && scsPersonName.getPreferredNameIndicator()) {
      personName.getUse().add(EntityNameUse.L);
    } else if (scsPersonName.getPersonNameUsage() != null) {
      for (PersonNameUsage usage : scsPersonName.getPersonNameUsage()) {
        personName.getUse().add(getEntityNameUse(usage));
      }
    }

    return personName;
  }

  public static List<EntityIdentifier> getAsEntityIdentifier(
      List<? extends AsEntityIdentifier> ids) {
    List<EntityIdentifier> ei = new ArrayList<>(5);
    for (AsEntityIdentifier id : ids) {
      ei.add(convert(id));
    }
    return ei;
  }

  public static CE convertToCECode(Coded value) {
    CE ce;
    if (value == null) {
      return null;
    }
    if (value.isCoded()) {
      ce =
          CDATypeUtil.getCE(
              value.getCode(),
              value.getCodeSystem(),
              value.getCodeSystemName(),
              value.getDisplayName());
      if (value.getOriginalText() != null) {
        ce.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
      }
      for (Coded code : value.getTranslations()) {
        ce.getTranslation().add(convertToCDCode(code));
      }

    } else {
      ce = new CE();
      ce.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
      if (value.getDisplayName() != null) {
        ce.setDisplayName(value.getDisplayName());
      }
    }
    return ce;
  }

  public static CD convertToCDCode(Coded value) {
    CD cd;
    if (value.isCoded()) {
      cd = CDATypeUtil.getCD(value);
      if (value.getOriginalText() != null) {
        cd.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
      }
    } else {
      cd = new CD();
      cd.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
      if (value.getDisplayName() != null) {
        cd.setDisplayName(value.getDisplayName());
      }
    }
    return cd;
  }

  public static CV convertToCVCode(Coded value) {
    CV cv;
    if (value.isCoded()) {
      cv =
          CDATypeUtil.getCV(
              value.getCode(),
              value.getCodeSystem(),
              value.getCodeSystemName(),
              value.getDisplayName());
      if (value.getOriginalText() != null) {
        cv.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
      }
    } else {
      cv = new CV();
      cv.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
      if (value.getDisplayName() != null) {
        cv.setDisplayName(value.getDisplayName());
      }
    }
    return cv;
  }

  static ON getOrganizationName(
      OrganizationName cdaModelLegalAuthenticatorAssignedEntityRepresentedOrganizationName) {
    ON organizationName = new ON();
    organizationName
        .getContent()
        .add(cdaModelLegalAuthenticatorAssignedEntityRepresentedOrganizationName.getValue());

    return organizationName;
  }

  public static AD getAddress(PostalAddress model) {
    return AddressConverter.convert(model);
  }

  public static EntityNameUse getEntityNameUse(PersonNameUseEnum use) {
    EntityNameUse entityNameUse;

    switch (use) {
      case ARTIST_STAGE: {
        entityNameUse = EntityNameUse.A;
        break;
      }

      case LEGAL: {
        entityNameUse = EntityNameUse.L;
        break;
      }

      case LICENSE: {
        entityNameUse = EntityNameUse.C;
        break;
      }

      case MAIDEN_NAME: {
        entityNameUse = EntityNameUse.M;
        break;
      }

      case NEW_BORN: {
        entityNameUse = EntityNameUse.NB;
        break;
      }

      case PSEUDONYM: {
        entityNameUse = EntityNameUse.P;
        break;
      }

      default: {
        entityNameUse = EntityNameUse.L;
        break;
      }
    }

    return entityNameUse;
  }

  public static II getII(UniqueIdentifier uid) {
    II ii = new II();

    if (uid.getRoot() != null) {
      ii.setRoot(uid.getRoot());
    }

    if (uid.getExtension() != null) {
      ii.setExtension(uid.getExtension());
    }

    if (uid.getAssigningAuthorityName() != null) {
      ii.setAssigningAuthorityName(uid.getAssigningAuthorityName());
    }

    if (uid.getDisplayable() != null) {
      ii.setDisplayable(uid.getDisplayable());
    }

    if (uid.getNullFlavour() != null) { // omgwtfbbq!
      ii.setNullFlavor(uid.getNullFlavour());
    }

    return ii;
  }

  public static List<EntityIdentifier> convertEntityIdentifiers(
      List<AsEntityIdentifier> asEntityIdentifiers) {
    if (asEntityIdentifiers == null) {
      return new ArrayList<>();
    }

    List<EntityIdentifier> ids = new ArrayList<>(asEntityIdentifiers.size());
    for (AsEntityIdentifier id : asEntityIdentifiers) {
      ids.add(convert(id));
    }

    return ids;
  }

  public static EntityIdentifier convert(AsEntityIdentifier asEntityIdentifier) {

    EntityIdentifier entityIdentifier = new EntityIdentifier();
    entityIdentifier.setClassCode(EntityClass.IDENT);

    // if we have a null falvour, override the value and just print the null
    // flavour
    if (asEntityIdentifier.getNullFlavour() != null) {
      II id = new II();
      id.setNullFlavor(asEntityIdentifier.getNullFlavour());
      entityIdentifier.setId(id);
      return entityIdentifier;
    }

    II id = new II();
    id.setRoot(asEntityIdentifier.getRoot());
    id.setExtension(asEntityIdentifier.getExtension());
    id.setAssigningAuthorityName(asEntityIdentifier.getAssigningAuthorityName());
    entityIdentifier.setId(id);

    if (null != asEntityIdentifier.getAssigningGeographicAreaName()) {
      GeographicArea geographicArea = new GeographicArea();
      EntityClass entityClass =
          EntityClass.fromValue(asEntityIdentifier.getAssigningGeographicAreaClassCode());
      geographicArea.setClassCode(entityClass);
      ST geographicAreaName = new ST();
      geographicAreaName.getContent().add(asEntityIdentifier.getAssigningGeographicAreaName());
      geographicArea.setName(geographicAreaName);

      entityIdentifier.setAssigningGeographicArea(geographicArea);
    }

    if (null != asEntityIdentifier.getCode()) {
      CE code = convertToCECode(asEntityIdentifier.getCode());
      entityIdentifier.setCode(code);
    }
    return entityIdentifier;
  }

  public static TS getTS(DateTime date) {
    TS time = new TS();
    time.setValue(HL7_DATE_TIME_FORMATTER.print(date));

    return time;
  }

  public static TS getTS(PreciseDate date) {
    TS time = new TS();
    time.setValue(date.toString());

    return time;
  }

  public static RTOPQPQ convert(Ratio ratio) {
    RTOPQPQ rto = new RTOPQPQ();
    rto.setDenominator(Converter.convert(ratio.getDenominator()));
    rto.setNumerator(Converter.convert(ratio.getNumerator()));
    return rto;
  }

  public static EN convert(String s) {
    EN en = new EN();
    en.getContent().add(s);

    return en;
  }

  public static List<AD> convertAddresses(List<PostalAddress> addresses) {
    if (addresses == null) {
      return new ArrayList<>(1);
    }

    List<AD> lad = new ArrayList<>(addresses.size());
    for (PostalAddress pa : addresses) {
      lad.add(getAddress(pa));
    }

    return lad;
  }

  public static SXCMTS convertToSxcmts(org.joda.time.DateTime dateTime) {

    SXCMTS sxcmts = new SXCMTS();
    sxcmts.setValue(Converter.HL7_DATE_TIME_FORMATTER.print(dateTime));
    return sxcmts;
  }

  public static SXCMTS convertToSxcmts(PreciseDate preciseDate) {

    SXCMTS sxcmts = new SXCMTS();
    sxcmts.setValue(Converter.HL7_DATE_TIME_FORMATTER.print(preciseDate.getDateTime()));
    return sxcmts;
  }

  public static IVLPQ convert(ReferenceRange referenceRange) {
    IVLPQ referenceRangeValue = new IVLPQ();
    if (null != referenceRange) {
      IVXBPQ low = new IVXBPQ();
      low.setValue(Double.toString(referenceRange.getReferenceRange().getLow()));
      JAXBElement<IVXBPQ> lowValue = new ObjectFactory().createIVLPQLow(low);
      referenceRangeValue.getRest().add(lowValue);

      IVXBPQ high = new IVXBPQ();
      high.setValue(Double.toString(referenceRange.getReferenceRange().getHigh()));
      JAXBElement<IVXBPQ> highValue = new ObjectFactory().createIVLPQHigh(high);
      referenceRangeValue.getRest().add(highValue);

      referenceRangeValue.setUnit(referenceRange.getReferenceRange().getUnits());
    }
    return referenceRangeValue;
  }

  /* public static Collection<? extends TEL> convertElectronicCommsDetail(
      List<ElectronicCommunicationDetail> electronicCommunicationDetails) {

    List<TEL> telList = new ArrayList<>();

    if (electronicCommunicationDetails != null && !electronicCommunicationDetails.isEmpty()) {
      electronicCommunicationDetails
          .parallelStream()
          .forEach(
              electronicCommunicationDetail -> {
                TEL tel = new TEL();
              });
    }
    return telList;
  }*/

  public static IVLTS convertIVLTSwithLow(PreciseDate preciseDate) {
    IVLTS ivlts = new IVLTS();
    if (preciseDate != null) {
      IVXBPQ low = new IVXBPQ();
      low.setValue(HL7_DATE_ONLY_FORMATTER.print(preciseDate.getDateTime()));
      JAXBElement<IVXBPQ> pqLow = new ObjectFactory().createIVLPQLow(low);
      ivlts.getRest().add(pqLow);
    }
    return ivlts;
  }
}

package au.gov.nehta.builder.util;

import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.cda.common.person.PersonNameUseEnum;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.time.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.Quantity;
import au.gov.nehta.model.clinical.common.types.Ratio;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.es.ReferenceRange;
import au.net.electronichealth.ns.cda._2_0.*;
import au.net.electronichealth.ns.ci.cda.extensions._3.EntityIdentifier;
import au.net.electronichealth.ns.ci.cda.extensions._3.GeographicArea;

import javax.xml.bind.JAXBElement;
import java.math.BigInteger;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * A utility to convert from Model classes to HL7 XML classes
 */
public class Converter {

    private static ObjectFactory objectFactory = new ObjectFactory();
    private static au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory objectFactoryExt =
            new au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory();
    private static final String DATE_PATTERN_MILLIS = "yyyyMMddHHmmss.SSSSZ";
    private static final String HL7_DATE_TIME_FORMAT = "yyyyMMddHHmmssZ";
    // java.time date time formatters are threadsafe
    public static final DateTimeFormatter HL7_DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern(HL7_DATE_TIME_FORMAT);
    private static final String HL7_DATE_ONLY_FORMAT = "yyyyMMdd";
    private static final DateTimeFormatter HL7_DATE_ONLY_FORMATTER = DateTimeFormatter.ofPattern(HL7_DATE_ONLY_FORMAT);

    public static ON getOrganizationNameAndUse(Organisation scsOrganisation) {
        ON organizationName = objectFactory.createON();

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

    public static ON getOrganizationNameAndUse(EmploymentOrganization employmentOrganisation) {
        ON organizationName = objectFactory.createON();
        if (employmentOrganisation.getName() != null) {
            organizationName.getContent().add(employmentOrganisation.getName());
            if (employmentOrganisation.getOrganisationNameUsage() != null) {
                organizationName.getUse()
                        .add(getEntityOrganisationNameUse(employmentOrganisation.getOrganisationNameUsage()));
            }
        }
        return organizationName;
    }

    public static ON getOrganizationNameAndUse(String name) {
        ON organizationName = objectFactory.createON();
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
            return new ArrayList<>();
        }

        return electronicCommunicationDetails.stream().filter(Objects::nonNull)
                .map(Converter::convertEcd).collect(Collectors.toList());
    }

    public static List<TEL> convert(List<? extends Telecom> telecoms) {
        if (telecoms == null) {
            return new ArrayList<>(1);
        }
        List<TEL> telList = new ArrayList<>();
        telecoms.stream().filter(Objects::nonNull).forEach(tel -> telList.add(convert(tel)));
        return telList;
    }

    public static IVLTS convert(ZonedDateTime date) {
        IVLTS result = objectFactory.createIVLTS();
        result.setValue(date.format(HL7_DATE_TIME_FORMATTER));
        return result;
    }

    public static IVLTS convert(PreciseDate date) {
        IVLTS result = objectFactory.createIVLTS();

        // Use the internal formatter to print to the correct precision
        result.setValue(date.toString());

        return result;
    }

    public static IVLTS convertScsDateToIVLTSWithoutTime(ZonedDateTime date) {
        IVLTS result = objectFactory.createIVLTS();
        result.setValue(date.format(HL7_DATE_ONLY_FORMATTER));
        return result;
    }

    public static TEL convert(Telecom ecd) {
        TEL telecom = objectFactory.createTEL();
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
        TEL telecom = objectFactory.createTEL();
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
     * Special override for ATS 4888 Prescriptions that need URG_PQ where PCEHR Prescriptions need PQ
     * only
     *
     * @param interval PeriodicTimeInterval
     * @return PIVLTS elements
     */
    public static PIVLTS convertURG_PQ_Minimal_interval(PeriodicIntervalTime interval) {
        PIVLTS time = objectFactory.createPIVLTS();

        TimeQuantity frequency = interval.getFrequency();
        if (frequency != null) {
            RTO rto = objectFactory.createRTO();

            if (interval.getDenominator() != null) {
                INT denominator = objectFactory.createINT();
                denominator.setValue(BigInteger.valueOf(interval.getDenominator()));
                rto.setDenominator(denominator);
            }
            URGPQ numerator = objectFactory.createURGPQ();
            numerator.setUnit(frequency.getUnit());
            numerator.setValue(frequency.getValue());
            rto.setNumerator(numerator);
            time.setFrequency(rto);
        }

        if (interval.getPhase() != null) {
            time.setPhase(convert(interval.getPhase()));
        }

        if (interval.getPeriod() != null) {

            PQ period = objectFactory.createPQ();
            period.setUnit(interval.getCycleAlignment().getCode());
            period.setValue(interval.getPeriod().toString());
            time.setPeriod(period);
        }

        return time;
    }

    public static PIVLTS convert(PeriodicIntervalTime interval) {
        PIVLTS time = objectFactory.createPIVLTS();

        TimeQuantity frequency = interval.getFrequency();
        if (frequency != null) {
            RTO rto = objectFactory.createRTO();

            if (interval.getDenominator() != null) {
                PQ denominator = objectFactory.createPQ();
                denominator.setValue(Integer.toString(interval.getDenominator()));
                rto.setDenominator(denominator);
            }
            PQ numerator = objectFactory.createPQ();
            numerator.setUnit(frequency.getUnit());
            numerator.setValue(frequency.getValue());
            rto.setNumerator(numerator);
            time.setFrequency(rto);
        }

        if (interval.getPhase() != null) {
            time.setPhase(convert(interval.getPhase()));
        }

        if (interval.getPeriod() != null) {

            PQ period = objectFactory.createPQ();
            period.setUnit(interval.getCycleAlignment().getCode());
            period.setValue(interval.getPeriod().toString());
            time.setPeriod(period);
        }

        return time;
    }

    public static PIVLTS convertPIVLWithPeriod(PeriodicIntervalTime interval) {
        PIVLTS time = objectFactory.createPIVLTS();

        TimeQuantity frequency = interval.getFrequency();
        if (frequency != null) {
            RTO rto = objectFactory.createRTO();

            if (interval.getDenominator() != null) {
                PQ denominator = objectFactory.createPQ();
                denominator.setValue(Integer.toString(interval.getDenominator()));
                rto.setDenominator(denominator);
            }
            PQ numerator = objectFactory.createPQ();
            numerator.setUnit(frequency.getUnit());
            numerator.setValue(frequency.getValue());
            rto.setNumerator(numerator);
            time.setFrequency(rto);
        }

        if (interval.getPhase() != null) {
            time.setPhase(convert(interval.getPhase()));
        }

        if (interval.getPeriod() != null) {

            PQ period = objectFactory.createPQ();
            period.setUnit(interval.getCycleAlignment().getCode());
            period.setValue(interval.getPeriod().toString());
            time.setPeriod(period);
        }

        return time;
    }

    public static PIVLTS convert(SimplifiedPeriodicIntervalTime time) {
        PIVLTS ivlTime = objectFactory.createPIVLTS();

        if (time != null) {
            PQ pq = objectFactory.createPQ();
            pq.setValue(time.getPeriod());
            pq.setUnit(time.getUnit());
            ivlTime.setPeriod(pq);
        }

        return ivlTime;
    }

    public static IVLTS convert(RestrictedTimeInterval ivl) {
        IVLTS ivlts = objectFactory.createIVLTS();

        // Must add low before High!
        if (ivl.getLow() != null) {
            IVXBPQ low = objectFactory.createIVXBPQ();
            low.setValue(ivl.getLow().toString());
            JAXBElement<IVXBPQ> pqLow = objectFactory.createIVLPQLow(low);
            ivlts.getRest().add(pqLow);
        }

        processWidth(ivl, ivlts);

        if (ivl.getCenter() != null) {
            PQ centre = objectFactory.createPQ();
            centre.setValue(ivl.getCenter().toString());
            JAXBElement<PQ> pqCentre = objectFactory.createIVLPQCenter(centre);
            ivlts.getRest().add(pqCentre);
        }

        if (ivl.getHigh() != null) {
            IVXBPQ high = objectFactory.createIVXBPQ();
            high.setValue(ivl.getHigh().toString());
            JAXBElement<IVXBPQ> pqHigh = objectFactory.createIVLPQHigh(high);
            ivlts.getRest().add(pqHigh);
        }

        return ivlts;
    }

    private static void processWidth(RestrictedTimeInterval ivl, IVLTS ivlts) {
        if (ivl.getWidth() != null) {
            PQ width = objectFactory.createPQ();
            TimeQuantity ivlWidth = ivl.getWidth();
            width.setUnit(ivlWidth.getUnit());
            if (ivlWidth.getValue() != null) {
                width.setValue(ivlWidth.getValue());
            }
            JAXBElement<PQ> pqWidth = objectFactory.createIVLPQWidth(width);
            ivlts.getRest().add(pqWidth);
        }
    }

    public static IVLTS convert(RestrictedTimeInterval ivl, boolean excludeTimeInLow,
                                boolean excludeTimeInHigh, boolean excludeTimeInCenter) {
        IVLTS ivlts = objectFactory.createIVLTS();

        // Must add low before High!
        if (ivl.getLow() != null) {
            IVXBPQ low = objectFactory.createIVXBPQ();
            if (excludeTimeInLow) {
                low.setValue(ivl.getLow().toString());
            } else {
                low.setValue(ivl.getLow().getDateTime().format(DateTimeFormatter.ofPattern(DATE_PATTERN_MILLIS)));
            }
            JAXBElement<IVXBPQ> pqLow = objectFactory.createIVLPQLow(low);
            ivlts.getRest().add(pqLow);
        }

        processWidth(ivl, ivlts);

        if (ivl.getCenter() != null) {
            PQ centre = objectFactory.createPQ();
            if (excludeTimeInCenter) {
                centre.setValue(ivl.getCenter().getDateTime().toString());
            } else {
                centre.setValue(ivl.getCenter().getDateTime().format(DateTimeFormatter.ofPattern(DATE_PATTERN_MILLIS)));
            }
            JAXBElement<PQ> pqCentre = objectFactory.createIVLPQCenter(centre);
            ivlts.getRest().add(pqCentre);
        }

        if (ivl.getHigh() != null) {
            IVXBPQ high = objectFactory.createIVXBPQ();
            if (excludeTimeInHigh) {
                high.setValue(ivl.getHigh().toString());
            } else {
                high.setValue(ivl.getHigh().getDateTime().format(DateTimeFormatter.ofPattern(DATE_PATTERN_MILLIS)));
            }
            JAXBElement<IVXBPQ> pqHigh = objectFactory.createIVLPQHigh(high);
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

        SXCMTS s = objectFactory.createSXCMTS();

        if (null == time) {
            s.setNullFlavor(NullFlavor.NA);
        } else {
            s.setOperator(time.getOperator());
            s.setValue(time.getValue().toString());
        }
        return s;
    }

    public static SXPRTS convert(SetParentheticTime time) {
        SXPRTS s = objectFactory.createSXPRTS();

        if (null == time) {
            s.setNullFlavor(NullFlavor.NA);
        } else {
            time.getComponents().stream().filter(Objects::nonNull)
                    .forEach(c -> s.getComp().add(convert(c)));
            s.setOperator(time.getOperator());
            if (null != time.getValue()) {
                s.setValue(time.getValue().toString());
            }
        }
        return s;
    }

    public static EIVLTS convert(EventRelatedTimeInterval time) {
        EIVLTS e = objectFactory.createEIVLTS();

        if (null == time) {
            e.setNullFlavor(NullFlavor.NA);
        } else {

            if (null != time.getCode()) {
                EIVLEvent ce = objectFactory.createEIVLEvent();
                ce.setCode(time.getCode().getCode());
                e.setEvent(ce);
            }

            if (null != time.getOffset()) {
                IVLPQ pq = objectFactory.createIVLPQ();
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
        PQ pq = objectFactory.createPQ();
        if (quantity.getUnit() != null) {
            pq.setUnit(quantity.getUnit());
        }

        if (quantity.getValue() != null) {
            pq.setValue(quantity.getValue());
        }
        return pq;
    }

    public static CS convertScsAccuracyIndicator(DateAccuracy dateOfBirthAccuracyIndicator) {
        CS result = objectFactory.createCS();
        result.setCode(dateOfBirthAccuracyIndicator.toString());
        return result;
    }

    public static INT convertIntegerToINT(Integer integer) {
        INT result = objectFactory.createINT();
        result.setValue(new BigInteger(String.valueOf(integer)));

        return result;
    }

    public static CE convert(Sex sex) {
        CE administrativeGenderCode = objectFactory.createCE();
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
        names.stream().filter(Objects::nonNull).forEach(name -> pns.add(getPersonName(name)));
        return pns;
    }

    public static PN getPersonName(PersonName scsPersonName) {
        PN personName = objectFactory.createPN();

        if (scsPersonName.getNameTitle() != null) {
            scsPersonName.getNameTitle().stream().filter(Objects::nonNull).forEach(nameTitle -> {
                EnPrefix prefix = objectFactory.createEnPrefix();
                prefix.getContent().add(nameTitle);
                JAXBElement<EnPrefix> jaxbPrefix = objectFactory.createENPrefix(prefix);
                personName.getContent().add(jaxbPrefix);
            });
        }

        if (scsPersonName.getFamilyName() != null) {
            EnFamily family = objectFactory.createEnFamily();
            family.getContent().add(scsPersonName.getFamilyName());
            JAXBElement<EnFamily> jaxbFamily = objectFactory.createENFamily(family);
            personName.getContent().add(jaxbFamily);
        }

        if (scsPersonName.getGivenName() != null) {
            scsPersonName.getGivenName().stream().filter(Objects::nonNull).forEach(givenName -> {
                EnGiven given = objectFactory.createEnGiven();
                given.getContent().add(givenName);
                JAXBElement<EnGiven> jaxbGiven = objectFactory.createENGiven(given);
                personName.getContent().add(jaxbGiven);
            });
        }

        if (scsPersonName.getNameSuffix() != null) {
            scsPersonName.getNameSuffix().stream().filter(Objects::nonNull).forEach(nameSuffix -> {
                EnSuffix suffix = objectFactory.createEnSuffix();
                suffix.getContent().add(nameSuffix);
                JAXBElement<EnSuffix> jaxbSuffix = objectFactory.createENSuffix(suffix);
                personName.getContent().add(jaxbSuffix);
            });
        }

        if (scsPersonName.getPreferredNameIndicator() != null
                && scsPersonName.getPreferredNameIndicator()) {
            personName.getUse().add(EntityNameUse.L);
        } else if (scsPersonName.getPersonNameUsage() != null) {
            scsPersonName.getPersonNameUsage().stream().filter(Objects::nonNull)
                    .forEach(usage -> personName.getUse().add(getEntityNameUse(usage)));
        }

        return personName;
    }

    public static List<EntityIdentifier> getAsEntityIdentifier(
            List<? extends AsEntityIdentifier> ids) {
        List<EntityIdentifier> ei = new ArrayList<>(5);
        ids.stream().filter(Objects::nonNull).forEach(id -> ei.add(convert(id)));
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
            if (null != value.getCodeSystemVersion()) {
                ce.setCodeSystemVersion(value.getCodeSystemVersion());
            }
            processTranslations(value, ce);

        } else {
            ce = objectFactory.createCE();
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
            if (null != value.getCodeSystemVersion()) {
                cd.setCodeSystemVersion(value.getCodeSystemVersion());
            }
            processTranslations(value, cd);

        } else {
            cd = objectFactory.createCD();
            cd.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
            if (value.getDisplayName() != null) {
                cd.setDisplayName(value.getDisplayName());
            }
        }
        return cd;
    }

    private static void processTranslations(Coded value, CD cd) {
        if (null != value.getTranslations()) {
            value.getTranslations().stream().filter(Objects::nonNull).forEach(translationObj -> {
                if (null != translationObj.getCode() && null != translationObj.getCodeSystem()
                        && (null == translationObj.getOriginalText() || translationObj.getOriginalText()
                        .isEmpty())) {
                    cd.getTranslation().add(new CD() {{
                        setCode(translationObj.getCode());
                        setCodeSystem(translationObj.getCodeSystem());
                        setCodeSystemName(translationObj.getCodeSystemName());
                        setDisplayName(translationObj.getDisplayName());
                    }});
                } else {
                    throw new RuntimeException(
                            "Invalid translation object: A translation cannot have an originalText attribute. It must have a code and codeSystem while codeSystemName and displayName are both optional.");
                }
            });
        }
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
            if (null != value.getCodeSystemVersion()) {
                cv.setCodeSystemVersion(value.getCodeSystemVersion());
            }
        } else {
            cv = objectFactory.createCV();
            cv.setOriginalText(CDATypeUtil.getED(value.getOriginalText()));
            if (value.getDisplayName() != null) {
                cv.setDisplayName(value.getDisplayName());
            }
        }
        return cv;
    }

    static ON getOrganizationName(
            OrganizationName cdaModelLegalAuthenticatorAssignedEntityRepresentedOrganizationName) {
        ON organizationName = objectFactory.createON();
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
        II ii = objectFactory.createII();

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

        if (uid.getNullFlavour() != null) {
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
        asEntityIdentifiers.stream().filter(Objects::nonNull).forEach(id -> ids.add(convert(id)));
        return ids;
    }

    public static EntityIdentifier convert(AsEntityIdentifier asEntityIdentifier) {

        EntityIdentifier entityIdentifier = new EntityIdentifier();
        entityIdentifier.setClassCode(EntityClass.IDENT);

        // if we have a null falvour, override the value and just print the null
        // flavour
        if (asEntityIdentifier.getNullFlavour() != null) {
            II id = objectFactory.createII();
            id.setNullFlavor(asEntityIdentifier.getNullFlavour());
            entityIdentifier.setId(id);
            return entityIdentifier;
        }

        II id = objectFactory.createII();
        id.setRoot(asEntityIdentifier.getRoot());
        id.setExtension(asEntityIdentifier.getExtension());
        id.setAssigningAuthorityName(asEntityIdentifier.getAssigningAuthorityName());
        entityIdentifier.setId(id);

        if (null != asEntityIdentifier.getAssigningGeographicAreaName()) {
            GeographicArea geographicArea = objectFactoryExt.createGeographicArea();
            EntityClass entityClass =
                    EntityClass.fromValue(asEntityIdentifier.getAssigningGeographicAreaClassCode());
            geographicArea.setClassCode(entityClass);
            ST geographicAreaName = objectFactory.createST();
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

    public static TS getTS(ZonedDateTime date) {
        TS time = objectFactory.createTS();
        time.setValue(date.format(HL7_DATE_TIME_FORMATTER));
        return time;
    }

    public static TS getTS(ZonedDateTime date, boolean dateOnly) {
        TS time = objectFactory.createTS();
        if (dateOnly) {
            time.setValue(date.format(HL7_DATE_ONLY_FORMATTER));
        } else {
            time.setValue(date.format(HL7_DATE_TIME_FORMATTER));
        }
        return time;
    }

    public static TS getTS(PreciseDate date) {
        TS time = objectFactory.createTS();
        time.setValue(date.toString());
        return time;
    }

    public static RTOPQPQ convert(Ratio ratio) {
        RTOPQPQ rto = objectFactory.createRTOPQPQ();
        rto.setDenominator(Converter.convert(ratio.getDenominator()));
        rto.setNumerator(Converter.convert(ratio.getNumerator()));
        return rto;
    }

    public static EN convert(String s) {
        EN en = objectFactory.createEN();
        en.getContent().add(s);

        return en;
    }

    public static List<AD> convertAddresses(List<PostalAddress> addresses) {
        if (addresses == null) {
            return new ArrayList<>(1);
        }
        List<AD> lad = new ArrayList<>(addresses.size());
        addresses.stream().filter(Objects::nonNull).forEach(pa -> lad.add(getAddress(pa)));
        return lad;
    }

    public static SXCMTS convertToSxcmts(ZonedDateTime dateTime) {
        SXCMTS sxcmts = objectFactory.createSXCMTS();
        sxcmts.setValue(dateTime.format(Converter.HL7_DATE_TIME_FORMATTER));
        return sxcmts;
    }

    public static SXCMTS convertToSxcmts(PreciseDate preciseDate) {
        SXCMTS sxcmts = objectFactory.createSXCMTS();
        sxcmts.setValue(preciseDate.getDateTime().format(Converter.HL7_DATE_TIME_FORMATTER));
        return sxcmts;
    }

    public static IVLPQ convert(ReferenceRange referenceRange) {
        IVLPQ referenceRangeValue = objectFactory.createIVLPQ();
        if (null != referenceRange) {
            IVXBPQ low = objectFactory.createIVXBPQ();
            low.setValue(Double.toString(referenceRange.getReferenceRange().getLow()));
            JAXBElement<IVXBPQ> lowValue = objectFactory.createIVLPQLow(low);
            referenceRangeValue.getRest().add(lowValue);

            IVXBPQ high = objectFactory.createIVXBPQ();
            high.setValue(Double.toString(referenceRange.getReferenceRange().getHigh()));
            JAXBElement<IVXBPQ> highValue = objectFactory.createIVLPQHigh(high);
            referenceRangeValue.getRest().add(highValue);

            referenceRangeValue.setUnit(referenceRange.getReferenceRange().getUnits());
        }
        return referenceRangeValue;
    }

    public static IVLTS convertIVLTSwithLow(PreciseDate preciseDate) {
        IVLTS ivlts = objectFactory.createIVLTS();
        if (preciseDate != null) {
            IVXBPQ low = objectFactory.createIVXBPQ();
            low.setValue(preciseDate.getDateTime().format(HL7_DATE_ONLY_FORMATTER));
            JAXBElement<IVXBPQ> pqLow = objectFactory.createIVLPQLow(low);
            ivlts.getRest().add(pqLow);
        }
        return ivlts;
    }
}

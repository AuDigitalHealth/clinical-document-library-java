package au.gov.nehta.builder.common;

import au.gov.nehta.builder.etp.eprescription.EPrescriptionCreatorUtil;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.common.time.SimplifiedPeriodicIntervalTime;
import au.gov.nehta.model.clinical.common.Immunisation;
import au.gov.nehta.model.clinical.common.KnownMedication;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.Procedure;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.AdverseReaction;
import au.gov.nehta.model.clinical.common.types.Manifestation;
import au.gov.nehta.model.clinical.common.types.RealQuantity;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.diagnostic.imaging.AnatomicalSite;
import au.gov.nehta.model.clinical.diagnostic.imaging.ImagingExaminationResult;
import au.gov.nehta.model.clinical.diagnostic.pathology.PathologyResult;
import au.gov.nehta.model.clinical.diagnostic.pathology.ReportDocument;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.*;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipation;
import au.gov.nehta.model.clinical.etp.dispenserecord.ClaimTypeCategory;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItem;
import au.gov.nehta.model.clinical.etp.eprescription.BodyHeight;
import au.gov.nehta.model.clinical.etp.eprescription.BodyWeight;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionCommunicationMedium;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionDetail;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionSource;
import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.gov.nehta.model.clinical.shs.UncatagorisedMedicalHistoryItem;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.*;
import au.net.electronichealth.ns.ci.cda.extensions._3.*;

import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * A base utility class that can be overridden for specialized HL7 entry components.
 */
public class EntryCreator extends Creator {

    protected static final String COVERAGE_TYPE_CODE = "COVBY";

    // Subject of Care Date Of Birth Calculated From Age
    public static POCDMT000040Entry createSubjectOfCareCalcAgeEntry(Boolean dobCalculatedFromAge) {

        return getBaseObservationEntry(SectionEntryCodeSet.DATE_OF_BIRTH_IS_CALCULATED_FROM_AGE,
                CDATypeUtil.getBL(dobCalculatedFromAge));
    }

    // Subject of Care Date Of Birth Accuracy Entry
    public static POCDMT000040Entry createSubjectOfCareDateOfBirthAccuracyEntry(
            DateAccuracy BirthAccuracy) {

        return getBaseObservationEntry(SectionEntryCodeSet.DATE_OF_BIRTH_ACCURACY_INDICATOR,
                Converter.convertScsAccuracyIndicator(BirthAccuracy));
    }

    // Subject of Care Date Of Death Date Accuracy Entry
    public static POCDMT000040Entry createDeathDateAccuracyEntry(DateAccuracy accuracy) {

        return getBaseObservationEntry(SectionEntryCodeSet.DATE_OF_DEATH_ACCURACY_INDICATOR,
                Converter.convertScsAccuracyIndicator(accuracy));
    }

    public static POCDMT000040Entry createDeathSourceCodeEntry(Coded sourceCode) {

        return getBaseObservationEntry(SectionEntryCodeSet.SOURCE_OF_DEATH_CODE,
                Converter.convertToCDCode(sourceCode));
    }


    public static POCDMT000040Entry createMothersMaidenNameEntry(String maidenName) {

        PersonName pn = new PersonNameImpl(maidenName);
        pn.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

        return getBaseObservationEntry(SectionEntryCodeSet.MOTHERS_MAIDEN_NAME,
                Converter.getPersonName(pn));
    }

    public static POCDMT000040Entry getBaseObservationEntry(CE observationCode, ANY value) {

        POCDMT000040Entry entry = getDRIVEntry();
        POCDMT000040Observation observation = getObsEvn();
        observation.setCode(observationCode);
        String observationId = UUID.randomUUID().toString();
        observation.getId().add(CDATypeUtil.getII(observationId));
        observation.getValue().add(value);
        entry.setObservation(observation);
        return entry;
    }

    public static POCDMT000040Component3 getLogo(Logo logo) {

        POCDMT000040Component3 LogoSectionComponent = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();

        POCDMT000040Entry logoentry = EntryCreator.getLogoEntry(logo);
        section.getEntry().add(logoentry);
        LogoSectionComponent.setSection(section);

        return LogoSectionComponent;
    }


    // Subject of Care Age Entry
    public static POCDMT000040Entry createSubjectOfCareAgeEntry(String subjectOfCareAge) {

        PQ observationValue = new PQ();
        observationValue.setValue(subjectOfCareAge);
        observationValue.setUnit("a");

        return getBaseObservationEntry(SectionEntryCodeSet.AGE, observationValue);
    }

    // Subject of Care Age Accuracy Entry
    public static POCDMT000040Entry createSubjectOfCareAgeAccuracyEntry(Boolean ageAccuracy) {

        return getBaseObservationEntry(SectionEntryCodeSet.AGE_ACCURACY_INDICATOR,
                CDATypeUtil.getBL(ageAccuracy));
    }

    // Subject of Care Birth Plurality Entry
    public static POCDMT000040Entry createSubjectOfCareBirthPluralityEntry(Integer birthPlurality) {

        return getBaseObservationEntry(SectionEntryCodeSet.BIRTH_PLURALITY,
                CDATypeUtil.getINT(birthPlurality));
    }

    // Prescription item
    public static POCDMT000040Entry getSubstanceAdministrationEntry(PrescriptionItem item) {

        POCDMT000040Entry entry = getDRIVEntry();
        POCDMT000040SubstanceAdministration substanceAdministration = new POCDMT000040SubstanceAdministration();
        substanceAdministration.setMoodCode(XDocumentSubstanceMood.RQO);
        substanceAdministration.setClassCode(ActClass.SBADM);
        substanceAdministration.getId().add(Converter.getII(item.getPrescriptionItemIdentifier()));
        POCDMT000040Consumable consumable = new POCDMT000040Consumable();

        POCDMT000040ManufacturedProduct consumeableManufacturedProduct = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material manufacturedMaterial = new POCDMT000040Material();
        manufacturedMaterial.setCode(Converter.convertToCECode(item.getPbsRpbsItemCode()));
        consumeableManufacturedProduct.setManufacturedMaterial(manufacturedMaterial);

        if (item.getGroundsForConcurrentSupply() != null) {
            Subject1 grounds = new Subject1();
            Policy groundsPolicy = getJurispolPermPolicy();
            groundsPolicy
                    .setCode(ConcurrentSupplyGroundsCodeSet.convert(item.getGroundsForConcurrentSupply()));
            grounds.setPolicy(groundsPolicy);
            consumeableManufacturedProduct.getSubjectOf1().add(grounds);
        }

        if (item.getStateAuthorityNumber() != null) {
            Subject1 auth = new Subject1();
            Policy authPolicy = getJurispolPermPolicy();

            authPolicy.setId(Converter.getII(item.getStateAuthorityNumber()));
            authPolicy.setCode(SectionEntryCodeSet.STATE_AUTHORITY_NUMBER);
            auth.setPolicy(authPolicy);
            consumeableManufacturedProduct.getSubjectOf1().add(auth);
        }

        if (item.getPbsAuthorityPrescriptionNumber() != null) {
            Subject1 auth = new Subject1();
            Policy authPolicy = getJurispolPermPolicy();

            authPolicy.setId(Converter.getII(item.getPbsAuthorityPrescriptionNumber()));
            authPolicy.setCode(SectionEntryCodeSet.PBS_RPBS_AUTHORITY_PRESCRIPTION_NUMBER);
            auth.setPolicy(authPolicy);
            consumeableManufacturedProduct.getSubjectOf1().add(auth);
        }

        if (item.getStreamlinedAuthorityApprovalNumber() != null) {
            Subject1 auth = new Subject1();
            Policy authPolicy = getJurispolPermPolicy();

            authPolicy.setId(Converter.getII(item.getStreamlinedAuthorityApprovalNumber()));
            authPolicy.setCode(SectionEntryCodeSet.STREAMLINED_AUTHORITY_APPROVAL_NUMBER);
            auth.setPolicy(authPolicy);
            consumeableManufacturedProduct.getSubjectOf1().add(auth);
        }

        if (item.getReasonForTherapeuticGood() != null) {
            substanceAdministration.getEntryRelationship().add(getReasonEntryRelationship(item));
        }

        if (item.getAdditionalComments() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getCommentsEntryRelationship(item.getAdditionalComments()));
        }

        if (item.getTimingDescription() != null) {
            substanceAdministration.getEntryRelationship().add(getTimingDescriptionEntry(item));
        }

        for (SetComponentTime time : item.getStructuredTime()) {
            substanceAdministration.getEffectiveTime().add(Converter.convert(time));
        }

        if (item.getDirections() != null) {
            ED substanceAdministrationText = new ED();
            substanceAdministrationText.getContent().add(item.getDirections());
            substanceAdministration.setText(substanceAdministrationText);
        }

        if (item.getDosage() != null) {
            addDosageEntries(substanceAdministration, consumeableManufacturedProduct, item.getDosage());

            if (item.getDosage().getDoseQuantity() != null
                    && item.getDosage().getDoseQuantity().getCodedUnit() != null) {

                manufacturedMaterial.setFormCode(
                        Converter.convertToCDCode(item.getDosage().getDoseQuantity().getCodedUnit()));
            }
        }

        addExpmoraneousIngredients(manufacturedMaterial, item.getExtemporaneousIngredients());
        consumeableManufacturedProduct.setManufacturedMaterial(manufacturedMaterial);

        consumable.setManufacturedProduct(consumeableManufacturedProduct);
        substanceAdministration.setConsumable(consumable);

        if (item.getPbsRpbsItemCode() != null) {
            manufacturedMaterial.setCode(Converter.convertToCECode(item.getPbsRpbsItemCode()));
        }

        consumable.setManufacturedProduct(consumeableManufacturedProduct);
        addExpmoraneousIngredients(manufacturedMaterial, item.getExtemporaneousIngredients());

        substanceAdministration.setConsumable(consumable);

        if (item.isLongTerm() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getLongTermRelationship(item.isLongTerm()));
        }

        if (item.getFormula() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getFormulaEntryRelationship(item.getFormula()));
        }

        if (item.getPRN() != null) {
            POCDMT000040Precondition pre = new POCDMT000040Precondition();
            POCDMT000040Criterion c = new POCDMT000040Criterion();
            BL bl = new BL();
            bl.setValue(item.getPRN());
            c.setValue(bl);
            pre.setCriterion(c);
            substanceAdministration.getPrecondition().add(pre);
        }

        if (item.getStartCriterion() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getStartCriterionEntryRelationship(item.getStartCriterion()));
        }

        if (item.getMedicationInstructionIdentifier() != null) {
            substanceAdministration.getReference()
                    .add(getMedicationInstructionReference(item.getMedicationInstructionIdentifier()));
        }

        if (item.getStopCriterion() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getStopCriterionEntryRelationship(item.getStartCriterion()));
        }

        if (item.getRouteCode() != null) {
            substanceAdministration.setRouteCode(Converter.convertToCECode(item.getRouteCode()));
        }

        if (item.getApproachSiteCode() != null) {
            substanceAdministration.getApproachSiteCode()
                    .add(Converter.convertToCECode(item.getApproachSiteCode()));
        }

        if (item.getMethodCode() != null) {
            substanceAdministration.setMethodCode(Converter.convertToCECode(item.getMethodCode()));
        }

        substanceAdministration.getEntryRelationship().add(getATS4888SupplyEntryRelationship(item));

        IVLINT repeatNumber = new IVLINT();
        IVXBINT repeatNumberHigh = new IVXBINT();
        repeatNumberHigh.setValue(BigInteger.valueOf(item.getMaximumNumberOfRepeats()));
        ObjectFactory factory = new ObjectFactory();
        JAXBElement<IVXBINT> IVLINTHigh = factory.createIVLINTHigh(repeatNumberHigh);
        repeatNumber.getRest().add(IVLINTHigh);
        substanceAdministration.setRepeatNumber(repeatNumber);

        entry.setSubstanceAdministration(substanceAdministration);

        return entry;
    }

    // Prescription item
    public static POCDMT000040Entry getPRSubstanceAdministrationEntry(PrescriptionItem item) {

        POCDMT000040Entry entry = getDRIVEntry();
        POCDMT000040SubstanceAdministration substanceAdministration = new POCDMT000040SubstanceAdministration();
        substanceAdministration.setMoodCode(XDocumentSubstanceMood.RQO);
        substanceAdministration.setClassCode(ActClass.SBADM);
        substanceAdministration.getId().add(Converter.getII(item.getPrescriptionItemIdentifier()));
        POCDMT000040Consumable consumable = new POCDMT000040Consumable();

        POCDMT000040ManufacturedProduct consumeableManufacturedProduct = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material manufacturedMaterial = new POCDMT000040Material();
        manufacturedMaterial.setCode(Converter.convertToCECode(item.getPbsRpbsItemCode()));
        consumeableManufacturedProduct.setManufacturedMaterial(manufacturedMaterial);

        if (item.getGroundsForConcurrentSupply() != null) {
            Subject1 grounds = new Subject1();
            Policy groundsPolicy = getJurispolPermPolicy();
            groundsPolicy
                    .setCode(ConcurrentSupplyGroundsCodeSet.convert(item.getGroundsForConcurrentSupply()));
            grounds.setPolicy(groundsPolicy);
            consumeableManufacturedProduct.getSubjectOf1().add(grounds);
        }

        if (item.getStateAuthorityNumber() != null) {
            Subject1 sub = new Subject1();
            Policy authPolicy = getJurispolPermPolicy();

            authPolicy.setId(Converter.getII(item.getStateAuthorityNumber()));
            authPolicy.setCode(SectionEntryCodeSet.STATE_AUTHORITY_NUMBER);
            sub.setPolicy(authPolicy);
            consumeableManufacturedProduct.getSubjectOf1().add(sub);
        }

        if (item.getReasonForTherapeuticGood() != null) {
            substanceAdministration.getEntryRelationship().add(getReasonEntryRelationship(item));
        }

        if (item.getAdditionalComments() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getCommentsEntryRelationship(item.getAdditionalComments()));
        }

        if (item.getTimingDescription() != null) {
            substanceAdministration.getEntryRelationship().add(getTimingDescriptionEntry(item));
        }

        for (SetComponentTime time : item.getStructuredTime()) {
            substanceAdministration.getEffectiveTime().add(Converter.convert(time));
        }

        if (item.getDirections() != null) {
            ED substanceAdministrationText = new ED();
            substanceAdministrationText.getContent().add(item.getDirections());
            substanceAdministration.setText(substanceAdministrationText);
        }

        if (item.getDosage() != null) {
            addDosageEntries(substanceAdministration, consumeableManufacturedProduct, item.getDosage());

            if (item.getDosage().getDoseQuantity() != null
                    && item.getDosage().getDoseQuantity().getCodedUnit() != null) {
                manufacturedMaterial.setFormCode(
                        Converter.convertToCDCode(item.getDosage().getDoseQuantity().getCodedUnit()));
            }
        }

        addExpmoraneousIngredients(manufacturedMaterial, item.getExtemporaneousIngredients());
        consumeableManufacturedProduct.setManufacturedMaterial(manufacturedMaterial);

        consumable.setManufacturedProduct(consumeableManufacturedProduct);
        substanceAdministration.setConsumable(consumable);

        if (item.getPbsRpbsItemCode() != null) {
            manufacturedMaterial.setCode(Converter.convertToCECode(item.getPbsRpbsItemCode()));
        }

        consumable.setManufacturedProduct(consumeableManufacturedProduct);
        addExpmoraneousIngredients(manufacturedMaterial, item.getExtemporaneousIngredients());

        substanceAdministration.setConsumable(consumable);

        if (item.isLongTerm() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getLongTermRelationship(item.isLongTerm()));
        }

        if (item.getFormula() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getFormulaEntryRelationship(item.getFormula()));
        }

        if (item.getPRN() != null) {
            POCDMT000040Precondition pre = new POCDMT000040Precondition();
            POCDMT000040Criterion c = new POCDMT000040Criterion();
            BL bl = new BL();
            bl.setValue(item.getPRN());
            c.setValue(bl);
            pre.setCriterion(c);
            substanceAdministration.getPrecondition().add(pre);
        }

        if (item.getStartCriterion() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getStartCriterionEntryRelationship(item.getStartCriterion()));
        }

        if (item.getMedicationInstructionIdentifier() != null) {
            substanceAdministration.getReference()
                    .add(getMedicationInstructionReference(item.getMedicationInstructionIdentifier()));
        }

        if (item.getStopCriterion() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getStopCriterionEntryRelationship(item.getStartCriterion()));
        }

        if (item.getRouteCode() != null) {
            substanceAdministration.setRouteCode(Converter.convertToCECode(item.getRouteCode()));
        }

        if (item.getApproachSiteCode() != null) {
            substanceAdministration.getApproachSiteCode()
                    .add(Converter.convertToCECode(item.getApproachSiteCode()));
        }

        if (item.getMethodCode() != null) {
            substanceAdministration.setMethodCode(Converter.convertToCECode(item.getMethodCode()));
        }

        POCDMT000040EntryRelationship supplyEntryRelationship = getATS4888SupplyEntryRelationship(item);

        if (item.getPbsAuthorityPrescriptionNumber() != null) {
            Coverage pbsRpbs = getBaseCoverage();
            PolicyOrAccount authPolicy = getCovPermPolicyOrAccount();

            authPolicy.setId(Converter.getII(item.getPbsAuthorityPrescriptionNumber()));
            authPolicy.setCode(SectionEntryCodeSet.PBS_RPBS_AUTHORITY_PRESCRIPTION_NUMBER);
            pbsRpbs.setPolicyOrAccount(authPolicy);
            supplyEntryRelationship.getSupply().getCoverage().add(pbsRpbs);
        }

        if (item.getStreamlinedAuthorityApprovalNumber() != null) {
            Coverage auth = getBaseCoverage();
            PolicyOrAccount polAcc = getCovPermPolicyOrAccount();

            polAcc.setId(Converter.getII(item.getStreamlinedAuthorityApprovalNumber()));
            polAcc.setCode(SectionEntryCodeSet.STREAMLINED_AUTHORITY_APPROVAL_NUMBER);
            auth.setPolicyOrAccount(polAcc);
            supplyEntryRelationship.getSupply().getCoverage().add(auth);
        }

        substanceAdministration.getEntryRelationship().add(supplyEntryRelationship);

        IVLINT repeatNumber = new IVLINT();
        IVXBINT repeatNumberHigh = new IVXBINT();
        repeatNumberHigh.setValue(BigInteger.valueOf(item.getMaximumNumberOfRepeats()));
        ObjectFactory factory = new ObjectFactory();
        JAXBElement<IVXBINT> createIVLINTHigh = factory.createIVLINTHigh(repeatNumberHigh);
        repeatNumber.getRest().add(createIVLINTHigh);
        substanceAdministration.setRepeatNumber(repeatNumber);

        entry.setSubstanceAdministration(substanceAdministration);

        return entry;
    }


    protected static POCDMT000040Reference getMedicationInstructionReference(
            UniqueIdentifier medicationInstructionIdentifier) {

        POCDMT000040Reference medIns = new POCDMT000040Reference();
        medIns.setTypeCode(XActRelationshipExternalReference.SPRT);
        //<seperatableInd value="true" />
        BL bltrue = new BL();
        bltrue.setValue(true);
        medIns.setSeperatableInd(bltrue);

        POCDMT000040ExternalAct act = new POCDMT000040ExternalAct();
        act.setMoodCode(ActMood.EVN);
        medIns.setExternalAct(act);

        act.getId().add(Converter.getII(medicationInstructionIdentifier));

        NCTISDataComponent insCode = new NCTISDataComponent("103.16444",
                "Medication Instruction Identifier");
        act.setCode(Converter.convertToCDCode(insCode));

        return medIns;
    }

    protected static void addExpmoraneousIngredients(POCDMT000040Material manufacturedMaterial,
                                                     List<Ingredient> extemporaneousIngredients) {

        for (Ingredient i : extemporaneousIngredients) {
            au.net.electronichealth.ns.ci.cda.extensions._3.Ingredient ingrd = new au.net.electronichealth.ns.ci.cda.extensions._3.Ingredient();
            ingrd.setClassCode(RoleClassRoot.INGR);
            ManufacturedMaterial mat = new ManufacturedMaterial();
            mat.setClassCode(EntityClass.MMAT);
            mat.setDeterminerCode(EntityDeterminer.KIND);
            mat.setCode(Converter.convertToCVCode(i.getIngredientCode()));
            mat.setQuantity(Converter.convert(i.getQuantity()));
            ingrd.setIngredientManufacturedMaterial(mat);

            manufacturedMaterial.getAsIngredient().add(ingrd);
        }

    }

    protected static void addDosageEntries(
            POCDMT000040SubstanceAdministration substanceAdministration,
            POCDMT000040ManufacturedProduct manufacturedProduct,
            Dosage dosage) {

        QuantityUnitDescription qty = dosage.getDoseQuantity();
        if (qty.getQuantityDescription() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getQuantityDescriptionEntry(qty.getQuantityDescription()));
        }

        if (qty.getRealQuantity() != null) {
            IVLPQ pivl = new IVLPQ();
            pivl.setValue(qty.getRealQuantity().getValue());

            if (qty.getRealQuantity().getUnit() != null) {
                pivl.setUnit(qty.getRealQuantity().getUnit());
            }
            // substanceAdministration.getConsumable().getManufacturedProduct();
            substanceAdministration.setDoseQuantity(pivl);
        }

        if (dosage.getMaxDose() != null) {
            substanceAdministration.setMaxDoseQuantity(Converter.convert(dosage.getMaxDose()));
        }
    }

    protected static POCDMT000040EntryRelationship getLongTermRelationship(Boolean longTerm) {

        POCDMT000040EntryRelationship longTermER = getCompER();
        POCDMT000040Observation obs = getObsEvn();

        NCTISDataComponent longTermCode = new NCTISDataComponent("103.16440", "Long-Term");

        BL independentIndValue = new BL();
        independentIndValue.setValue(longTerm);

        obs.setCode(Converter.convertToCDCode(longTermCode));
        obs.getValue().add(independentIndValue);

        longTermER.setObservation(obs);
        return longTermER;
    }

    protected static POCDMT000040EntryRelationship getStopCriterionEntryRelationship(
            PreciseDate startCriterion) {

        POCDMT000040EntryRelationship start = getCompER();
        ControlAct control = getControlActEvnControlAct();

        NCTISDataComponent startCode = new NCTISDataComponent("103.16436", "Start Criterion");
        control.setCode(Converter.convertToCDCode(startCode));

        IVLTS ts = new IVLTS();
        ts.setValue(startCriterion.toString());
        control.setEffectiveTime(ts);

        start.setControlAct(control);
        return start;
    }

    protected static POCDMT000040EntryRelationship getStartCriterionEntryRelationship(
            PreciseDate startCriterion) {

        POCDMT000040EntryRelationship stop = getCompER();
        ControlAct control = getControlActEvnControlAct();

        NCTISDataComponent stopCode = new NCTISDataComponent("103.16434", "Stop Criterion");
        control.setCode(Converter.convertToCDCode(stopCode));

        IVLTS ts = new IVLTS();
        ts.setValue(startCriterion.toString());
        control.setEffectiveTime(ts);

        stop.setControlAct(control);
        return stop;
    }

    protected static POCDMT000040EntryRelationship getQuantityDescriptionEntry(String desc) {

        POCDMT000040EntryRelationship quantityDescription = new POCDMT000040EntryRelationship();
        POCDMT000040Act quantityDescriptionAct = new POCDMT000040Act();
        quantityDescription.setTypeCode(XActRelationshipEntryRelationship.COMP);

        SNOMED_AU_Code qaunt = new SNOMED_AU_Code("246205007", "Quantity");
        quantityDescriptionAct.setCode(Converter.convertToCDCode(qaunt));
        quantityDescriptionAct.setText(CDATypeUtil.getED(desc));
        quantityDescriptionAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        quantityDescriptionAct.setMoodCode(XDocumentActMood.INT);
        quantityDescription.setAct(quantityDescriptionAct);
        return quantityDescription;
    }

    protected static POCDMT000040EntryRelationship getTimingDescriptionEntry(PrescriptionItem item) {

        POCDMT000040EntryRelationship quantityDescription = new POCDMT000040EntryRelationship();
        POCDMT000040Act quantityDescriptionAct = new POCDMT000040Act();
        quantityDescription.setTypeCode(XActRelationshipEntryRelationship.COMP);

        SNOMEDCode code = new SNOMEDCode("246512002", "Timing");

        quantityDescriptionAct.setCode(Converter.convertToCDCode(code));
        quantityDescriptionAct.setText(CDATypeUtil.getED(item.getTimingDescription()));
        quantityDescriptionAct.setClassCode(XActClassDocumentEntryAct.ACT);
        quantityDescriptionAct.setMoodCode(XDocumentActMood.EVN);
        quantityDescription.setAct(quantityDescriptionAct);
        return quantityDescription;
    }

    // Dispense Item
    public static POCDMT000040Entry getSubstanceAdministrationEntry(DispenseItem item) {

        POCDMT000040Entry entry = getDRIVEntry();
        POCDMT000040SubstanceAdministration substanceAdministration = new POCDMT000040SubstanceAdministration();
        substanceAdministration.setMoodCode(XDocumentSubstanceMood.RQO);
        substanceAdministration.setClassCode(ActClass.SBADM);

        CS statusCode = new CS();
        if (item.getNumberOfThisDispense() < item.getMaxRepeats()) {
            statusCode.setCode("active");
        } else {
            statusCode.setCode("completed");
        }
        substanceAdministration.setStatusCode(statusCode);

        substanceAdministration.getId().add(Converter.getII(item.getPrescriptionItem()));

        POCDMT000040Consumable consumable = new POCDMT000040Consumable();
        POCDMT000040ManufacturedProduct manufacturedProduct = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material manufacturedMaterial = new POCDMT000040Material();
        manufacturedMaterial.setCode(Converter.convertToCECode(item.getTheraputicGood()));
        addExpmoraneousIngredients(manufacturedMaterial, item.getExtemporaneousIngredients());
        manufacturedProduct.setManufacturedMaterial(manufacturedMaterial);
        consumable.setManufacturedProduct(manufacturedProduct);
        substanceAdministration.setConsumable(consumable);

        if (item.getFormula() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getFormulaEntryRelationship(item.getFormula()));
        }

        substanceAdministration.getEntryRelationship().add(getSupplyEntryRelationship(item));

        IVLINT repeatNumber = new IVLINT();
        IVXBINT repeatNumberHigh = new IVXBINT();
        repeatNumberHigh.setValue(BigInteger.valueOf(item.getMaxRepeats()));
        JAXBElement<IVXBINT> high = new JAXBElement<>(new QName("urn:hl7-org:v3", "high"),
                IVXBINT.class, repeatNumberHigh);

        repeatNumber.getRest().add(high);

        substanceAdministration.setRepeatNumber(repeatNumber);

        if (item.getAdditionalComments() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getCommentsEntryRelationship(item.getAdditionalComments()));
        }

        if (item.getPatientCategory() != null) {
            substanceAdministration.getEntryRelationship()
                    .add(getPatientCategoryEntryRelationship(item.getPatientCategory()));
        }

        if (item.getRacfId() != null && !item.getRacfId().isEmpty()) {
            substanceAdministration.getEntryRelationship()
                    .add(getRACFIDEntryRelationship(item.getRacfId()));
        }

        entry.setSubstanceAdministration(substanceAdministration);

        return entry;
    }

    public static POCDMT000040Entry getExpiryEntry(PrescriptionItem scsPrescriptionItem) {

        POCDMT000040Entry expiryEntry = getDRIVEntry();

        POCDMT000040Observation observation = getObsEvn();
        String observationId = UUID.randomUUID().toString();
        observation.getId().add(CDATypeUtil.getII(observationId));
        observation.setCode(SectionEntryCodeSet.DATE_TIME_PRESCRIPTION_EXPIRES);
        observation.setEffectiveTime(Converter
                .convertScsDateToIVLTSWithoutTime(scsPrescriptionItem.getDateTimePrescriptionExpires()));
        expiryEntry.setObservation(observation);

        return expiryEntry;
    }

    public static POCDMT000040EntryRelationship getCommentsEntryRelationship(String comments) {

        POCDMT000040EntryRelationship entryRelationship = getCompER();
        POCDMT000040Act commentsAct = getInfrmEvn();
        String commentsActId = UUID.randomUUID().toString();
        commentsAct.getId().add(CDATypeUtil.getII(commentsActId));
        commentsAct.setCode(SectionEntryCodeSet.ADDITIONAL_COMMENTS);
        commentsAct.setText(CDATypeUtil.getST(comments));
        entryRelationship.setAct(commentsAct);

        return entryRelationship;
    }

    public static POCDMT000040EntryRelationship getPatientCategoryEntryRelationship(
            Coded patientCategory) {

        POCDMT000040EntryRelationship entryRelationship = getCompER();
        POCDMT000040Act commentsAct = new POCDMT000040Act();
        commentsAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        commentsAct.setMoodCode(XDocumentActMood.RQO);
        String commentsActId = UUID.randomUUID().toString();
        commentsAct.getId().add(CDATypeUtil.getII(commentsActId));

        commentsAct.setCode(Converter.convertToCDCode(patientCategory));
        commentsAct.setText(CDATypeUtil.getST(patientCategory.getDisplayName()));
        entryRelationship.setAct(commentsAct);

        return entryRelationship;
    }


    public static POCDMT000040EntryRelationship getRACFIDEntryRelationship(String racfId) {

        POCDMT000040EntryRelationship entryRelationship = getCompER();
        POCDMT000040Act racfAct = new POCDMT000040Act();

        racfAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        racfAct.setMoodCode(XDocumentActMood.RQO);
        String racfActId = UUID.randomUUID().toString();
        racfAct.getId().add(CDATypeUtil.getII(racfActId));
        CD code = SectionEntryCodeSet.RACF;
        code.setCode("To_be_determined");
        racfAct.setCode(code);
        racfAct.setText(CDATypeUtil.getST(racfId));
        entryRelationship.setAct(racfAct);

        return entryRelationship;
    }

    public static POCDMT000040EntryRelationship getReasonEntryRelationship(PrescriptionItem item) {

        POCDMT000040EntryRelationship entryRelationship = new POCDMT000040EntryRelationship();

        entryRelationship.setTypeCode(XActRelationshipEntryRelationship.RSON);
        POCDMT000040Act reasonAct = new POCDMT000040Act();
        reasonAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        reasonAct.setMoodCode(XDocumentActMood.RQO);
        String reasonActId = UUID.randomUUID().toString();
        reasonAct.getId().add(CDATypeUtil.getII(reasonActId));
        reasonAct.setCode(SectionEntryCodeSet.REASON_FOR_THERAPEUTIC_GOOD);
        reasonAct.setText(CDATypeUtil.getST(item.getReasonForTherapeuticGood()));
        entryRelationship.setAct(reasonAct);

        return entryRelationship;
    }

    public static POCDMT000040EntryRelationship getFormulaEntryRelationship(String formula) {

        POCDMT000040EntryRelationship entryRelationship = getCompER();
        POCDMT000040Act formulaAct = new POCDMT000040Act();
        formulaAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        formulaAct.setMoodCode(XDocumentActMood.RQO);
        String formulaActId = UUID.randomUUID().toString();
        formulaAct.getId().add(CDATypeUtil.getII(formulaActId));
        formulaAct.setCode(SectionEntryCodeSet.FORMULA);

        formulaAct.setText(CDATypeUtil.getST(formula));
        entryRelationship.setAct(formulaAct);

        return entryRelationship;
    }

    public static POCDMT000040EntryRelationship getATS4888SupplyEntryRelationship(
            PrescriptionItem item) {

        POCDMT000040EntryRelationship supplyEntryRelationship = getCompER();
        POCDMT000040Supply supply = new POCDMT000040Supply();
        supply.setMoodCode(XDocumentSubstanceMood.RQO);
        supply.setClassCode(ActClassSupply.SPLY);

        if (item.getDispensItemIdentifier() != null) {
            supply.getId().add(Converter.getII(item.getDispensItemIdentifier()));
        }

        if (item.getBrandSubstituteAllowed() != null && item.getBrandSubstituteAllowed()) {
            Subject2 subject2 = new Subject2();
            // subject2.setTypeCode(ParticipationTargetSubject.SBJ);
            SubstitutionPermission substitutionPermissionValue = new SubstitutionPermission();
            substitutionPermissionValue.setClassCode(ActClass.SUBST);
            substitutionPermissionValue.setMoodCode(ActMood.PERM);
            substitutionPermissionValue.setCode(SectionEntryCodeSet.N_SUBSTITUTION);
            subject2.setSubstitutionPermission(substitutionPermissionValue);
            supply.setSubjectOf2(subject2);
        }

        SimplifiedPeriodicIntervalTime minimumIntervalBetweenRepeats = item
                .getMinimumIntervalBetweenRepeats();
        if (minimumIntervalBetweenRepeats != null) {
            supply.getEffectiveTime().add(Converter.convert(minimumIntervalBetweenRepeats));
        }

        supply.getCoverage().addAll(getBenefitsCoverage(item));

        addDispensingQuantity(supply, item.getPbsRpbsManufacturerCode(), item.getDispenseQuantity());

        supplyEntryRelationship.setSupply(supply);

        return supplyEntryRelationship;
    }

    protected static void addDispensingQuantity(POCDMT000040Supply supply,
                                                UniqueIdentifier pbsRpbsManufacturerCode,
                                                QuantityUnitDescription dispenseQuantity) {

        POCDMT000040ManufacturedProduct manufacturedProduct = addDispenseQuantity(supply,
                dispenseQuantity);

        if (pbsRpbsManufacturerCode != null) {
            if (manufacturedProduct == null) {
                manufacturedProduct = new POCDMT000040ManufacturedProduct();
            }
            POCDMT000040Organization org = new POCDMT000040Organization();
            org.getId().add(Converter.getII(pbsRpbsManufacturerCode));
            manufacturedProduct.setManufacturerOrganization(org);
        }
    }

    protected static POCDMT000040ManufacturedProduct addDispenseQuantity(POCDMT000040Supply supply,
                                                                         QuantityUnitDescription dispenseQuantity) {

        POCDMT000040ManufacturedProduct manuprod = null;

        // TODO code needs to be fixed to add a text description

        if ((dispenseQuantity != null) && (dispenseQuantity.getRealQuantity() != null
                || dispenseQuantity.getCodedUnit() != null)) {

            PQ pq = new PQ();
            RealQuantity quantityToDispense = dispenseQuantity.getRealQuantity();

            if (quantityToDispense != null) {
                pq.setValue(quantityToDispense.getValue());
            }

            if (quantityToDispense != null && quantityToDispense.getUnit() != null) {
                pq.setUnit(quantityToDispense.getUnit());

            } else if (dispenseQuantity.getCodedUnit() != null) {
                // using the form code method of units

                // create a new product element if needed
                if (supply.getProduct() == null) {
                    POCDMT000040Product product = new POCDMT000040Product();

                    manuprod = new POCDMT000040ManufacturedProduct();
                    POCDMT000040Material material = new POCDMT000040Material();

                    material.setFormCode(Converter.convertToCDCode(dispenseQuantity.getCodedUnit()));
                    manuprod.setManufacturedMaterial(material);
                    product.setManufacturedProduct(manuprod);
                    supply.setProduct(product);

                } else {
                    // find the existing product
                    POCDMT000040Product product = supply.getProduct();
                    manuprod = product.getManufacturedProduct();

                    if (manuprod == null) {
                        manuprod = new POCDMT000040ManufacturedProduct();
                        product.setManufacturedProduct(manuprod);
                    }

                    POCDMT000040Material material = new POCDMT000040Material();
                    material.setFormCode(Converter.convertToCDCode(dispenseQuantity.getCodedUnit()));
                    manuprod.setManufacturedMaterial(material);
                }

            }
            supply.setQuantity(pq);
        }

        return manuprod;
    }

    public static POCDMT000040EntryRelationship getSupplyEntryRelationship(DispenseItem item) {

        POCDMT000040EntryRelationship supplyEntryRelationship = getCompER();
        POCDMT000040Supply supply = new POCDMT000040Supply();
        supply.setMoodCode(XDocumentSubstanceMood.RQO);
        supply.setClassCode(ActClassSupply.SPLY);
        String supplyId = UUID.randomUUID().toString();
        supply.getId().add(CDATypeUtil.getII(supplyId));
        BL independentIndValue = new BL();
        independentIndValue.setValue(false);
        supply.setIndependentInd(independentIndValue);
        supplyEntryRelationship.setSupply(supply);

        addDispensingQuantity(supply, item.getPbsManufactureCode(), item.getQuantityDispensed());
        supply.getEffectiveTime().add(Converter.convert(item.getEventDate()));

        POCDMT000040EntryRelationship brandEntryRelationship = getCompER();
        POCDMT000040Observation brandEntryRelationshipObservation = getObsEvn();
        brandEntryRelationshipObservation.setCode(SectionEntryCodeSet.BRAND_SUBSTITUTION_OCCURRED);
        brandEntryRelationshipObservation.getValue()
                .add(CDATypeUtil.getBL(item.isbrandSubstitutionOccured()));
        brandEntryRelationship.setObservation(brandEntryRelationshipObservation);
        supply.getEntryRelationship().add(brandEntryRelationship);

        supplyEntryRelationship.setSequenceNumber(CDATypeUtil.getINT(item.getNumberOfThisDispense()));

        supply.getCoverage().add(getBenefitsCoverage(item));

        if (item.getUnderCoPayment() != null
                && !ClaimTypeCategory.NO_BENEFIT.equals(item.getClaimTypeCategory())) {

            supply.getCoverage().add(getUnderCoPaymentCoverage(item));
        }

        if (item.getCloseTheGapId() != null) {
            supply.getCoverage().add(getCloseTheGapCoverage(item.getCloseTheGapId()));
        }
        if (item.getLabelInstruction() != null) {
            POCDMT000040EntryRelationship labelEntryRelationship = getCompER();
            POCDMT000040Act labelEntryRelationshipAct = getInfrmEvn();
            labelEntryRelationshipAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
            labelEntryRelationshipAct.setCode(SectionEntryCodeSet.LABEL_INSTRUCTION);
            labelEntryRelationshipAct.setText(CDATypeUtil.getST(item.getLabelInstruction()));
            labelEntryRelationship.setAct(labelEntryRelationshipAct);
            supply.getEntryRelationship().add(labelEntryRelationship);
        }

        if (item.isEarlySupplyWithBenifit() != null && item.isEarlySupplyWithBenifit()) {
            supply.getCoverage().add(getEarlySupplyWithPharmaceuticalBenefitCoverage(item));
        }

        supplyEntryRelationship.setSupply(supply);

        return supplyEntryRelationship;
    }

    public static POCDMT000040Entry getWeightEntry(BodyWeight bodyWeight) {

        POCDMT000040Entry entry = getDRIVEntry();
        POCDMT000040Observation observation = getObsEvn();
        String observationId = UUID.randomUUID().toString();
        observation.getId().add(CDATypeUtil.getII(observationId));
        observation.setCode(EPrescriptionCreatorUtil.getWeightObservationCode());
        PQ observationValue = new PQ();
        observationValue.setValue(bodyWeight.getValue());
        observationValue.setUnit(bodyWeight.getUnit());
        observation.getValue().add(observationValue);

        observation.setEffectiveTime(Converter.convert(bodyWeight.getDateTimeOfObservation()));
        entry.setObservation(observation);

        return entry;
    }

    public static POCDMT000040Entry getHeightEntry(BodyHeight bodyHeight) {

        POCDMT000040Entry entry = getDRIVEntry();
        POCDMT000040Observation observation = getObsEvn();
        String observationId = UUID.randomUUID().toString();
        observation.getId().add(CDATypeUtil.getII(observationId));
        observation.setCode(EPrescriptionCreatorUtil.getHeightObservationCode());
        PQ observationValue = new PQ();
        observationValue.setValue(bodyHeight.getValue());
        observationValue.setUnit(bodyHeight.getUnit());
        observation.getValue().add(observationValue);
        observation.setEffectiveTime(Converter.convert(bodyHeight.getDateTimeOfObservation()));
        entry.setObservation(observation);

        return entry;
    }

    public static POCDMT000040Entry getNoteEntry(String note, CD noteCode) {

        POCDMT000040Entry entry = getDRIVEntry();
        POCDMT000040Act act = getInfrmEvn();
        String actId = UUID.randomUUID().toString();
        act.getId().add(CDATypeUtil.getII(actId));
        act.setCode(noteCode);
        act.setText(CDATypeUtil.getST(note));
        entry.setAct(act);

        return entry;
    }

    public static List<Coverage> getBenefitsCoverage(PrescriptionItem item) {

        MedicalBenefitCategoryType medicalBenefitCategoryType = item.getMedicalBenefitCategoryType();
        List<Coverage> coverages = new ArrayList<>(5);

        if (medicalBenefitCategoryType != null) {
            Coverage PBScoverage = getBaseCoverage();
            PolicyOrAccount policyOrAccount = getCovPermPolicyOrAccount();
            policyOrAccount
                    .setCode(MedicalBenefitCategoryTypeCodeSet.convert(medicalBenefitCategoryType));
            PBScoverage.setPolicyOrAccount(policyOrAccount);
            coverages.add(PBScoverage);
        }

        if (item.getPbsType() != null) {
            Coverage PBScoverage = getBaseCoverage();
            PolicyOrAccount policyOrAccount = getCovPermPolicyOrAccount();
            policyOrAccount.setCode(Converter.convertToCDCode(item.getPbsType()));
            PBScoverage.setPolicyOrAccount(policyOrAccount);
            coverages.add(PBScoverage);
        }

        //PBS close the gap
        if (item.getCloseTheGapBenifitId() != null) {
            Coverage pbsCtg = getCloseTheGapCoverage(item.getCloseTheGapBenifitId());

            coverages.add(pbsCtg);
        }

        //PBS/RPBS Authority Approval Number
        if (item.getPbsAuthorityApprovalNumber() != null) {
            Coverage pbsCtg = getBaseCoverage();
            PolicyOrAccount policy = getCovPermPolicyOrAccount();
            policy.setId(Converter.getII(item.getPbsAuthorityApprovalNumber()));
            pbsCtg.setPolicyOrAccount(policy);

            NCTISDataComponent pbsAan = new NCTISDataComponent("103.10159",
                    "PBS/RPBS Authority Approval Number");
            Converter.convertToCDCode(pbsAan);
            policy.setCode(Converter.convertToCDCode(pbsAan));

            coverages.add(pbsCtg);
        }

        return coverages;
    }

    protected static Coverage getCloseTheGapCoverage(UniqueIdentifier uniqueIdentifier) {

        Coverage pbsCtg = getBaseCoverage();
        PolicyOrAccount policy = getCovPermPolicyOrAccount();
        policy.setId(Converter.getII(uniqueIdentifier));
        pbsCtg.setPolicyOrAccount(policy);

        NCTISDataComponent ctg = new NCTISDataComponent("103.16095.3", "PBS Close the Gap Benefit");
        Converter.convertToCDCode(ctg);
        policy.setCode(Converter.convertToCDCode(ctg));
        return pbsCtg;
    }

    protected static PolicyOrAccount getCovPermPolicyOrAccount() {

        PolicyOrAccount policyOrAccount = new PolicyOrAccount();
        policyOrAccount.setClassCode(ActClass.COV);
        policyOrAccount.setMoodCode(ActMood.PERM);
        return policyOrAccount;
    }

    public static Coverage getUnderCoPaymentCoverage(DispenseItem dispenseItem) {

        Coded copayment = dispenseItem.getUnderCoPayment();

        Coverage result = getBaseCoverage();
        PolicyOrAccount policyOrAccount = getCovPermPolicyOrAccount();
        policyOrAccount.setCode(Converter.convertToCDCode(copayment));
        result.setPolicyOrAccount(policyOrAccount);
        return result;
    }

    protected static Coverage getBaseCoverage() {

        Coverage result = new Coverage();
        result.setTypeCode(COVERAGE_TYPE_CODE);
        return result;
    }

    public static Coverage getBenefitsCoverage(DispenseItem dispenseItem) {

        Coded claimCategoryType = dispenseItem.getClaimTypeCategory();
        Coverage result = getBaseCoverage();
        PolicyOrAccount policyOrAccount = getCovPermPolicyOrAccount();
        policyOrAccount.setCode(Converter.convertToCDCode(claimCategoryType));
        result.setPolicyOrAccount(policyOrAccount);

        return result;
    }

    public static Coverage getEarlySupplyWithPharmaceuticalBenefitCoverage(
            DispenseItem dispenseItem) {

        Coverage result = getBaseCoverage();
        PolicyOrAccount policyOrAccount = getCovPermPolicyOrAccount();
        policyOrAccount.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
        policyOrAccount.setCode(SectionEntryCodeSet.EARLY_SUPPLY_WITH_PHARMACEUTICAL_BENEFIT);
        result.setPolicyOrAccount(policyOrAccount);

        return result;
    }

    public static POCDMT000040Entry getSubstanceAdministrationEntry(
            PrescriberInstructionDetail prescriberInstructionDetail,
            String prescriberInstructionRecipientParticipantId) {

        POCDMT000040Entry entry = new POCDMT000040Entry();
        PrescriberInstructionRecipientParticipation prescriberInstructionRecipient = prescriberInstructionDetail
                .getPrescriberInstructionRecipient();
        //  PrescriberInstructionRecipientParticipant prescriberInstructionRecipientParticipant = prescriberInstructionRecipient.getParticipant();

        entry.setTypeCode(XActRelationshipEntry.DRIV);
        POCDMT000040SubstanceAdministration substanceAdministration = new POCDMT000040SubstanceAdministration();
        final String substanceAdministrationEntryId = UUID.randomUUID().toString();
        substanceAdministration.getId().add(CDATypeUtil.getII(substanceAdministrationEntryId));
        substanceAdministration.setMoodCode(XDocumentSubstanceMood.RQO);
        substanceAdministration.setClassCode(ActClass.SBADM);
        substanceAdministration.setStatusCode(CDATypeUtil.getCS("new"));
        substanceAdministration.getEffectiveTime().add(CDATypeUtil
                .getSXCMTS(prescriberInstructionDetail.getDateTimePrescriberInstructionReceived()));
        substanceAdministration
                .setText(CDATypeUtil.getST(prescriberInstructionDetail.getPrescriberInstruction()));

        POCDMT000040EntryRelationship sourceEntryRelationship = getSourceEntryRelationship(
                prescriberInstructionDetail.getPrescriberInstructionSource());
        substanceAdministration.getEntryRelationship().add(sourceEntryRelationship);

        POCDMT000040EntryRelationship mediumEntryRelationship = getMediumEntryRelationship(
                prescriberInstructionDetail.getPrescriberInstructionCommunicationMedium());
        substanceAdministration.getEntryRelationship().add(mediumEntryRelationship);

        // Prescription request needs a set of empty elements for Schema correctness
        POCDMT000040Consumable cnsmbl = new POCDMT000040Consumable();
        POCDMT000040ManufacturedProduct prdct = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material mat = new POCDMT000040Material();
        prdct.setManufacturedMaterial(mat);
        cnsmbl.setManufacturedProduct(prdct);
        substanceAdministration.setConsumable(cnsmbl);

        POCDMT000040Participant2 participant = getParticipant(prescriberInstructionRecipient,
                prescriberInstructionRecipientParticipantId);

        substanceAdministration.getParticipant().add(participant);

        entry.setSubstanceAdministration(substanceAdministration);

        return entry;
    }

    protected static POCDMT000040Participant2 getParticipant(
            PrescriberInstructionRecipientParticipation instructionRecipientParticipation,
            String prescriberInstructionRecipientParticipantId) {

        POCDMT000040Participant2 participantElement = new POCDMT000040Participant2();
        participantElement.setTypeCode(ParticipationType.TRANS);
        PrescriberInstructionRecipientParticipant participant = instructionRecipientParticipation
                .getParticipant();

        POCDMT000040ParticipantRole participantRole = new POCDMT000040ParticipantRole();
        participantRole
                .setCode(Converter.convertToCECode(instructionRecipientParticipation.getRole().getCode()));
        participantRole.getId().add(CDATypeUtil.getII(prescriberInstructionRecipientParticipantId));

        POCDMT000040PlayingEntity playingEntity = new POCDMT000040PlayingEntity();
        playingEntity.setClassCode(EntityClassRoot.PSN);
        playingEntity.getAsEntityIdentifier()
                .add(Converter.convert(participant.getEntityIdentifiers()));
        playingEntity.getName().add(Converter.getPersonName(participant.getPerson().getPersonName()));
        playingEntity.setAdministrativeGenderCode(
                Converter.convert(participant.getPerson().getDemographicData().getSex()));
        playingEntity.setBirthTime(CDATypeUtil.getTS(
                participant.getPerson().getDemographicData().getDateOfBirthDetail().getDateOfBirth()));

        Sex gender = participant.getPerson().getDemographicData().getSex();

        playingEntity.setAdministrativeGenderCode(Converter.convert(gender));

        String prescriberInstructionRecipientQualifications = participant.getQualifications();
        if (prescriberInstructionRecipientQualifications != null) {
            Qualifications qualifications = new Qualifications();
            qualifications.setClassCode(EntityClass.QUAL);
            CE qualificationsCode = new CE();
            ED qualificationCodeOriginalTextValue = new ED();
            qualificationCodeOriginalTextValue.getContent()
                    .add(prescriberInstructionRecipientQualifications);
            qualificationsCode.setOriginalText(qualificationCodeOriginalTextValue);
            qualifications.setCode(qualificationsCode);
            // playingEntity.setAsQualifications(qualifications);
        }

        participantRole.setPlayingEntity(playingEntity);

        if (participant.getAddresses() != null) {
            participantRole.getAddr().add(AddressConverter.convert(participant.getAddresses()));
        }

        if (participant.getElectronicCommunicationDetail() != null) {
            participantRole.getTelecom()
                    .addAll(Converter.convert(participant.getElectronicCommunicationDetail()));
        }

        participantElement.setParticipantRole(participantRole);

        return participantElement;
    }

    protected static POCDMT000040EntryRelationship getMediumEntryRelationship(
            PrescriberInstructionCommunicationMedium prescriberInstructionCommunicationMedium) {

        POCDMT000040EntryRelationship mediumEntryRelationship = getCompER();
        POCDMT000040Observation mediumEntryRelationshipObservation = getObsEvn();
        final String mediumEntryRelationshipObservationId = UUID.randomUUID().toString();
        mediumEntryRelationshipObservation.getId()
                .add(CDATypeUtil.getII(mediumEntryRelationshipObservationId));
        mediumEntryRelationshipObservation
                .setCode(SectionEntryCodeSet.PRESCRIBER_INSTRUCTION_COMMUNICATION_MEDIUM);
        mediumEntryRelationshipObservation.getValue()
                .add(Converter.convertToCDCode(prescriberInstructionCommunicationMedium));
        mediumEntryRelationship.setObservation(mediumEntryRelationshipObservation);

        return mediumEntryRelationship;
    }

    protected static POCDMT000040EntryRelationship getSourceEntryRelationship(
            PrescriberInstructionSource prescriberInstructionSource) {

        POCDMT000040EntryRelationship sourceEntryRelationship = getCompER();
        POCDMT000040Observation sourceEntryRelationshipObservation = getObsEvn();
        final String sourceEntryRelationshipObservationId = UUID.randomUUID().toString();
        sourceEntryRelationshipObservation.getId()
                .add(CDATypeUtil.getII(sourceEntryRelationshipObservationId));
        sourceEntryRelationshipObservation.setCode(SectionEntryCodeSet.PRESCRIBER_INSTRUCTION_SOURCE);
        sourceEntryRelationshipObservation.getValue()
                .add(Converter.convertToCDCode(prescriberInstructionSource));
        sourceEntryRelationship.setObservation(sourceEntryRelationshipObservation);
        return sourceEntryRelationship;
    }


    public static POCDMT000040Entry getLogoEntry(AttachedMedia logo) {

        POCDMT000040Entry entry = new POCDMT000040Entry();
        POCDMT000040ObservationMedia om = new POCDMT000040ObservationMedia();
        om.setIDAttribute("LOGO");
        om.setClassCode(ActClassObservation.OBS);
        om.setMoodCode(ActMood.EVN);
        om.setIDAttribute("LOGO");
        ED value = new ED();
        value.setIntegrityCheck(logo.getIntegrityCheck());
        IntegrityCheckAlgorithm algorithm = IntegrityCheckAlgorithm
                .fromValue(logo.getIntegrityCheckType().getDigestName());
        value.setIntegrityCheckAlgorithm(algorithm);
        value.setMediaType(logo.getMediaType());

        TEL tel = new TEL();
        tel.setValue(logo.getFileName());
        JAXBElement<TEL> reference = new ObjectFactory().createEDReference(tel);

        value.getContent().add(reference);
        om.setValue(value);

        entry.setObservationMedia(om);
        return entry;
    }

    public static POCDMT000040Entry getPathologyTestResult(PathologyResult pathologyResult) {

        POCDMT000040Entry entry = new POCDMT000040Entry();
        POCDMT000040Observation ob = getObsEvn();
        ob.setCode(Converter.convertToCDCode(pathologyResult.getPathologyTestResultName()));

        ob.getEntryRelationship().add(getDiagnosticService(pathologyResult));
        ob.getEntryRelationship().add(getPathologyTestDate(pathologyResult));

        ob.getEntryRelationship().add(getTestSpecimen(pathologyResult));
        ob.getEntryRelationship().add(getTestResultStatus(pathologyResult));

        entry.setObservation(ob);
        return entry;
    }

    private static POCDMT000040EntryRelationship getExaminationRequestDetails(
            ImagingExaminationResult diResult) {

        POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
        er.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
        er.setInversionInd(true);

        POCDMT000040Act act = getActEvn();
        act.setCode(Converter
                .convertToCDCode(new NCTISDataComponent("102.16511", "Examination Request Details")));

        POCDMT000040EntryRelationship imgER = getCompER();
        POCDMT000040Observation obs = getObsEvn();
        obs.setCode(Converter.convertToCDCode(new NCTISDataComponent("102.16515", "Image Details")));
        imgER.setObservation(obs);

        obs.setEffectiveTime(Converter.convert(diResult.getImageDateTime()));
        act.getEntryRelationship().add(imgER);

        er.setAct(act);
        return er;
    }

    public static POCDMT000040Entry getImagingExamResult(ImagingExaminationResult imageResult) {

        POCDMT000040Entry entry = new POCDMT000040Entry();
        POCDMT000040Observation ob = getObsEvn();
        ob.setCode(Converter.convertToCDCode(imageResult.getImagingResultName()));
        ob.getMethodCode().add(Converter.convertToCECode(imageResult.getModality()));

        if (imageResult.getSites() != null && imageResult.getSites().size() > 0) {
            addImagingAnatomicalSites(imageResult, ob);
        }

        if (imageResult.getExaminationProcedure() != null) {
            ob.getEntryRelationship().add(getExaminationProcedure(imageResult));
        }
        ob.getEntryRelationship().add(getImageTime(imageResult));

        if (null != imageResult.getAnatomicalRegion()) {//Optional
            ob.getEntryRelationship().add(getAnatomicalRegion(imageResult));
        }

        if (null != imageResult.getAnatomicalRegion()
                && imageResult.getAnatomicalRegion().getDescription() != null) {

            String description = imageResult.getAnatomicalRegion().getDescription();
            CodeImpl anatomicalRegionDescription = new CodeImpl();
            anatomicalRegionDescription.setOriginalText(description);
            ob.getTargetSiteCode().add(Converter.convertToCDCode(anatomicalRegionDescription));
        }

        ob.getEntryRelationship().add(getExaminationRequestDetails(imageResult));
        if (imageResult.getRelatedImage() != null) {
            ob.getEntryRelationship().add(getRelatedImage(imageResult));
        }
        ob.getEntryRelationship().add(getResultStatus(imageResult));
        entry.setObservation(ob);
        return entry;
    }

    private static POCDMT000040EntryRelationship getAnatomicalRegion(
            ImagingExaminationResult imageResult) {

        POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
        er.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
        POCDMT000040Observation obs = getObsEvn();
        obs.setCode(
                Converter.convertToCDCode(new NCTISDataComponent("103.17009", "Anatomical Region")));
        obs.getId().add(Converter.getII(imageResult.getAnatomicalRegion().getID()));
        obs.getValue()
                .add(Converter.convertToCDCode(imageResult.getAnatomicalRegion().getRegionCode()));
        er.setObservation(obs);

        return er;
    }

    private static POCDMT000040EntryRelationship getRelatedImage(ImagingExaminationResult diResult) {

        POCDMT000040EntryRelationship relatedImagesER = getCompER();
        POCDMT000040Act relatedImagesAct = getActEvn();
        relatedImagesAct.setCode(
                Converter.convertToCDCode(new NCTISDataComponent("102.16692", "Related Information")));

        POCDMT000040Reference reference = new POCDMT000040Reference();
        reference.setTypeCode(XActRelationshipExternalReference.REFR);
        reference.setSeperatableInd(CDATypeUtil.getBL(true));

        POCDMT000040ExternalAct exAct = new POCDMT000040ExternalAct();
        exAct.setClassCode(ActClassRoot.ACT);
        exAct.setMoodCode(ActMood.EVN);

        exAct.setText(CDATypeUtil.getED(diResult.getRelatedImage()));
        reference.setExternalAct(exAct);

        relatedImagesAct.getReference().add(reference);
        relatedImagesER.setAct(relatedImagesAct);
        relatedImagesAct.getId().add(Converter.getII(diResult.getRelatedImageId()));

        return relatedImagesER;
    }

    private static POCDMT000040EntryRelationship getResultStatus(
            ImagingExaminationResult imageResult) {

        POCDMT000040EntryRelationship er = getCompER();
        POCDMT000040Observation ob = getObsEvn();
        er.setObservation(ob);
        ob.getId().add(Converter.getII(imageResult.getOverallResultStatusId()));
        ob.setCode(Converter.convertToCDCode(new SNOMED_AU_Code("308552006", "report status")));
        ob.getValue().add(Converter.convertToCDCode(imageResult.getOverallResultStatusCode()));

        return er;
    }

    public static POCDMT000040EntryRelationship getImageTime(ImagingExaminationResult imageResult) {

        POCDMT000040EntryRelationship er = getCompER();
        POCDMT000040Observation ob = getObsEvn();

        ob.setCode(Converter.convertToCDCode(
                new NCTISDataComponent("103.16589", "Imaging Examination Result DateTime")));
        ob.setEffectiveTime(Converter.convert(imageResult.getImageDateTime()));
        er.setObservation(ob);

        return er;
    }

    public static POCDMT000040EntryRelationship getExaminationProcedure(
            ImagingExaminationResult imageResult) {

        POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
        er.setTypeCode(XActRelationshipEntryRelationship.REFR);

        POCDMT000040Act act = getActEvn();
        act.setCode(
                Converter.convertToCDCode(new NCTISDataComponent("105.16633", "Examination Procedure")));
        act.setText(CDATypeUtil.getED(imageResult.getExaminationProcedure()));
        act.getId().add(Converter.getII(imageResult.getExaminationProcedureId()));
        er.setAct(act);

        return er;
    }

    protected static void addImagingAnatomicalSites(ImagingExaminationResult imageResult,
                                                    POCDMT000040Observation ob) {

        for (AnatomicalSite site : imageResult.getSites()) {
            CD targetSiteCode = null;
            if (null != site.getNullFlavor()) {
                targetSiteCode = new CD();
                targetSiteCode.setNullFlavor(site.getNullFlavor());
            } else if (site.getSpecificLocationName() != null) {
                targetSiteCode = Converter.convertToCDCode(site.getSpecificLocationName());
                if (site.getSpecificLocationSide() != null) {
                    CR cr = new CR();
                    cr.setValue(Converter.convertToCDCode(site.getSpecificLocationSide()));
                    cr.setName(Converter.convertToCVCode(new SNOMED_AU_Code("78615007", "with laterality")));
                    targetSiteCode.getQualifier().add(cr);
                }
            } else if (site.getDescription() != null) {
                targetSiteCode = Converter
                        .convertToCDCode(CodeImpl.fromOriginalText(site.getDescription()));
            }
            ob.getTargetSiteCode().add(targetSiteCode);
        }
    }

    public static POCDMT000040EntryRelationship getTestResultStatus(PathologyResult pathologyResult) {

        if (pathologyResult.getSpecimenDetail() == null) {
            return null;
        }

        POCDMT000040EntryRelationship er = getERComp();
        POCDMT000040Observation ob = getObsEvn();
        ob.setCode(Converter.convertToCDCode(new SNOMED_AU_Code("308552006", "report status")));
        ob.setEffectiveTime(Converter.convert(pathologyResult.getSpecimenDetail().getCollectionTime()));

        ob.getId().add(Converter.getII(pathologyResult.getId()));

        ob.getValue().add(Converter.convertToCDCode(pathologyResult.getResultStatus()));
        er.setObservation(ob);
        return er;
    }


    public static POCDMT000040EntryRelationship getTestSpecimen(PathologyResult pathologyResult) {

        if (pathologyResult.getSpecimenDetail() == null) {
            return null;
        }

        POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
        er.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
        POCDMT000040Observation ob = getObsEvn();
        ob.setCode(Converter.convertToCDCode(new NCTISDataComponent("102.16156", "Specimen")));
        ob.setEffectiveTime(Converter.convert(pathologyResult.getSpecimenDetail().getCollectionTime()));
        POCDMT000040Specimen specimen = new POCDMT000040Specimen();
        POCDMT000040SpecimenRole srole = new POCDMT000040SpecimenRole();
        srole.getId().add(Converter.getII(pathologyResult.getSpecimenDetail().getId()));
        specimen.setSpecimenRole(srole);
        ob.getSpecimen().add(specimen);
        er.setObservation(ob);
        return er;
    }

    public static POCDMT000040EntryRelationship getPathologyTestDate(
            PathologyResult pathologyResult) {

        POCDMT000040EntryRelationship er = getERComp();
        POCDMT000040Observation ob = getObsEvn();
        ob.setCode(Converter
                .convertToCDCode(new NCTISDataComponent("103.16605", "Pathology Test Result DateTime")));
        ob.setEffectiveTime(Converter.convert(pathologyResult.getTestTime()));
        ob.getId().add(Converter.getII(pathologyResult.getTestTimeId()));
        er.setObservation(ob);
        return er;
    }

    public static POCDMT000040EntryRelationship getDiagnosticService(
            PathologyResult pathologyResult) {

        POCDMT000040EntryRelationship er = getERComp();
        POCDMT000040Observation ob = getObsEvn();
        ob.setCode(Converter.convertToCDCode(new SNOMED_AU_Code("310074003", "pathology service")));
        ob.getValue().add(Converter.convertToCDCode(pathologyResult.getDiagnosticService()));
        er.setObservation(ob);
        return er;
    }

    public static POCDMT000040Entry getPathologyDocumentEntry(ReportDocument relatedDocument) {

        POCDMT000040Entry er = new POCDMT000040Entry();
        er.setTypeCode(XActRelationshipEntry.COMP);
        POCDMT000040Act act = getActEvn();
        act.getId().add(Converter.getII(relatedDocument.getActID()));
        act.setCode(Converter.convertToCDCode(new NCTISDataComponent("102.16971", "Related Document")));

        POCDMT000040Reference reference = new POCDMT000040Reference();
        reference.setTypeCode(XActRelationshipExternalReference.XCRPT);
        reference.setSeperatableInd(CDATypeUtil.getBL(true));

        /* *****
         * Document itself
         ***** */

        POCDMT000040ExternalDocument doc = new POCDMT000040ExternalDocument();
        doc.setClassCode(ActClassDocument.DOC);
        doc.setMoodCode(ActMood.EVN);
        doc.setCode(Converter.convertToCDCode(new LOINC("11526-1", "Pathology study")));
        ED text = new ED();
        text.setIntegrityCheck(relatedDocument.getTestResultsRepresentation().getIntegrityCheck());
        text.setIntegrityCheckAlgorithm(IntegrityCheckAlgorithm.SHA_1);

        text.setMediaType(relatedDocument.getTestResultsRepresentation().getMediaType());

        // A hacky way of getting a reference
        TEL tel = new TEL();
        tel.setValue(relatedDocument.getTestResultsRepresentation().getFileName());
        JAXBElement<TEL> data = new JAXBElement<>(new QName("urn:hl7-org:v3", "reference"),
                TEL.class, tel);
        text.getContent().add(data);

        doc.getId().add(Converter.getII(relatedDocument.getDocumentID()));
        doc.setText(text);
        reference.setExternalDocument(doc);
        act.getReference().add(reference);

        POCDMT000040EntryRelationship titleER = getERComp();
        POCDMT000040Act titleAct = getActEvn();
        titleAct.setCode(Converter.convertToCDCode(new NCTISDataComponent("103.16966", "Document Title")));
        titleAct.setText(CDATypeUtil.getST(relatedDocument.getReportTitle()));
        titleER.setAct(titleAct);

        IVLTS reportDate = new IVLTS();

        IVXBTS low = new IVXBTS();
        low.setValue(relatedDocument.getReportDate().format(Converter.HL7_DATE_TIME_FORMATTER));
        ObjectFactory factory = new ObjectFactory();
        JAXBElement<IVXBTS> IVLINTHigh = factory.createIVLTSLow(low);
        reportDate.getRest().add(IVLINTHigh);

        act.setEffectiveTime(reportDate);
        act.getEntryRelationship().add(titleER);

        POCDMT000040EntryRelationship reportStatus = getERComp();
        POCDMT000040Observation status = getObsEvn();
        status.setCode(Converter.convertToCDCode(new NCTISDataComponent("103.20104", "Document Status")));
        status.getValue().add(Converter.convertToCDCode(relatedDocument.getReportStatus()));
        reportStatus.setObservation(status);
        act.getEntryRelationship().add(reportStatus);

        er.setAct(act);
        return er;
    }

    public static POCDMT000040Entry getDiagnosticImageDocumentEntry(ReportDocument relatedDocument) {

        POCDMT000040Entry er = new POCDMT000040Entry();
        er.setTypeCode(XActRelationshipEntry.COMP);
        POCDMT000040Act act = getActEvn();
        act.getId().add(Converter.getII(relatedDocument.getActID()));
        act.setCode(Converter.convertToCDCode(new NCTISDataComponent("102.16971", "Related Document")));

        POCDMT000040Reference reference = new POCDMT000040Reference();
        reference.setTypeCode(XActRelationshipExternalReference.XCRPT);
        reference.setSeperatableInd(CDATypeUtil.getBL(true));

        /* *****
         * Document itself
         ***** */

        POCDMT000040ExternalDocument doc = new POCDMT000040ExternalDocument();
        doc.setClassCode(ActClassDocument.DOC);
        doc.setMoodCode(ActMood.EVN);
        doc.setCode(Converter.convertToCDCode(new LOINC("18748-4", "Diagnostic imaging study")));
        ED text = new ED();
        text.setIntegrityCheck(relatedDocument.getTestResultsRepresentation().getIntegrityCheck());
        text.setIntegrityCheckAlgorithm(IntegrityCheckAlgorithm.SHA_1);

        text.setMediaType(relatedDocument.getTestResultsRepresentation().getMediaType());

        // A hacky way of getting a reference
        TEL tel = new TEL();
        tel.setValue(relatedDocument.getTestResultsRepresentation().getFileName());
        JAXBElement<TEL> data = new JAXBElement<>(new QName("urn:hl7-org:v3", "reference"),
                TEL.class, tel);
        text.getContent().add(data);

        doc.getId().add(Converter.getII(relatedDocument.getDocumentID()));
        doc.setText(text);
        reference.setExternalDocument(doc);
        act.getReference().add(reference);

        POCDMT000040EntryRelationship titleER = getERComp();
        POCDMT000040Act titleAct = getActEvn();
        titleAct
                .setCode(Converter.convertToCDCode(new NCTISDataComponent("103.16966", "Document Title")));
        titleAct.setText(CDATypeUtil.getST(relatedDocument.getReportTitle()));
        titleER.setAct(titleAct);

        IVLTS reportDate = new IVLTS();

        IVXBTS low = new IVXBTS();
        low.setValue(relatedDocument.getReportDate().format(Converter.HL7_DATE_TIME_FORMATTER));
        ObjectFactory factory = new ObjectFactory();
        JAXBElement<IVXBTS> IVLINTHigh = factory.createIVLTSLow(low);
        reportDate.getRest().add(IVLINTHigh);

        act.setEffectiveTime(reportDate);
        act.getEntryRelationship().add(titleER);

        POCDMT000040EntryRelationship reportStatus = getERComp();
        POCDMT000040Observation status = getObsEvn();
        status
                .setCode(Converter.convertToCDCode(new NCTISDataComponent("103.20104", "Document Status")));
        status.getValue().add(Converter.convertToCDCode(relatedDocument.getReportStatus()));
        reportStatus.setObservation(status);
        act.getEntryRelationship().add(reportStatus);

        er.setAct(act);
        return er;
    }

    public static POCDMT000040Entry getAdverseReactionEntry(AdverseReaction ar) {

        POCDMT000040Entry reaction = new POCDMT000040Entry();
        POCDMT000040Act act = getActEvn();
        act.setCode(Converter.convertToCDCode(new NCTISDataComponent("102.15517", "Adverse Reaction")));

        act.getId().add(Converter.getII(ar.getID()));

        // Substance agent
        POCDMT000040Participant2 participant = new POCDMT000040Participant2();
        participant.setTypeCode(ParticipationType.CAGNT);
        POCDMT000040ParticipantRole role = new POCDMT000040ParticipantRole();
        POCDMT000040PlayingEntity pe = new POCDMT000040PlayingEntity();
        pe.setCode(Converter.convertToCECode(ar.getSubstanceAgent()));
        role.setPlayingEntity(pe);
        participant.setParticipantRole(role);
        act.getParticipant().add(participant);

        // Manifestations
        POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
        er.setTypeCode(XActRelationshipEntryRelationship.CAUS);

        POCDMT000040Observation obs = getObsEvn();
        obs.setCode(Converter.convertToCDCode(new NCTISDataComponent("102.16474", "Reaction Event")));

        for (Manifestation mf : ar.getManifestations()) {
            POCDMT000040EntryRelationship mfer = new POCDMT000040EntryRelationship();
            mfer.setTypeCode(XActRelationshipEntryRelationship.MFST);
            mfer.setInversionInd(true);
            POCDMT000040Observation mfstObs = getObsEvn();
            mfstObs.setCode(Converter.convertToCDCode(mf.getCode()));
            mfstObs.getId().add(Converter.getII(mf.getID()));
            mfer.setObservation(mfstObs);

            obs.getEntryRelationship().add(mfer);
        }

        er.setObservation(obs);
        act.getEntryRelationship().add(er);

        reaction.setAct(act);
        return reaction;
    }

    public static POCDMT000040Entry getExclusionStatementEntry(String exclusionID,
                                                               ExclusionStatement exclusionStatement) {

        POCDMT000040Entry er = new POCDMT000040Entry();
        POCDMT000040Observation obs = getObsEvn();
        obs.setCode(Converter.convertToCDCode(new NCTISDataComponent(exclusionID, "Global Statement")));
        obs.getId().add(Converter.getII(exclusionStatement.getID()));
        obs.getValue().add(Converter.convertToCDCode(exclusionStatement.getExclusionStatement()));
        er.setObservation(obs);
        return er;
    }


    public static POCDMT000040Entry getMedicationsEntry(KnownMedication m) {

        POCDMT000040Entry er = new POCDMT000040Entry();
        POCDMT000040SubstanceAdministration sa = getSbadmEvn();
        sa.getId().add(Converter.getII(m.getID()));

        POCDMT000040Consumable cons = new POCDMT000040Consumable();
        POCDMT000040ManufacturedProduct prod = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material mat = new POCDMT000040Material();
        mat.setCode(Converter.convertToCECode(m.getMedicine()));
        prod.setManufacturedMaterial(mat);
        cons.setManufacturedProduct(prod);
        sa.setConsumable(cons);

        // Directions
        sa.setText(CDATypeUtil.getST(m.getDirections()));

        // Clinical indication
        String ci = m.getClinicalIndication();
        if (ci != null) {
            POCDMT000040EntryRelationship cier = new POCDMT000040EntryRelationship();
            cier.setTypeCode(XActRelationshipEntryRelationship.RSON);
            POCDMT000040Act act = getInfrmEvn();
            act.setCode(
                    Converter.convertToCDCode(new NCTISDataComponent("103.10141", "Clinical Indication")));

            act.setText(CDATypeUtil.getST(ci));

            cier.setAct(act);
            sa.getEntryRelationship().add(cier);
        }

        String comment = m.getComment();
        if (comment != null) {
            POCDMT000040EntryRelationship cer = new POCDMT000040EntryRelationship();
            cer.setTypeCode(XActRelationshipEntryRelationship.COMP);

            POCDMT000040Act act = getInfrmEvn();
            act.setCode(
                    Converter.convertToCDCode(new NCTISDataComponent("103.16044", "Additional Comments")));
            act.setText(CDATypeUtil.getST(comment));

            cer.setAct(act);
            sa.getEntryRelationship().add(cer);
        }

        er.setSubstanceAdministration(sa);
        return er;
    }

    private static POCDMT000040SubstanceAdministration getSbadmEvn() {

        POCDMT000040SubstanceAdministration sa = new POCDMT000040SubstanceAdministration();
        sa.setMoodCode(XDocumentSubstanceMood.EVN);
        sa.setClassCode(ActClass.SBADM);
        return sa;
    }

    private static POCDMT000040Act getInfrmEvn() {

        POCDMT000040Act act = new POCDMT000040Act();

        act.setClassCode(XActClassDocumentEntryAct.INFRM);
        act.setMoodCode(XDocumentActMood.EVN);
        return act;
    }

    public static POCDMT000040Entry getProblemDiagnosisEntry(ProblemDiagnosis pd) {

        POCDMT000040Entry e = new POCDMT000040Entry();
        POCDMT000040Observation obs = getObsEvn();

        obs.setCode(
                Converter.convertToCDCode(new SNOMED_AU_Code("282291009", "Diagnosis interpretation")));
        obs.getId().add(Converter.getII(pd.getID()));
        obs.getValue().add(Converter.convertToCDCode(pd.getIdentification()));

        if (pd.getDateOfOnset() != null) {
            RestrictedTimeInterval low = RestrictedTimeInterval.getLowInstance(pd.getDateOfOnset());
            obs.setEffectiveTime(Converter.convert(low));
        }

        if (pd.getDateOfRemission() != null) {
            POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
            er.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
            POCDMT000040Observation remissionTime = getObsEvn();
            remissionTime.setCode(Converter
                    .convertToCDCode(new NCTISDataComponent("103.15510", "Date of Resolution/Remission")));
            remissionTime.getValue().add(Converter.convert(pd.getDateOfRemission()));
            er.setObservation(remissionTime);
            obs.getEntryRelationship().add(er);
        }

        if (pd.getComment() != null) {
            POCDMT000040EntryRelationship er = getERComp();
            er.setTypeCode(XActRelationshipEntryRelationship.COMP);
            POCDMT000040Act act = getInfrmEvn();
            act.setCode(Converter
                    .convertToCDCode(new NCTISDataComponent("103.16545", "Problem/Diagnosis Comment")));
            act.setText(CDATypeUtil.getST(pd.getComment()));
            er.setAct(act);
            obs.getEntryRelationship().add(er);
        }

        e.setObservation(obs);

        return e;
    }

    public static POCDMT000040Entry getProceduresEntry(Procedure p) {

        POCDMT000040Entry e = new POCDMT000040Entry();
        POCDMT000040Procedure proc = new POCDMT000040Procedure();
        proc.setClassCode(ActClass.PROC);
        proc.setMoodCode(XDocumentProcedureMood.EVN);

        if (p.getID() != null) {
            proc.getId().add(Converter.getII(p.getID()));
        }

        if (p.getName() != null) {
            proc.setCode(Converter.convertToCDCode(p.getName()));
        }

        if (p.getComment() != null) {
            POCDMT000040EntryRelationship er = getCompER();
            POCDMT000040Act act = getInfrmEvn();

            act.setCode(
                    Converter.convertToCDCode(new NCTISDataComponent("103.15595", "Procedure Comment")));
            act.setText(CDATypeUtil.getST(p.getComment()));
            er.setAct(act);
            proc.getEntryRelationship().add(er);
        }

        if (p.getDateTimeStarted() != null) {
            proc.setEffectiveTime(Converter.convert(p.getDateTimeStarted()));
        }

        e.setProcedure(proc);

        return e;
    }

    public static POCDMT000040Entry getOtherMedicalHistoryItemEntry(
            UncatagorisedMedicalHistoryItem item) {

        POCDMT000040Entry e = new POCDMT000040Entry();
        POCDMT000040Act act = getActEvn();

        act.getId().add(Converter.getII(item.getID()));
        act.setCode(Converter.convertToCDCode(
                new NCTISDataComponent("102.16627", "Uncategorised Medical History Item")));

        if (item.getDescription() != null) {
            act.setText(CDATypeUtil.getST(item.getDescription()));
        }

        if (item.getTimeInterval() != null) {
            act.setEffectiveTime(Converter.convert(item.getTimeInterval()));
        }

        if (item.getComment() != null) {
            POCDMT000040EntryRelationship er = getCompER();
            POCDMT000040Act actevn = getInfrmEvn();

            actevn.setCode(Converter
                    .convertToCDCode(new NCTISDataComponent("103.16630", "Medical History Item Comment")));
            actevn.setText(CDATypeUtil.getST(item.getComment()));
            er.setAct(actevn);
            act.getEntryRelationship().add(er);
        }

        e.setAct(act);
        return e;
    }

    public static POCDMT000040Entry getImmunisationEntry(Immunisation i) {

        POCDMT000040Entry e = new POCDMT000040Entry();

        POCDMT000040SubstanceAdministration adm = getSbadmEvn();
        adm.getId().add(Converter.getII(i.getID()));

        // AMT code for TherapeuticGood
        Coded tg = i.getTheraputicGood();
        if (tg != null) {
            POCDMT000040Consumable con = new POCDMT000040Consumable();
            POCDMT000040ManufacturedProduct prod = new POCDMT000040ManufacturedProduct();
            POCDMT000040Material mat = new POCDMT000040Material();

            mat.setCode(Converter.convertToCECode(tg));

            prod.setManufacturedMaterial(mat);
            con.setManufacturedProduct(prod);
            adm.setConsumable(con);
        }

        // Vaccine sequence number
        if (i.getSequenceNumber() != null) {
            POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
            er.setTypeCode(XActRelationshipEntryRelationship.COMP);
            er.setSequenceNumber(CDATypeUtil.getINT(i.getSequenceNumber()));

            POCDMT000040Supply sply = new POCDMT000040Supply();
            sply.setMoodCode(XDocumentSubstanceMood.EVN);
            sply.setClassCode(ActClassSupply.SPLY);
            sply.setIndependentInd(CDATypeUtil.getBL(false));
            er.setSupply(sply);

            adm.getEntryRelationship().add(er);
        }

        // Time administered
        if (i.getMedicationActionDateTime() != null) {
            adm.getEffectiveTime().add(Converter.convert(i.getMedicationActionDateTime()));
        }

        e.setSubstanceAdministration(adm);
        return e;
    }
}

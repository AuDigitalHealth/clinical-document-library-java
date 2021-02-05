package au.gov.nehta.builder.npdr;

import java.math.BigInteger;
import java.util.UUID;

import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;

import au.gov.nehta.builder.common.EntryCreator;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.common.time.SimplifiedPeriodicIntervalTime;
import au.gov.nehta.model.cda.npdr.PCEHRDispenseItem;
import au.gov.nehta.model.cda.npdr.PCEHRPrescriptionItem;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipation;
import au.gov.nehta.model.clinical.etp.dispenserecord.ClaimTypeCategory;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItem;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionDetail;
import au.net.electronichealth.ns.cda._2_0.*;
import au.net.electronichealth.ns.ci.cda.extensions._3.Subject2;
import au.net.electronichealth.ns.ci.cda.extensions._3.SubstitutionPermission;

/**
 * An extension of Entry creator to create HL7 XML elements suited to NPDR documents
 */
public class NPDREntryCreator extends EntryCreator {
    private static final BL FALSE = new BL();

    static {
        FALSE.setValue(false);
    }

    // Dispense Item
    public static POCDMT000040Entry getSubstanceAdministrationEntry(PCEHRDispenseItem item) {
        POCDMT000040Entry entry = new POCDMT000040Entry();

        entry.setTypeCode(XActRelationshipEntry.DRIV);
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
            substanceAdministration.getEntryRelationship().add(getFormulaEntryRelationship(item.getFormula()));
        }

        substanceAdministration.getEntryRelationship().add(getSupplyEntryRelationship(item));

        IVLINT repeatNumber = new IVLINT();
        IVXBINT repeatNumberHigh = new IVXBINT();
        //PW: 6/5/2016 Add one to the repeat count (to include the original prescription)
        repeatNumberHigh.setValue(BigInteger.valueOf(item.getMaxRepeats() + 1));
        JAXBElement<IVXBINT> high = new JAXBElement<>(new QName("urn:hl7-org:v3", "high"), IVXBINT.class, repeatNumberHigh);

        repeatNumber.getRest().add(high);

        substanceAdministration.setRepeatNumber(repeatNumber);

        if (item.getAdditionalComments() != null) {
            substanceAdministration.getEntryRelationship().add(getCommentsEntryRelationship(item.getAdditionalComments()));
        }

        entry.setSubstanceAdministration(substanceAdministration);

        return entry;
    }

    // Prescription item
    public static POCDMT000040Entry getSubstanceAdministrationEntry(PCEHRPrescriptionItem item) {
        POCDMT000040Entry entry = new POCDMT000040Entry();

        entry.setTypeCode(XActRelationshipEntry.DRIV);
        POCDMT000040SubstanceAdministration substanceAdministration = new POCDMT000040SubstanceAdministration();
        substanceAdministration.setMoodCode(XDocumentSubstanceMood.RQO);
        substanceAdministration.setClassCode(ActClass.SBADM);
        CS statusCode = new CS();
        statusCode.setCode("active");
        substanceAdministration.setStatusCode(statusCode);
        substanceAdministration.getId().add(Converter.getII(item.getPrescriptionItemIdentifier()));
        POCDMT000040Consumable consumable = new POCDMT000040Consumable();


        POCDMT000040ManufacturedProduct consumeableManufacturedProduct = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material manufacturedMaterial = new POCDMT000040Material();
        manufacturedMaterial.setCode(Converter.convertToCECode(item.getPbsRpbsItemCode()));

        if (item.getProductFormCode() != null) {
            manufacturedMaterial.setFormCode(Converter.convertToCDCode(item.getProductFormCode()));
        }

        consumeableManufacturedProduct.setManufacturedMaterial(manufacturedMaterial);
        if (item.getReasonForTherapeuticGood() != null) {
            substanceAdministration.getEntryRelationship().add(getReasonEntryRelationship(item));
        }

        if (item.getAdditionalComments() != null) {
            substanceAdministration.getEntryRelationship().add(getCommentsEntryRelationship(item.getAdditionalComments()));
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

        addExpmoraneousIngredients(manufacturedMaterial, item.getExtemporaneousIngredients());
        consumeableManufacturedProduct.setManufacturedMaterial(manufacturedMaterial);
        if (item.getGenericName() != null) {
            manufacturedMaterial.setName(Converter.convert(item.getGenericName()));
        }

        consumable.setManufacturedProduct(consumeableManufacturedProduct);
        substanceAdministration.setConsumable(consumable);

        if (item.getPbsRpbsItemCode() != null) {
            manufacturedMaterial.setCode(Converter.convertToCECode(item.getPbsRpbsItemCode()));
        }

        consumable.setManufacturedProduct(consumeableManufacturedProduct);
        addExpmoraneousIngredients(manufacturedMaterial, item.getExtemporaneousIngredients());

        substanceAdministration.setConsumable(consumable);

        if (item.isLongTerm() != null) {
            substanceAdministration.getEntryRelationship().add(getLongTermRelationship(item.isLongTerm()));
        }

        if (item.getFormula() != null) {
            substanceAdministration.getEntryRelationship().add(getFormulaEntryRelationship(item.getFormula()));
        }

        if (item.getTheraputicGoodStrength() != null) {
            substanceAdministration.getEntryRelationship().add(getTheraputicGoodStrength(item.getTheraputicGoodStrength()));
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

        if (item.getMedicationInstructionIdentifier() != null) {
            substanceAdministration.getReference().add(getMedicationInstructionReference(item.getMedicationInstructionIdentifier()));
        }

        if (item.getRouteCode() != null) {
            substanceAdministration.setRouteCode(Converter.convertToCECode(item.getRouteCode()));
        }

        if (item.getApproachSiteCode() != null) {
            substanceAdministration.getApproachSiteCode().add(Converter.convertToCECode(item.getApproachSiteCode()));
        }

        if (item.getMethodCode() != null) {
            substanceAdministration.setMethodCode(Converter.convertToCECode(item.getMethodCode()));
        }

        substanceAdministration.getEntryRelationship().add(getSupplyEntryRelationship(item));

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

    public static POCDMT000040EntryRelationship getSupplyEntryRelationship(PCEHRPrescriptionItem item) {

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
            substitutionPermissionValue.setCode(SectionEntryCodeSet.TE_SUBSTITUTION);
            subject2.setSubstitutionPermission(substitutionPermissionValue);
            supply.setSubjectOf2(subject2);
        }

        SimplifiedPeriodicIntervalTime minimumIntervalBetweenRepeats = item.getMinimumIntervalBetweenRepeats();
        if (minimumIntervalBetweenRepeats != null) {
            supply.getEffectiveTime().add(Converter.convert(minimumIntervalBetweenRepeats));
        }

        supply.getCoverage().addAll(getBenefitsCoverage(item));

        if (item.getQuantityDescription() != null) {
            supply.getEntryRelationship().add(getQuantityDescriptionEntry(item.getQuantityDescription()));
        }

        // hardcoded independentInd to false; as per 7.1.1
        supply.setIndependentInd(FALSE);

        supplyEntryRelationship.setSupply(supply);

        return supplyEntryRelationship;
    }

    public static POCDMT000040EntryRelationship getCommentsEntryRelationship(String comments) {

        POCDMT000040EntryRelationship entryRelationship = getCompER();
        POCDMT000040Act commentsAct = new POCDMT000040Act();
        commentsAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        commentsAct.setMoodCode(XDocumentActMood.EVN);
        String commentsActId = UUID.randomUUID().toString();
        commentsAct.getId().add(CDATypeUtil.getII(commentsActId));
        commentsAct.setCode(SectionEntryCodeSet.ADDITIONAL_COMMENTS);
        commentsAct.setText(CDATypeUtil.getST(comments));
        entryRelationship.setAct(commentsAct);

        return entryRelationship;
    }

    public static POCDMT000040EntryRelationship getTheraputicGoodStrength(String strength) {

        POCDMT000040EntryRelationship entryRelationship = getCompER();
        POCDMT000040Act commentsAct = new POCDMT000040Act();
        commentsAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        commentsAct.setMoodCode(XDocumentActMood.RQO);
        String commentsActId = UUID.randomUUID().toString();
        commentsAct.getId().add(CDATypeUtil.getII(commentsActId));

        commentsAct.setCode(Converter.convertToCDCode(new NCTISDataComponent("103.16769.170.1.1", "Therapeutic Good Strength")));
        commentsAct.setText(CDATypeUtil.getED(strength));
        entryRelationship.setAct(commentsAct);

        return entryRelationship;
    }

    public static POCDMT000040EntryRelationship getPatientCategoryEntryRelationship(Code patientCategory) {

        POCDMT000040EntryRelationship entryRelationship = getCompER();
        return entryRelationship;
    }

    public static POCDMT000040EntryRelationship getSupplyEntryRelationship(DispenseItem item) {

        POCDMT000040EntryRelationship supplyEntryRelationship = getCompER();
        POCDMT000040Supply supply = new POCDMT000040Supply();
        supply.setMoodCode(XDocumentSubstanceMood.EVN);
        supply.setClassCode(ActClassSupply.SPLY);

        II dispenseId = CDATypeUtil.getII(item.getDispenseItem().getRoot(), item.getDispenseItem().getExtension());
        if (item.getDispenseItem().getAssigningAuthorityName() != null) {
            dispenseId.setAssigningAuthorityName(item.getDispenseItem().getAssigningAuthorityName());
        }
        supply.getId().add(dispenseId);

        POCDMT000040Product product = new POCDMT000040Product();
        POCDMT000040ManufacturedProduct manuProduct = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material material = new POCDMT000040Material();

        material.setCode(Converter.convertToCECode(item.getTheraputicGood()));
        manuProduct.setManufacturedMaterial(material);
        product.setManufacturedProduct(manuProduct);
        supply.setProduct(product);

        // Fix up dateTime
        supply.getEffectiveTime().add(Converter.convertToSxcmts(item.getEventDate()));
        // supply.getEffectiveTime().add( Converter.convert( item.getEventDate() ) );

        BL independentIndValue = new BL();
        independentIndValue.setValue(false);
        supply.setIndependentInd(independentIndValue);
        supplyEntryRelationship.setSupply(supply);

        addDispensingQuantity(supply, item.getPbsManufactureCode(), item.getQuantityDispensed());

        POCDMT000040EntryRelationship brandEntryRelationship = getCompER();
        POCDMT000040Observation brandEntryRelationshipObservation = new POCDMT000040Observation();
        brandEntryRelationshipObservation.setClassCode(ActClassObservation.OBS);
        brandEntryRelationshipObservation.setMoodCode(XActMoodDocumentObservation.EVN);
        brandEntryRelationshipObservation.setCode(SectionEntryCodeSet.BRAND_SUBSTITUTION_OCCURRED);
        brandEntryRelationshipObservation.getValue().add(CDATypeUtil.getBL(item.isbrandSubstitutionOccured()));
        brandEntryRelationship.setObservation(brandEntryRelationshipObservation);
        supply.getEntryRelationship().add(brandEntryRelationship);

        supplyEntryRelationship.setSequenceNumber(CDATypeUtil.getINT(item.getNumberOfThisDispense()));
        // Benefit coverage is not mandatory
        if (item.getClaimTypeCategory() != null) {
            supply.getCoverage().add(getBenefitsCoverage(item));
        }

        if (item.getUnderCoPayment() != null && !ClaimTypeCategory.NO_BENEFIT.equals(item.getClaimTypeCategory())) {
            supply.getCoverage().add(getUnderCoPaymentCoverage(item));
        }

        if (item.getCloseTheGapId() != null) {
            supply.getCoverage().add(getCloseTheGapCoverage(item.getCloseTheGapId()));
        }
        if (item.getLabelInstruction() != null) {
            POCDMT000040EntryRelationship labelEntryRelationship = getCompER();
            POCDMT000040Act labelEntryRelationshipAct = new POCDMT000040Act();
            labelEntryRelationshipAct.setClassCode(XActClassDocumentEntryAct.INFRM);
            labelEntryRelationshipAct.setMoodCode(XDocumentActMood.RQO);
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

    public static POCDMT000040EntryRelationship getPCEHRSupplyEntryRelationship(PrescriptionItem item) {

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

        SimplifiedPeriodicIntervalTime minimumIntervalBetweenRepeats = item.getMinimumIntervalBetweenRepeats();
        if (minimumIntervalBetweenRepeats != null) {
            supply.getEffectiveTime().add(Converter.convert(minimumIntervalBetweenRepeats));
        }

        supply.getCoverage().addAll(getBenefitsCoverage(item));

        addDispensingQuantity(supply, item.getPbsRpbsManufacturerCode(), item.getDispenseQuantity());

        supplyEntryRelationship.setSupply(supply);

        return supplyEntryRelationship;
    }

    public static POCDMT000040Entry getSubstanceAdministrationEntry(PrescriberInstructionDetail prescriberInstructionDetail, String prescriberInstructionRecipientParticipantId) {

        POCDMT000040Entry entry = new POCDMT000040Entry();
        PrescriberInstructionRecipientParticipation prescriberInstructionRecipient = prescriberInstructionDetail.getPrescriberInstructionRecipient();
        // PrescriberInstructionRecipientParticipant prescriberInstructionRecipientParticipant = prescriberInstructionRecipient.getParticipant();

        entry.setTypeCode(XActRelationshipEntry.DRIV);
        POCDMT000040SubstanceAdministration substanceAdministration = new POCDMT000040SubstanceAdministration();
        final String substanceAdministrationEntryId = UUID.randomUUID().toString();
        substanceAdministration.getId().add(CDATypeUtil.getII(substanceAdministrationEntryId));
        substanceAdministration.setMoodCode(XDocumentSubstanceMood.RQO);
        substanceAdministration.setClassCode(ActClass.SBADM);
        substanceAdministration.setStatusCode(CDATypeUtil.getCS("new"));
        substanceAdministration.getEffectiveTime().add(CDATypeUtil.getSXCMTS(prescriberInstructionDetail.getDateTimePrescriberInstructionReceived()));
        substanceAdministration.setText(CDATypeUtil.getST(prescriberInstructionDetail.getPrescriberInstruction()));

        POCDMT000040EntryRelationship sourceEntryRelationship = getSourceEntryRelationship(prescriberInstructionDetail.getPrescriberInstructionSource());
        substanceAdministration.getEntryRelationship().add(sourceEntryRelationship);

        POCDMT000040EntryRelationship mediumEntryRelationship = getMediumEntryRelationship(prescriberInstructionDetail.getPrescriberInstructionCommunicationMedium());
        substanceAdministration.getEntryRelationship().add(mediumEntryRelationship);

        POCDMT000040Participant2 participant = getParticipant(prescriberInstructionRecipient, prescriberInstructionRecipientParticipantId);

        substanceAdministration.getParticipant().add(participant);

        entry.setSubstanceAdministration(substanceAdministration);

        return entry;
    }
}

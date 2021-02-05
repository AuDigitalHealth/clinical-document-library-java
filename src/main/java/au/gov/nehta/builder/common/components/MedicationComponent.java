package au.gov.nehta.builder.common.components;

import static au.gov.nehta.builder.common.SectionEntryCodeSet.ADDITIONAL_COMMENTS;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.NCTISChanceTypeValues;
import au.gov.nehta.builder.common.NCTISRecommendationOrChangeValues;
import au.gov.nehta.builder.common.NarrativeUtilCommon;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.clinical.es.KnownMedication;
import au.gov.nehta.model.clinical.es.Medications;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Consumable;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ManufacturedProduct;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Material;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SubstanceAdministration;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentSubstanceMood;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

public class MedicationComponent {

    private static ObjectFactory objectFactory = new ObjectFactory();
    private Map<String, CD> codeMap;

    public MedicationComponent() {
    }

    public MedicationComponent(Map<String, CD> codeMap) {
        this.codeMap = codeMap;
    }

    public POCDMT000040Component3 getMedications(Medications medications) {

        POCDMT000040Component3 medicationsComponent = objectFactory.createPOCDMT000040Component3();
        medicationsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
        POCDMT000040Section medicationSection = objectFactory.createPOCDMT000040Section();
        medicationSection.setClassCode(ActClass.DOCSECT);
        medicationSection.setMoodCode(ActMood.EVN);
        medicationSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
        medicationSection.setCode((CE) codeMap.get(ClinicalDocumentCodes.MEDICATION_ORDERS));
        medicationSection.setTitle(CDATypeUtil.getST("Medications"));

        if (null != medications && null != medications.getKnownMedications()
                && !medications.getKnownMedications().isEmpty()) {
            List<KnownMedication> knownMedications = medications.getKnownMedications();
            knownMedications.stream().filter(Objects::nonNull).forEach(
                    knownMedication -> medicationSection.getEntry()
                            .add(getKnownMedicationEntry(knownMedication)));
        }

        medicationSection.setText(NarrativeUtilCommon.getMedications(medications));
        medicationsComponent.setSection(medicationSection);
        return medicationsComponent;
    }

    private POCDMT000040Entry getKnownMedicationEntry(KnownMedication knownMedication) {

        POCDMT000040Entry knownMedicationEntry = objectFactory.createPOCDMT000040Entry();
        POCDMT000040SubstanceAdministration substanceAdministration =
                new POCDMT000040SubstanceAdministration();
        substanceAdministration.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        substanceAdministration.setClassCode(ActClass.SBADM);
        substanceAdministration.setMoodCode(XDocumentSubstanceMood.EVN);
        substanceAdministration.setText(CDATypeUtil.getST(knownMedication.getDirections()));
        if (NCTISChanceTypeValues.CEASED.getCodeValue().getCode().equals(knownMedication.getChangeType()
                .getCode())
                && NCTISRecommendationOrChangeValues.CHANGE_HAS_BEEN_MADE.getCodeValue().getCode()
                .equals(knownMedication.getChangeStatus().getCode())) {
            substanceAdministration.setNegationInd(true);
        }
        POCDMT000040Consumable consumable = objectFactory.createPOCDMT000040Consumable();
        POCDMT000040ManufacturedProduct manufacturedProduct = new POCDMT000040ManufacturedProduct();
        POCDMT000040Material manufacturedMaterial = objectFactory.createPOCDMT000040Material();
        manufacturedMaterial.setCode(
                Converter.convertToCECode(knownMedication.getTherapeuticGoodIdentification()));
        manufacturedProduct.setManufacturedMaterial(manufacturedMaterial);
        consumable.setManufacturedProduct(manufacturedProduct);
        substanceAdministration.setConsumable(consumable);
        substanceAdministration.getEntryRelationship()
                .add(getClinicalIndicationEntryRelationshipForKnownMedication(knownMedication));
        substanceAdministration.getEntryRelationship()
                .add(getCommentEntryRelationshipForKnownMedication(knownMedication));
        substanceAdministration.getEntryRelationship()
                .add(getChangeTypeEntryRelationshipForKnownMedication(knownMedication));
        knownMedicationEntry.setSubstanceAdministration(substanceAdministration);
        return knownMedicationEntry;
    }

    public POCDMT000040EntryRelationship getClinicalIndicationEntryRelationshipForKnownMedication(
            KnownMedication knownMedication) {

        POCDMT000040EntryRelationship clinicalIndicationRelationship = objectFactory
                .createPOCDMT000040EntryRelationship();
        clinicalIndicationRelationship.setTypeCode(XActRelationshipEntryRelationship.RSON);
        POCDMT000040Act actClinicalIndication = objectFactory.createPOCDMT000040Act();
        actClinicalIndication.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        actClinicalIndication.setClassCode(XActClassDocumentEntryAct.INFRM);
        actClinicalIndication.setMoodCode(XDocumentActMood.EVN);
        actClinicalIndication.setCode(codeMap.get(ClinicalDocumentCodes.CLINICAL_INDICATION));
        actClinicalIndication.setText(CDATypeUtil.getED(knownMedication.getClinicalIndication()));
        clinicalIndicationRelationship.setAct(actClinicalIndication);
        return clinicalIndicationRelationship;
    }

    public POCDMT000040EntryRelationship getCommentEntryRelationshipForKnownMedication(
            KnownMedication knownMedication) {

        POCDMT000040EntryRelationship commentRelationship = objectFactory
                .createPOCDMT000040EntryRelationship();
        commentRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
        POCDMT000040Act actComment = objectFactory.createPOCDMT000040Act();
        actComment.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        actComment.setClassCode(XActClassDocumentEntryAct.INFRM);
        actComment.setMoodCode(XDocumentActMood.EVN);
        actComment.setCode(ADDITIONAL_COMMENTS);
        actComment.setText(CDATypeUtil.getST(knownMedication.getMedicationInstructionComment()));
        commentRelationship.setAct(actComment);
        return commentRelationship;
    }

    private POCDMT000040EntryRelationship getChangeTypeEntryRelationshipForKnownMedication(
            KnownMedication knownMedication) {

        POCDMT000040EntryRelationship changeTypeRelationship = objectFactory
                .createPOCDMT000040EntryRelationship();
        changeTypeRelationship.setTypeCode(XActRelationshipEntryRelationship.SPRT);
        POCDMT000040Observation changeTypeObservation = objectFactory.createPOCDMT000040Observation();
        changeTypeObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        changeTypeObservation.setClassCode(ActClassObservation.OBS);
        changeTypeObservation.setMoodCode(XActMoodDocumentObservation.EVN);
        changeTypeObservation.setCode(codeMap.get(ClinicalDocumentCodes.CHANGE_TYPE));
        changeTypeObservation.setText(CDATypeUtil.getST(knownMedication.getChangeDesc()));
        changeTypeObservation.getValue().add(CDATypeUtil.getCD(knownMedication.getChangeType()));

        changeTypeObservation.getEntryRelationship()
                .add(getChangeStatusEntryRelationship(knownMedication));
        changeTypeObservation.getEntryRelationship()
                .add(getChangeOrRecommReasonEntryRelationship(knownMedication));

        changeTypeRelationship.setObservation(changeTypeObservation);
        return changeTypeRelationship;
    }

    private POCDMT000040EntryRelationship getChangeStatusEntryRelationship(
            KnownMedication knownMedication) {

        POCDMT000040EntryRelationship changeStatusEntryRelationship = objectFactory
                .createPOCDMT000040EntryRelationship();
        changeStatusEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
        POCDMT000040Observation changeStatusObservation = objectFactory.createPOCDMT000040Observation();
        changeStatusObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        changeStatusObservation.setClassCode(ActClassObservation.OBS);
        changeStatusObservation.setMoodCode(XActMoodDocumentObservation.EVN);
        changeStatusObservation.setCode(codeMap.get(ClinicalDocumentCodes.CHANGE_STATUS));
        changeStatusObservation.getValue().add(CDATypeUtil.getCD(knownMedication.getChangeStatus()));
        changeStatusEntryRelationship.setObservation(changeStatusObservation);
        return changeStatusEntryRelationship;
    }

    private POCDMT000040EntryRelationship getChangeOrRecommReasonEntryRelationship(
            KnownMedication knownMedication) {

        POCDMT000040EntryRelationship changeOrRecommReasonEntryRelationship =
                new POCDMT000040EntryRelationship();
        changeOrRecommReasonEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.RSON);
        POCDMT000040Act changeOrRecomReasonAct = objectFactory.createPOCDMT000040Act();
        changeOrRecomReasonAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        changeOrRecomReasonAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        changeOrRecomReasonAct.setMoodCode(XDocumentActMood.EVN);
        changeOrRecomReasonAct
                .setCode(codeMap.get(ClinicalDocumentCodes.CHANGE_OR_RECOMMENDATION_REASON));
        changeOrRecomReasonAct.setText(
                CDATypeUtil.getST(knownMedication.getChangeOrRecommendationReason()));
        changeOrRecommReasonEntryRelationship.setAct(changeOrRecomReasonAct);
        return changeOrRecommReasonEntryRelationship;
    }
}

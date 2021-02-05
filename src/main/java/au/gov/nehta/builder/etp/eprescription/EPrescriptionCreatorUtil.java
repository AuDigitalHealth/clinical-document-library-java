package au.gov.nehta.builder.etp.eprescription;

import au.gov.nehta.builder.DocumentCreatorUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.prescription.Observations;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.clinical.etp.common.item.Dosage;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.eprescription.BodyHeight;
import au.gov.nehta.model.clinical.etp.eprescription.BodyWeight;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionNoteDetail;
import au.net.electronichealth.ns.cda._2_0.*;

import javax.xml.bind.JAXBElement;
import java.util.Arrays;
import java.util.List;

public class EPrescriptionCreatorUtil extends DocumentCreatorUtil {
    public static StrucDocText getPrescriptionItemSectionNarrativeBlock(PrescriptionItem item,
                                                                        PrescriptionNoteDetail prescriptionNoteDetail,
                                                                        List<Entitlement> subjectOfCareEntitlement,
                                                                        List<Entitlement> prescriberEntitlement) {
        StrucDocText narrativeBlock = new StrucDocText();

        String note = null;
        if (prescriptionNoteDetail != null) note = prescriptionNoteDetail.getNote();

        buildPrescriptionItemNarrative(item, note, subjectOfCareEntitlement, narrativeBlock);

        narrativeBlock.setMediaType(HL7_TEXT_MEDIA_TYPE);
        return narrativeBlock;
    }

    public static void buildPrescriptionItemNarrative(PrescriptionItem item,
                                                      String notes,
                                                      List<Entitlement> subjectOfCareEntitlement,
                                                      StrucDocText narrativeBlock) {

        StrucDocTable prescriptionItemTable = new StrucDocTable();
        StrucDocCaption caption = new StrucDocCaption();
        caption.getContent().add("Prescription Item");
        prescriptionItemTable.setCaption(caption);
        StrucDocThead prescriptionItemTableHead = new StrucDocThead();
        StrucDocTr fieldValueHeader = NarrativeUtil.getTableHeaderRow(Arrays.asList("Field", "Value"));
        prescriptionItemTableHead.getTr().add(fieldValueHeader);
        prescriptionItemTable.setThead(prescriptionItemTableHead);

        StrucDocTbody prescriptionItemTableBody = new StrucDocTbody();

        add(prescriptionItemTableBody, "Date and Time Prescription Written",
                item.getDateTimePrescriptionWritten().format(NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER));

        add(prescriptionItemTableBody, "Date and Time Prescription Expires",
                item.getDateTimePrescriptionExpires().format(NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER));

        if (item.getPrescriptionItemIdentifier() != null) {
            add(prescriptionItemTableBody, "Prescription Item Identifier", item.getPrescriptionItemIdentifier().getExtension());
        }

        if (item.getPbsRpbsItemCode() != null) {
            add(prescriptionItemTableBody, "Therapeutic Good Identification", item.getPbsRpbsItemCode().getDisplayName());
        }

        if (item.getFormula() != null) {
            add(prescriptionItemTableBody, "Formula", item.getFormula());
        }

        if (item.getDirections() != null) {
            add(prescriptionItemTableBody, "Directions", item.getDirections());
        }

        //
        if (item.getBrandSubstituteAllowed() != null) {
            prescriptionItemTableBody.getTr().add(
                    NarrativeUtil.createTableBodyRowWithCellValues(Arrays.asList("Brand Substitution Allowed", NarrativeUtil.booleanToYesNo(item.getBrandSubstituteAllowed()))));
        }
        prescriptionItemTableBody.getTr().add(NarrativeUtil.createTableBodyRowWithCellValues(Arrays.asList("Maximum number of Repeats", item.getMaximumNumberOfRepeats().toString())));

        if (item.getMinimumIntervalBetweenRepeats() != null) {
            String minimumIntervalBetweenRepeats = item.getMinimumIntervalBetweenRepeats().getNarrative();
            add(prescriptionItemTableBody, "Minimum Interval Between Repeats", minimumIntervalBetweenRepeats);
        }

        if (item.getPbsType() != null) {
            add(prescriptionItemTableBody, "PBS Prescription Type", item.getPbsType().getDisplayName());
        }
        if (item.getMedicalBenefitCategoryType() != null) {
            add(prescriptionItemTableBody, "Medical Benefit Category Type", item.getMedicalBenefitCategoryType().getAlternativeCode());
        }

        if (item.getCloseTheGapBenifitId() != null) {
            add(prescriptionItemTableBody, "PBS Close the Gap Benefit", item.getCloseTheGapBenifitId().getExtension());
        }

        if (item.getPbsRpbsItemCode() != null && item.getPbsRpbsItemCode().getTranslations() != null && item.getPbsRpbsItemCode().getTranslations().size() > 0) {

            StringBuilder translations = new StringBuilder();
            for (Coded code : item.getPbsRpbsItemCode().getTranslations()) {
                translations.append(" - ");
                translations.append(code.getOriginalText());
            }
            add(prescriptionItemTableBody, "PBS/RPBS Item Code", translations.toString());
        }

        // PBS/RPBS Manufacturer Code
        if (item.getPbsRpbsManufacturerCode() != null) {
            add(prescriptionItemTableBody, "PBS/RPBS Manufacturer Code", item.getPbsRpbsManufacturerCode().getExtension());
        }
        if (item.getGroundsForConcurrentSupply() != null) {
            add(prescriptionItemTableBody, "Grounds for Concurrent Supply", item.getGroundsForConcurrentSupply().getDisplayName());
        }

        if (item.getPbsAuthorityPrescriptionNumber() != null) {
            add(prescriptionItemTableBody, "PBS/RPBS Authority Prescription Number", item.getPbsAuthorityPrescriptionNumber().getExtension());
        }

        if (item.getPbsAuthorityApprovalNumber() != null) {
            add(prescriptionItemTableBody, "PBS/RPBS Authority Approval Number", item.getPbsAuthorityApprovalNumber().getExtension());
        }

//        prescriptionItemTableBody.getTr().add( NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Quantity of Therapeutic Good", prescriptionItem.getQuantityOfTherapeuticGood() ) ) );
        if (item.getStreamlinedAuthorityApprovalNumber() != null) {
            add(prescriptionItemTableBody, "Streamlined Authority Approval Number", item.getStreamlinedAuthorityApprovalNumber().getExtension());
        }

        if (item.getStateAuthorityNumber() != null) {
            add(prescriptionItemTableBody, "State Authority Number", item.getStateAuthorityNumber().getExtension());
        }

        if (item.getReasonForTherapeuticGood() != null) {
            add(prescriptionItemTableBody, "Reason for Therapeutic Good", item.getReasonForTherapeuticGood());
        }

        if (item.getAdditionalComments() != null) {
            add(prescriptionItemTableBody, "Additional Comments", item.getAdditionalComments());
        }

        if (item.getDispensItemIdentifier() != null) {
            add(prescriptionItemTableBody, "Dispense Item Identifier", item.getDispensItemIdentifier().getExtension());
        }

        if (item.getMedicationInstructionIdentifier() != null) {
            add(prescriptionItemTableBody, "Medication Instruction Identifier", item.getMedicationInstructionIdentifier().getExtension());
        }

        if (notes != null) {
            if (item.isRequestItem())
                add(prescriptionItemTableBody, "Requester Note Detail", notes);
            else
                add(prescriptionItemTableBody, "Prescription Note Detail", notes);
        }

        prescriptionItemTable.getTbody().add(prescriptionItemTableBody);

        StrucDocTable timingTable = new StrucDocTable();
        StrucDocCaption timeCap = new StrucDocCaption();
        timeCap.getContent().add("Timing");
        timingTable.setCaption(timeCap);
        StrucDocTbody timingBody = new StrucDocTbody();

        boolean isTimingTableRequired = false;

        if (item.getTimingDescription() != null) {
            isTimingTableRequired = true;
            add(timingBody, "Timing Description", item.getTimingDescription());
        }

        if (item.getStructuredTime() != null && item.getStructuredTime().size() > 0) {
            isTimingTableRequired = true;
            StringBuilder buff = new StringBuilder();

            for (SetComponentTime t : item.getStructuredTime()) {
                if (t.getNarrative() != null) {
                    buff.append(t.getNarrative());
                    buff.append("<br />");
                }
            }

            // If we got narratives, use them
            if (buff.length() > 0)
                add(timingBody, "Effective Time", buff.toString());
        }

        if (item.getPRN() != null) {
            isTimingTableRequired = true;
            add(timingBody, "PRN", item.getPRN().toString());
        }

        if (item.getStartCriterion() != null) {
            isTimingTableRequired = true;
            add(timingBody, "Start Criterion", "Yes");
            add(timingBody, "Start Date", item.getStartCriterion().getDateTime().format(NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER));
        }

        if (item.getStopCriterion() != null) {
            isTimingTableRequired = true;
            add(timingBody, "Stop Criterion", "Yes");
            add(timingBody, "Stop Date", item.getStopCriterion().getDateTime().format(NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER));
        }

        Dosage dosage = item.getDosage();
        if (dosage != null) {
            if (dosage.getMaxDose() != null) {
                add(timingBody, "Maximum Dose", dosage.getMaxDose().toString());
            }
        }

        if (item.isLongTerm() != null) {
            add(timingBody, "Long term", item.isLongTerm().toString());
        }

        StrucDocThead timingTableHead = new StrucDocThead();
        timingTableHead.getTr().add(fieldValueHeader);
        timingTable.setThead(timingTableHead);
        timingTable.getTbody().add(timingBody);

        StrucDocTable doseTable = null;
        if (dosage != null) {
            // Structured dose
            doseTable = new StrucDocTable();
            StrucDocCaption doseCap = new StrucDocCaption();
            doseCap.getContent().add("Structured Dose");
            doseTable.setCaption(doseCap);
            StrucDocTbody doseBody = new StrucDocTbody();

            QuantityUnitDescription doseQty = dosage.getDoseQuantity();

            if (doseQty.getRealQuantity() != null) {
                add(doseBody, "Quantity", doseQty.getRealQuantity().getValue());
            }

            String dispensingUnit;
            if (doseQty.getCodedUnit() != null && doseQty.getCodedUnit().getOriginalText() != null) {
                dispensingUnit = doseQty.getCodedUnit().getOriginalText();
            } else if (doseQty.getCodedUnit() != null) {
                dispensingUnit = doseQty.getCodedUnit().getDisplayName();
            } else {
                dispensingUnit = doseQty.getRealQuantity().getUnit();
            }
            add(doseBody, "Dispensing Unit", dispensingUnit);

            if (doseQty.getQuantityDescription() != null) {
                add(doseBody, "Quantity Description", doseQty.getQuantityDescription());
            }

            doseTable.getTbody().add(doseBody);

            StrucDocThead dosHeader = new StrucDocThead();
            dosHeader.getTr().add(fieldValueHeader);
            doseTable.setThead(dosHeader);
        }

        // PBS Extemporaneous Ingredient
        StrucDocTable ingrTable = null;

        if (item.getExtemporaneousIngredients() != null && item.getExtemporaneousIngredients().size() > 0) {
            ingrTable = new StrucDocTable();
            StrucDocCaption ingrCap = new StrucDocCaption();
            ingrCap.getContent().add("PBS Extemporaneous Ingredient");
            ingrTable.setCaption(ingrCap);
            StrucDocTbody ingrBody = new StrucDocTbody();

            ingrTable.getTbody().add(ingrBody);

            StrucDocThead ingrhead = new StrucDocThead();
            ingrhead.getTr().add(NarrativeUtil.getTableHeaderRow(Arrays.asList("Ingredient", "Ingredient Quantity")));
            ingrTable.setThead(ingrhead);

            for (Ingredient i : item.getExtemporaneousIngredients()) {
                add(ingrBody, i.getIngredientCode().getOriginalText(), i.getQuantity().toString());
            }
        }

        // Administration Details
        boolean hasAdministrationDetails = item.getRouteCode() != null || item.getApproachSiteCode() != null || item.getMethodCode() != null;
        StrucDocTable admTable = null;
        if (hasAdministrationDetails) {
            admTable = new StrucDocTable();
            StrucDocCaption admCap = new StrucDocCaption();
            admCap.getContent().add("Administration Details");
            admTable.setCaption(admCap);
            StrucDocTbody admBody = new StrucDocTbody();

            if (item.getRouteCode() != null) {
                add(admBody, "Route", item.getRouteCode().getDisplayName());
            }

            if (item.getApproachSiteCode() != null) {
                add(admBody, "Anatomical Site", item.getApproachSiteCode().getDisplayName());
            }

            if (item.getMethodCode() != null) {
                add(admBody, "Medication Delivery Method", item.getMethodCode().getDisplayName());
            }

            admTable.getTbody().add(admBody);

            StrucDocThead admnHeader = new StrucDocThead();
            admnHeader.getTr().add(fieldValueHeader);
            admTable.setThead(admnHeader);
        }

        // Entitlements
        StrucDocTable entTable = new StrucDocTable();
        StrucDocCaption entCap = new StrucDocCaption();
        entCap.getContent().add("ParticipantEntitlement Details");
        entTable.setCaption(entCap);
        StrucDocTbody entBody = new StrucDocTbody();

        if (subjectOfCareEntitlement != null) {
            for (Entitlement e : subjectOfCareEntitlement) {
                add(entBody, e.getEntitlementType().getDisplayName(), e.getEntitlementNumber().getExtension());
            }
        }

        entTable.getTbody().add(entBody);

        StrucDocThead entHeader = new StrucDocThead();
        entHeader.getTr().add(fieldValueHeader);
        entTable.setThead(entHeader);

        JAXBElement<StrucDocTable> prescriptionItemTableJaxbElement = new ObjectFactory().createStrucDocTextTable(prescriptionItemTable);
        narrativeBlock.getContent().add(prescriptionItemTableJaxbElement);

        if (isTimingTableRequired) {
            JAXBElement<StrucDocTable> timingTableJaxbElement = new ObjectFactory().createStrucDocTextTable(timingTable);
            narrativeBlock.getContent().add(timingTableJaxbElement);
        }

        if (doseTable != null) {
            JAXBElement<StrucDocTable> dosageTableJaxbElement = new ObjectFactory().createStrucDocTextTable(doseTable);
            narrativeBlock.getContent().add(dosageTableJaxbElement);
        }

        if (ingrTable != null) {
            JAXBElement<StrucDocTable> ingrTableJaxbElement = new ObjectFactory().createStrucDocTextTable(ingrTable);
            narrativeBlock.getContent().add(ingrTableJaxbElement);
        }

        if (admTable != null) {
            JAXBElement<StrucDocTable> admTableJaxbElement = new ObjectFactory().createStrucDocTextTable(admTable);
            narrativeBlock.getContent().add(admTableJaxbElement);
        }
        JAXBElement<StrucDocTable> entTableJaxbElement = new ObjectFactory().createStrucDocTextTable(entTable);
        narrativeBlock.getContent().add(entTableJaxbElement);
    }

    public static StrucDocText getObservationsSectionNarrativeBlock(Observations observations) {

        StrucDocText narrativeBlock = new StrucDocText();
        StrucDocTable observationsTable = new StrucDocTable();
        StrucDocCaption caption = new StrucDocCaption();
        caption.getContent().add("Observations ");
        observationsTable.setCaption(caption);
        StrucDocThead observationsTableHead = new StrucDocThead();
        observationsTableHead.getTr().add(NarrativeUtil.getTableHeaderRow(Arrays.asList("Name", "Value", "Date")));

        observationsTable.setThead(observationsTableHead);
        StrucDocTbody observationsTableBody = new StrucDocTbody();

        List<StrucDocTr> rows = observationsTableBody.getTr();
        if (observations.getBodyWeight() != null) {
            BodyWeight bodyWeight = observations.getBodyWeight();
            rows.add(
                    NarrativeUtil.createTableBodyRowWithCellValues(Arrays.asList("Body Weight", bodyWeight.getValue() + " " + bodyWeight.getUnit(),
                            bodyWeight.getDateTimeOfObservation().getDateTime().format(NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER))));
        }

        if (observations.getBodyHeight() != null) {
            BodyHeight bodyHeight = observations.getBodyHeight();
            rows.add(
                    NarrativeUtil.createTableBodyRowWithCellValues(Arrays.asList("Body Height", bodyHeight.getValue() + " " + bodyHeight.getUnit(),
                            bodyHeight.getDateTimeOfObservation().getDateTime().format(NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER))));
        }

        observationsTable.getTbody().add(observationsTableBody);
        JAXBElement<StrucDocTable> observationsTableJaxbElement = new ObjectFactory().createStrucDocTextTable(observationsTable);
        narrativeBlock.getContent().add(observationsTableJaxbElement);

        return narrativeBlock;
    }

    public static CD getWeightObservationCode() {
        SNOMED_AU_Code weightCode = new SNOMED_AU_Code("27113001", "Body Weight");
        weightCode.setCodeSystemVersion("20101130");
        return Converter.convertToCDCode(weightCode);
    }

    public static CD getHeightObservationCode() {
        SNOMED_AU_Code heightCode = new SNOMED_AU_Code("50373000", "Body Height");
        heightCode.setCodeSystemVersion("20101130");
        return Converter.convertToCDCode(heightCode);
    }
}

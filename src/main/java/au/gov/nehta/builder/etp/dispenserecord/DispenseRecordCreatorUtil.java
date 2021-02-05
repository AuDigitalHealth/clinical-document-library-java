package au.gov.nehta.builder.etp.dispenserecord;

import java.util.Arrays;
import java.util.List;

import javax.xml.bind.JAXBElement;

import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItem;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.StrucDocThead;

public class DispenseRecordCreatorUtil {
    public static StrucDocText getDispenseItemSectionNarrativeBlock(DispenseItem item, List<Entitlement> subjectOfCareEntitlement, List<Entitlement> dispensingOrganisationEntitlement) {
        StrucDocText narrativeBlock = new StrucDocText();

        StrucDocTable dispenseItemTable = new StrucDocTable();

        StrucDocThead dispenseItemTableHead = new StrucDocThead();
        dispenseItemTableHead.getTr().add(NarrativeUtil.getTableHeaderRow(Arrays.asList("Field", "Value")));
        dispenseItemTable.setThead(dispenseItemTableHead);
        StrucDocTbody itemTable = new StrucDocTbody();

        StrucDocCaption caption = new StrucDocCaption();
        caption.getContent().add("Dispense Item");
        dispenseItemTable.setCaption(caption);


        add(itemTable, "Status", item.getDispensingStatus().getStatusCode());
        add(itemTable, "Dispense Item Identifier", item.getDispenseItem().getExtension());


//        add(itemTable, "Date and Time of Dispense Event",
//                        NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER.print( dispenseItem.getEventDate().getTime() ) ) ;

        add(itemTable, "Prescription Item Identifier", item.getPrescriptionItem().getExtension());

        if (item.getTheraputicGood().isCoded()) {
            add(itemTable, "Therapeutic Good Identification", item.getTheraputicGood().getDisplayName());
        }

        if (item.getFormula() != null) {
            add(itemTable, "Formula", item.getFormula());
        }

        if (item.getLabelInstruction() != null) {
            add(itemTable, "Label Instruction", item.getLabelInstruction());
        }

//        if(dispenseItem.getQuantityDispensed().getQuantityToDispense() != null){
//            add(itemTable,"Quantity of Therapeutic Good", dispenseItem.getQuantityDispensed().getQuantityToDispense().getValue() ) ;
//        }
        add(itemTable, "Brand Substitution Occurred", NarrativeUtil.booleanToYesNo(item.isbrandSubstitutionOccured()));

        add(itemTable, "Maximum number of Repeats", item.getMaxRepeats().toString());

        add(itemTable, "Number of this Dispense", item.getNumberOfThisDispense().toString());


        if (item.getCloseTheGapId() != null) {
            add(itemTable, "PBS Close the Gap Benefit", item.getCloseTheGapId().getExtension());
        }

        if (item.getPbsItemCode() != null) {
            add(itemTable, "PBS/RPBS Item Code", item.getPbsItemCode().getDisplayName());
        }

        if (item.getPbsManufactureCode() != null) {
            add(itemTable, "PBS/RPBS Manufacturer Code", item.getPbsManufactureCode().getExtension() + " " + item.getPbsManufactureCode().getAssigningAuthorityName());
        }

        add(itemTable, "Claim Category Type", item.getClaimTypeCategory().getDisplayName());

        if (item.isEarlySupplyWithBenifit() != null && item.isEarlySupplyWithBenifit()) {
            add(itemTable, "Early Supply With Pharmaceutical Benefit", NarrativeUtil.booleanToYesNo(true));
        }


        if (item.getAdditionalComments() != null) {
            add(itemTable, "Additional Comments", item.getAdditionalComments());
        }

        if (dispensingOrganisationEntitlement != null) {
            itemTable.getTr().add(
                    NarrativeUtil.createTableBodyRowWithCells(NarrativeUtil.getEntitlementCells("Dispensing Organisation Entitlements", dispensingOrganisationEntitlement)));
        }

        if (subjectOfCareEntitlement != null) {
            itemTable.getTr().add(NarrativeUtil.createTableBodyRowWithCells(NarrativeUtil.getSubjectOfCareEntitlementCells("Subject of Care Entitlements", subjectOfCareEntitlement)));
        }

        dispenseItemTable.getTbody().add(itemTable);
        JAXBElement<StrucDocTable> prescriptionItemTableJaxbElement = new ObjectFactory().createStrucDocTextTable(dispenseItemTable);
        narrativeBlock.getContent().add(prescriptionItemTableJaxbElement);

        //
        // Qunatity  
        //


        QuantityUnitDescription quantityDispensed = item.getQuantityDispensed();
        if (quantityDispensed != null) {
            StrucDocTable quantityTable = new StrucDocTable();
            StrucDocThead quantityTH = new StrucDocThead();
            quantityTH.getTr().add(NarrativeUtil.getTableHeaderRow(Arrays.asList("Field", "Value")));
            quantityTable.setThead(quantityTH);
            StrucDocTbody quantityBody = new StrucDocTbody();

            StrucDocCaption qcaption = new StrucDocCaption();
            qcaption.getContent().add("Quantity To Dispense");
            quantityTable.setCaption(qcaption);

            if (quantityDispensed.getRealQuantity() != null) {
                add(quantityBody, "Quantity", quantityDispensed.getRealQuantity().getValue());
            }

            String dispensingUnit = "";
            if (quantityDispensed.getCodedUnit() != null && quantityDispensed.getCodedUnit().getOriginalText() != null) {
                dispensingUnit = quantityDispensed.getCodedUnit().getOriginalText();
            } else if (quantityDispensed.getCodedUnit() != null) {
                dispensingUnit = quantityDispensed.getCodedUnit().getDisplayName();
            } else {
                dispensingUnit = quantityDispensed.getRealQuantity().getUnit();
            }
            add(quantityBody, "Dispensing Unit", dispensingUnit);

            quantityTable.getTbody().add(quantityBody);
            narrativeBlock.getContent().add(new ObjectFactory().createStrucDocTextTable(quantityTable));

        }


        //
        // PBS Extemporaneous Ingredient  
        //

        if (quantityDispensed != null) {

            if (item.getExtemporaneousIngredients().size() > 0) {
                StrucDocTable ingrTable = new StrucDocTable();
                StrucDocThead ingrTH = new StrucDocThead();
                ingrTH.getTr().add(NarrativeUtil.getTableHeaderRow(Arrays.asList("Ingredient Name", "Ingredient Quantity")));
                ingrTable.setThead(ingrTH);
                StrucDocTbody ingrBody = new StrucDocTbody();

                StrucDocCaption icaption = new StrucDocCaption();
                icaption.getContent().add("PBS Extemporaneous Ingredient");
                ingrTable.setCaption(icaption);

                for (Ingredient i : item.getExtemporaneousIngredients()) {
                    add(ingrBody, i.getIngredientCode().getDisplayName(), i.getQuantity().toString());
                }

                ingrTable.getTbody().add(ingrBody);
                narrativeBlock.getContent().add(new ObjectFactory().createStrucDocTextTable(ingrTable));
            }
        }

        return narrativeBlock;
    }

    private static void add(StrucDocTbody table, String key, String value) {
        table.getTr().add(
                NarrativeUtil.createTableBodyRowWithCellValues(Arrays.asList(key, value)));

    }
}

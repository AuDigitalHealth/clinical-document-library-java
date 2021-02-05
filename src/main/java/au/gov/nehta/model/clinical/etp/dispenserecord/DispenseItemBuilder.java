package au.gov.nehta.model.clinical.etp.dispenserecord;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PatientCategory;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;

import java.time.ZonedDateTime;

public class DispenseItemBuilder {

    private DispenseItemImpl item = new DispenseItemImpl();

    //****************
    //Mandatory fields
    //****************

    /**
     * Add a Therapeutic Good identifier.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder therapeuticGood(Code code) {
        item.theraputicGood = code;
        return this;
    }

    /**
     * Add a dispense event date.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder eventDate(ZonedDateTime date) {
        item.eventDate = date;
        return this;
    }

    /**
     * Add a  prescription item identifier.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder prescriptionItem(UniqueIdentifier id) {
        item.prescriptionItem = id;
        return this;
    }

    /**
     * Add a  dispense item identifier.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder dispenseItem(UniqueIdentifier id) {
        item.dispenseItem = id;
        return this;
    }

    /**
     * Add an indicator to signal whether brand substitution occurred or not.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder isbrandSubstitutionOccured(boolean isSubstituted) {
        item.isbrandSubstitutionOccured = isSubstituted;
        return this;
    }

    /**
     * Add a maximum number of repeats.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder maximumNumberOfRepeats(int maxRepeats) {
        item.maxRepeats = maxRepeats;
        return this;
    }

    /**
     * Add a maximum number of repeats.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder numberOfThisDispense(int numberOfThisDispense) {
        item.numberOfThisDispense = numberOfThisDispense;
        return this;
    }

    /**
     * Add quantity dispensed.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder quantityDispensed(QuantityUnitDescription quantityDispensed) {
        item.quantityDispensed = quantityDispensed;
        return this;
    }

    /**
     * Add a claim type category.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder claimTypeCategory(Coded category) {
        item.claimTypeCategory = category;
        return this;
    }

    /**
     * Add a patient category.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder patientCategory(PatientCategory category) {
        item.patientCategory = category;
        return this;
    }

    /**
     * Add a dispensing status.<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder dispensingStatusType(DispensingStatusType type) {
        item.status = type;
        return this;
    }


    //*****************
    // Optional Fields
    //****************


    /**
     * Add a patient category.<br>
     * <p>
     * This method may be called repeatedly without overwriting the previous value.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder addExtemporaneousIngredients(Ingredient i) {
        item.extemporaneousIngredients.add(i);
        return this;
    }

    /**
     * Add a formula.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder formula(String formula) {
        item.formula = formula;
        return this;
    }


    /**
     * Add a label instruction<br>
     * <p>
     * may be chained with other calls <br>
     */
    public DispenseItemBuilder labelInstruction(String instruction) {
        item.labelInstruction = instruction;
        return this;
    }

    /**
     * Add a close the gap ID.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder closeTheGapId(UniqueIdentifier closeTheGapId) {
        item.closeTheGapId = closeTheGapId;
        return this;
    }

    /**
     * Add a PBS/RPBS item code.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder pbsItemCode(Coded code) {

        if (code.getTranslations() != null && code.getTranslations().size() > 0) {
            // if we have a translation chek that the code 
            // has an orginal text and the translations do not.
            if (null == code.getOriginalText() || "".equals(code.getOriginalText())) {
                throw new IllegalArgumentException("A translated PBS/RPBSItemCode code must supply an originalText element on the parent code");
            }

            for (Code translation : code.getTranslations()) {
                if (null != translation.getOriginalText()) {
                    throw new IllegalArgumentException(" A PBS/RPBSItemCode code translatation must not contain an originalText, found:" + translation.getOriginalText());
                }
            }
        }

        item.pbsItemCode = code;
        return this;
    }

    /**
     * Add a PBS/RPBS manufacturer code.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder pbsManufacturerCode(UniqueIdentifier pbsManufacturerCode) {
        item.pbsManufacturerCode = pbsManufacturerCode;
        return this;
    }

    /**
     * Add a code signalling this item was under co-payment.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder underCoPayment(ClaimTypeCategory underCoPayment) {
        item.underCoPayment = underCoPayment;
        return this;
    }

    /**
     * Add a code identifying the supply as early with pbs benefits.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder earlySupplyWithBenifit(boolean earlySupplyWithBenefit) {
        item.earlySupplyWithBenifit = earlySupplyWithBenefit;
        return this;
    }

    /**
     * Add additionalComments.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder additionalComments(String comments) {
        item.additionalComments = comments;
        return this;
    }

    /**
     * Add an racf Id.<br>
     * <p>
     * May be chained with other calls.<br>
     */
    public DispenseItemBuilder racfId(String racfId) {
        item.racfId = racfId;
        return this;
    }

    /**
     * Builds a completed prescription item.
     *
     * @return a valid DispenseItem
     * @throws IllegalArgumentException if illegal argument provided
     */
    public DispenseItem build() throws IllegalArgumentException {
        isValid();
        return item;
    }

    public void isValid() throws IllegalArgumentException {
        ArgumentUtils.checkNotNull(item.theraputicGood, "Therapeutic good ");
        ArgumentUtils.checkNotNull(item.eventDate, "event Date");
        ArgumentUtils.checkNotNull(item.prescriptionItem, "prescription item");
        ArgumentUtils.checkNotNull(item.dispenseItem, "dispense item");
        ArgumentUtils.checkNotNull(item.isbrandSubstitutionOccured, "Brand substitution occurred");
        ArgumentUtils.checkNotNull(item.maxRepeats, "Maximum Number Of Repeats");
        ArgumentUtils.checkNotNull(item.numberOfThisDispense, "number of dispenses");
        ArgumentUtils.checkNotNull(item.quantityDispensed, "quantity dispensed");
        ArgumentUtils.checkNotNull(item.claimTypeCategory, "claim type category");
        ArgumentUtils.checkNotNull(item.patientCategory, "patient category");
        ArgumentUtils.checkNotNull(item.status, "Dispensing status ");
    }
}

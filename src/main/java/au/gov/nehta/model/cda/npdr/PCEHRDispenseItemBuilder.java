package au.gov.nehta.model.cda.npdr;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PatientCategory;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.dispenserecord.ClaimTypeCategory;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispensingStatusType;

import java.time.ZonedDateTime;

public class PCEHRDispenseItemBuilder {

    private PCEHRDispenseItemImpl item = new PCEHRDispenseItemImpl();

    //****************
    //Mandatory fields
    //****************

    /**
     * Add a Therapeutic Good identifier<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder therapeuticGood(Code code) {
        item.setTheraputicGood(code);
        return this;
    }

    /**
     * Add a dispense event date<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder eventDate(ZonedDateTime date) {
        item.setEventDate(date);
        return this;
    }

    /**
     * Add a  prescription item identifier<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder prescriptionItem(UniqueIdentifier id) {
        item.setPrescriptionItem(id);
        return this;
    }

    /**
     * Add a  dispense item identifier<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder dispenseItem(UniqueIdentifier id) {
        item.setDispenseItem(id);
        return this;
    }

    /**
     * Add an indicator to signal whether brand substitution occurred or not<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder isbrandSubstitutionOccured(boolean isSubstituted) {
        item.setIsbrandSubstitutionOccured(isSubstituted);
        return this;
    }

    /**
     * Add a maximum number of repeats<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder maximumNumberOfRepeats(int maxRepeats) {
        item.setMaxRepeats(maxRepeats);
        return this;
    }

    /**
     * Add a maximum number of repeats<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder numberOfThisDispense(int numberOfThisDispense) {
        item.setNumberOfThisDispense(numberOfThisDispense);
        return this;
    }

    /**
     * Add a claim type category<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder claimTypeCategory(Coded category) {
        item.setClaimTypeCategory(category);
        return this;
    }

    /**
     * Add a patient category <br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder patientCategory(PatientCategory category) {
        item.setPatientCategory(category);
        return this;
    }

    /**
     * Add a dispensing status <br>
     * <em>Mandatory Field</em><br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder dispensingStatusType(DispensingStatusType type) {
        item.setStatus(type);
        return this;
    }

    /**
     * Add quantity dispensed<br>
     * <em>Mandatory Field</em><br>
     * <p>
     * may be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder quantityDispensed(QuantityUnitDescription quantityDispensed) {
        item.setQuantityDispensed(quantityDispensed);
        return this;
    }

    //*****************
    // optional Fields
    //****************

    /**
     * Add a patient category <br>
     * <p>
     * This method may be called repeatedly without overwriting the previous value <br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder addExtemporaneousIngredients(Ingredient i) {
        item.getExtemporaneousIngredients().add(i);
        return this;
    }

    /**
     * Add a formula <br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder formula(String formula) {
        item.setFormula(formula);
        return this;
    }

    /**
     * Add a label instruction<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder labelInstruction(String instruction) {
        item.setLabelInstruction(instruction);
        return this;
    }

    /**
     * Add a close the gap ID<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder closeTheGapId(UniqueIdentifier closeTheGapId) {
        item.setCloseTheGapId(closeTheGapId);
        return this;
    }

    /**
     * Add a PBS/RPBS item code<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder pbsItemCode(Coded pbsItemCode) {
        item.setPbsItemCode(pbsItemCode);
        return this;
    }

    /**
     * Add a PBS/RPBS manufacturer code<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder pbsManufacturerCode(UniqueIdentifier pbsManufacturerCode) {
        item.setPbsManufacturerCode(pbsManufacturerCode);
        return this;
    }

    /**
     * Add a code signaling this item was under co-payment<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder underCoPayment(ClaimTypeCategory underCoPayment) {
        item.setUnderCoPayment(underCoPayment);
        return this;
    }

    /**
     * Add a code identifying the supply as early with pbs benefits<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder earlySupplyWithBenifit(boolean earlySupplyWithBenefit) {
        item.setEarlySupplyWithBenifit(earlySupplyWithBenefit);
        return this;
    }

    /**
     * Add additionalComments<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder additionalComments(String comments) {
        item.setAdditionalComments(comments);
        return this;
    }

    /**
     * Add an racf Id<br>
     * <p>
     * May be chained with other calls <br>
     */
    public PCEHRDispenseItemBuilder racfId(String racfId) {
        item.setRacfId(racfId);
        return this;
    }

    /**
     * Builds a completed prescription item.
     *
     * @return a valid DispenseItem
     * @throws IllegalArgumentException Exception when illegal argument provided.
     */
    public PCEHRDispenseItem build() throws IllegalArgumentException {
        isValid();
        return item;
    }

    public void isValid() throws IllegalArgumentException {
        ArgumentUtils.checkNotNull(item.getTheraputicGood(), "Therapeutic good ");
        ArgumentUtils.checkNotNull(item.getEventDate(), "event Date");
        ArgumentUtils.checkNotNull(item.getPrescriptionItem(), "prescription item");
        ArgumentUtils.checkNotNull(item.getDispenseItem(), "dispense item");
        ArgumentUtils.checkNotNull(item.isbrandSubstitutionOccured(), "Brand substitution occurred");
        ArgumentUtils.checkNotNull(item.getMaxRepeats(), "Maximum Number Of Repeats");
        ArgumentUtils.checkNotNull(item.getNumberOfThisDispense(), "number of dispenses");
        ArgumentUtils.checkNotNull(item.getQuantityDispensed(), "quantity dispensed");
        // ClaimTypeCategory is no longer mandatory
        // ArgumentUtils.checkNotNull( item.getClaimTypeCategory(), "claim type category" );
        ArgumentUtils.checkNotNull(item.getPatientCategory(), "patient category");
        // ArgumentUtils.checkNotNull( item.getstatus, "Dispensing status " );
    }
}

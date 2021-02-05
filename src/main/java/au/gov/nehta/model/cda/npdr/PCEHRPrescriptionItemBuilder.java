package au.gov.nehta.model.cda.npdr;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.common.time.SimplifiedPeriodicIntervalTime;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.MedicalBenefitCategoryType;
import au.gov.nehta.model.clinical.etp.common.item.PrescriptionItemIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;

import java.time.ZonedDateTime;

/**
 * Build a Prescription Item ensuring all mandatory fields are present.
 * <p>
 * Use the various methods to add data to the prescription item then call
 * build() to get your NPDRPrescriptionItemImpl. <br>
 * build() will throw illegalArgumentException if any mandatory data is missing.
 * <Br>
 */
public class PCEHRPrescriptionItemBuilder {

    private PCEHRPrescriptionItemImpl item = new PCEHRPrescriptionItemImpl();

    /**
     * Builds valid Prescription Items. <br />
     * Use the various methods to add data to the prescription item then call
     * build() to get your PrescriptionItemImpl. <br>
     * build() will throw illegalArgumentException if any mandatory data is
     * missing.
     */
    public PCEHRPrescriptionItemBuilder() {
    }

    /**
     * Add a form (The formulation or presentation of the overall substance.)<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder form(SNOMED_AU_Code form) {
        item.setProductFormCode(form);
        return this;
    }

    /**
     * Add a Therapeutic Good Generic Name<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder therapeuticGoodGenericName(String genericName) {
        item.setGenericName(genericName);
        return this;
    }

    /**
     * Add a Therapeutic Good Generic strength<br>
     * This will be represented as an NCTIS data element
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder therapeuticGoodGenericStrength(String strength) {
        item.setTheraputicGoodStrength(strength);
        return this;
    }

    /**
     * Add a creation timestamp<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder dateTimeWritten(ZonedDateTime written) {
        item.setDateTimePrescriptionWritten(written);
        return this;
    }

    /**
     * Add a prescription expiry timestamp<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder dateTimeExpires(ZonedDateTime expires) {
        item.setDateTimePrescriptionExpires(expires);
        return this;
    }

    /**
     * Add a formula<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder formula(String formula) {
        item.setFormula(formula);
        return this;
    }

    public PCEHRPrescriptionItemBuilder quantityDescription(String qtyDesc) {
        item.setQuantityDescription(qtyDesc);
        return this;
    }

    /**
     * Add a DispenseQuantity. <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder dispenseQuantity(QuantityUnitDescription dispenseQuantity) {
        item.setDispenseQuantity(dispenseQuantity);
        return this;
    }

    /**
     * Add a Dispense item identifier <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder dispensItemIdentifier(UniqueIdentifier id) {
        item.setDispensItemIdentifier(id);
        return this;
    }

    /**
     * Add a Minimum Interval Between Repeats <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder minimumIntervalBetweenRepeats(TimeQuantity timeInterval) {
        item.setMinimumIntervalBetweenRepeats(timeInterval);
        return this;
    }

    /**
     * Add a Minimum Interval Between Repeats <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder minimumIntervalBetweenRepeats(SimplifiedPeriodicIntervalTime period) {
        item.setMinimumIntervalBetweenRepeats(period);
        return this;
    }

    /**
     * Add a Reason For Therapeutic Good <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder reasonForTherapeuticGood(String reasonForTherapeuticGood) {
        item.setReasonForTherapeuticGood(reasonForTherapeuticGood);
        return this;
    }

    /**
     * Add Additional Comments <br>
     * May be chained with other calls
     *
     * @return The builder with additional comments added.
     */
    public PCEHRPrescriptionItemBuilder additionalComments(String additionalComments) {
        item.setAdditionalComments(additionalComments);
        return this;
    }

    /**
     * Add PBSRPBSItemCode <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder pbsRPBSItemCode(Coded itemAsATranslatedCode) {
        item.setPBSRPBSItemCode(itemAsATranslatedCode);
        return this;
    }

    /**
     * Add Prescription Item Identifier <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder prescriptionItemIdentifier(PrescriptionItemIdentifier id) {
        item.setPrescriptionItemIdentifier(id);
        return this;
    }

    /**
     * Add an indicator for if the script allows brand Substitution <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder brandSubstituteAllowed(Boolean isSubstitute) {
        item.setBrandSubstituteAllowed(isSubstitute);
        return this;
    }

    /**
     * Add maximum Number Of Repeats <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder maximumNumberOfRepeats(Integer repeats) {
        item.setMaximumNumberOfRepeats(repeats);
        return this;
    }

    /**
     * Add a Medical Benefit Category Type <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder medicalBenefitCategoryType(MedicalBenefitCategoryType type) {
        item.setMedicalBenefitCategoryType(type);
        return this;
    }

    /**
     * Add a Directions <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder directions(String directionsForUse) {
        item.setDirections(directionsForUse);
        return this;
    }

    /**
     * Add a PBS Type <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder pbsType(PBSPrescriptionTypeCode type) {
        item.setPbsType(type);
        return this;
    }

    /**
     * Add a Structured Time<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder addStructuredTime(SetComponentTime time) {
        item.getStructuredTime().add(time);
        return this;
    }

    /**
     * Add a PBS/RPBS Manufacturer Code<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder pbsRpbsManufacturerCode(UniqueIdentifier id) {
        item.setPbsRpbsManufacturerCode(id);
        return this;
    }

    /**
     * Add a timing description <br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder setTimingDescription(String string) {
        item.setTimingDescription(string);
        return this;
    }

    /**
     * Add a Route Code<br>
     * May be chained with other calls
     */
    public PCEHRPrescriptionItemBuilder routeCode(SNOMED_AU_Code snomed) {
        item.setRouteCode(snomed);
        return this;
    }

    /**
     * Build a Prescription Item
     * <p>
     * Mandatory items are:
     * <p>
     * Prescription expiry time          <br>
     * Prescription written time        <br>
     * therapeuticGoodIdentification pbs/rpbs item code <br>
     * prescriptionItemIdentifier<br>
     * brandSubstituteAllowed<br>
     * maximumNumberOfRepeats<br>
     * medicalBenefitCategoryType<br>
     * instructions for use (directions)<br>
     * Pbs type<br>
     * close the gap id<br>
     * groundsForConcurrentSupply <br>
     *
     * <p>
     * Items not allowed for a prescription request:<br>
     * <p>
     * GroundsForConcurrentSupply<br>
     * ReasonForTherapeuticGood<br>
     * MinimumIntervalBetweenRepeats<br>
     *
     * @return the built prescriptionItem object
     * @throws IllegalArgumentException if a mandatory data item has not been set.
     */
    public PCEHRPrescriptionItem build() throws IllegalArgumentException {
        isValidPCEHRPrescription(); // throws exception if not valid
        return item;
    }

    private void isValidPCEHRPrescription() {
        ArgumentUtils.checkNotNull(item.getDateTimePrescriptionExpires(), "Prescripiton Item - Prescription expiry time ");
        ArgumentUtils.checkNotNull(item.getDateTimePrescriptionWritten(), "Prescripiton Item - Prescription written time ");
        ArgumentUtils.checkNotNull(item.getPbsRpbsItemCode(), "Prescripiton Item - therapeuticGoodIdentification pbs/rpbs item code");
        ArgumentUtils.checkNotNull(item.getPrescriptionItemIdentifier(), "Prescripiton Item -prescriptionItemIdentifier");
        ArgumentUtils.checkNotNull(item.getBrandSubstituteAllowed(), "Prescripiton Item - brandSubstituteAllowed");
        ArgumentUtils.checkNotNull(item.getMaximumNumberOfRepeats(), "Prescripiton Item - maximumNumberOfRepeats");
        ArgumentUtils.checkNotNull(item.getMedicalBenefitCategoryType(), "Prescripiton Item - medicalBenefitCategoryType");

        ArgumentUtils.checkNotNull(item.getDirections(), "Prescripiton Item - instructions for use (directions)");
    }
}

package au.gov.nehta.model.clinical.etp.dispenserecord;

import java.time.ZonedDateTime;
import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;

public interface DispenseItem {

    /**
     * @return the theraputicGood
     */
    Coded getTheraputicGood();

    /**
     * @return the eventDate
     */
    ZonedDateTime getEventDate();

    /**
     * @return the prescriptionItem
     */
    UniqueIdentifier getPrescriptionItem();

    /**
     * @return the dispenseItem
     */
    UniqueIdentifier getDispenseItem();

    /**
     * @return the formula
     */
    String getFormula();

    /**
     * @return the labelInstruction
     */
    String getLabelInstruction();

    /**
     * @return the isbrandSubstitutionOccured
     */
    Boolean isbrandSubstitutionOccured();

    /**
     * @return the maxRepeats
     */
    Integer getMaxRepeats();

    /**
     * @return the numberOfDispenses
     */
    Integer getNumberOfThisDispense();

    /**
     * @return the closeTheGapId
     */
    UniqueIdentifier getCloseTheGapId();

    /**
     * @return the pbsItemCode
     */
    Coded getPbsItemCode();

    /**
     * @return the pbsManufactureCode
     */
    UniqueIdentifier getPbsManufactureCode();

    /**
     * @return the quantityDispensed
     */
    QuantityUnitDescription getQuantityDispensed();

    /**
     * @return the extemporaneousIngredients
     */
    List<Ingredient> getExtemporaneousIngredients();

    /**
     * @return the claimTypeCategory
     */
    Coded getClaimTypeCategory();

    /**
     * @return the underCoPayment
     */
    Coded getUnderCoPayment();

    /**
     * @return the earlySupplyWithBenifit
     */
    Boolean isEarlySupplyWithBenifit();

    /**
     * @return the additionalComments
     */
    String getAdditionalComments();

    /**
     * @return the patientCategory
     */
    Coded getPatientCategory();

    /**
     * @return the racfId
     */
    String getRacfId();

    /**
     * @return the dispensing status
     */
    DispensingStatusType getDispensingStatus();
}

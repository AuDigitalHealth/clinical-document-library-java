package au.gov.nehta.model.clinical.etp.eprescription;


import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.common.time.SimplifiedPeriodicIntervalTime;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.Dosage;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.MedicalBenefitCategoryType;
import au.gov.nehta.model.clinical.etp.common.item.PrescriptionItemIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import org.joda.time.DateTime;

/**
 * Build a Prescription Item ensuring all mandatory fields are present.
 * <p>
 * Use the various methods to add data to the prescription item then call build() to get your
 * PrescriptionItemImpl. <br> build() will throw illegalArgumentException if any mandatory data is
 * missing.
 * <Br>
 */
public class PrescriptionItemBuilder {

  private PrescriptionItemImpl item = new PrescriptionItemImpl();

  /**
   * Builds valid Prescription Items. <br /> Use the various methods to add data to the prescription
   * item then call build() to get your PrescriptionItemImpl. <br> build() will throw
   * illegalArgumentException if any mandatory data is missing.
   */
  public PrescriptionItemBuilder() {
  }

  /**
   * Add a creation timestamp<br> may be chained with other calls
   */
  public PrescriptionItemBuilder dateTimeWritten(DateTime written) {
    item.setDateTimePrescriptionWritten(written);
    return this;
  }

  /**
   * Add a prescription expiry timestamp<br> may be chained with other calls
   */
  public PrescriptionItemBuilder dateTimeExpires(DateTime expires) {
    item.setDateTimePrescriptionExpires(expires);
    return this;
  }

  /**
   * Add a formula<br> may be chained with other calls
   */
  public PrescriptionItemBuilder formula(String formula) {
    item.setFormula(formula);
    return this;
  }

  /**
   * Add a Dosage. <br> may be chained with other calls
   */
  public PrescriptionItemBuilder dosage(Dosage dosage) {
    item.setDosage(dosage);
    return this;
  }

  /**
   * Add a DispenseQuantity. <br> may be chained with other calls
   */
  public PrescriptionItemBuilder dispenseQuantity(QuantityUnitDescription dispenseQuantity) {
    item.setDispenseQuantity(dispenseQuantity);
    return this;
  }

  /**
   * Add a Dispense item identifier <br> may be chained with other calls
   */
  public PrescriptionItemBuilder dispensItemIdentifier(UniqueIdentifier id) {
    item.setDispensItemIdentifier(id);
    return this;
  }

  /**
   * Add a Minimum Interval Between Repeats <br> may be chained with other calls
   */
  public PrescriptionItemBuilder minimumIntervalBetweenRepeats(TimeQuantity timeInterval) {
    item.setMinimumIntervalBetweenRepeats(timeInterval);
    return this;
  }

  /**
   * Add a Minimum Interval Between Repeats <br> may be chained with other calls
   */
  public PrescriptionItemBuilder minimumIntervalBetweenRepeats(
      SimplifiedPeriodicIntervalTime period) {
    item.setMinimumIntervalBetweenRepeats(period);
    return this;
  }

  /**
   * Add a State Authority Number <br> may be chained with other calls
   */
  public PrescriptionItemBuilder stateAuthorityNumber(UniqueIdentifier stateAuthorityNumber) {
    item.setStateAuthorityNumber(stateAuthorityNumber);
    return this;
  }

  /**
   * Add a Reason For Therapeutic Good <br> may be chained with other calls
   */
  public PrescriptionItemBuilder reasonForTherapeuticGood(String reasonForTherapeuticGood) {
    item.setReasonForTherapeuticGood(reasonForTherapeuticGood);
    return this;
  }

  /**
   * Add Additional Comments <br> may be chained with other calls
   */
  public PrescriptionItemBuilder additionalComments(String additionalComments) {
    item.setAdditionalComments(additionalComments);
    return this;
  }

  /**
   * Add PBSRPBSItemCode <br> may be chained with other calls
   */
  public PrescriptionItemBuilder pbsRPBSItemCode(Coded code) {

    if (code.getTranslations() != null && code.getTranslations().size() > 0) {
      //if we have a translation chek that the code
      //has an orginal text and the translations do not.
      if (null == code.getOriginalText() || "".equals(code.getOriginalText())) {
        throw new IllegalArgumentException(
            "A translated PBS/RPBSItemCode code must supply an originalText elemnt on the parent code");
      }

      for (Code translation : code.getTranslations()) {
        if (null != translation.getOriginalText()) {
          throw new IllegalArgumentException(
              " A PBS/RPBSItemCode code translatation must not contain an originalText, found:"
                  + translation.getOriginalText());
        }
      }

    }

    item.setPBSRPBSItemCode(code);
    return this;
  }

  /**
   * Add Prescription Item Identifier <br> may be chained with other calls
   */
  public PrescriptionItemBuilder prescriptionItemIdentifier(PrescriptionItemIdentifier id) {
    item.setPrescriptionItemIdentifier(id);
    return this;
  }

  /**
   * Add an indicator for if the script allows brand Substitution <br> may be chained with other
   * calls
   */
  public PrescriptionItemBuilder brandSubstituteAllowed(Boolean isSubstitute) {
    item.setBrandSubstituteAllowed(isSubstitute);
    return this;
  }

  /**
   * Add maximum Number Of Repeats <br> may be chained with other calls
   */
  public PrescriptionItemBuilder maximumNumberOfRepeats(Integer repeats) {
    item.setMaximumNumberOfRepeats(repeats);
    return this;
  }

  /**
   * Add a Medical Benefit Category Type <br> may be chained with other calls
   */
  public PrescriptionItemBuilder medicalBenefitCategoryType(MedicalBenefitCategoryType type) {
    item.setMedicalBenefitCategoryType(type);
    return this;
  }

  /**
   * Add a Medical Benefit Category Type <br> may be chained with other calls
   */
  public PrescriptionItemBuilder groundsForConcurrentSupply(GroundsForConcurrentSupply grounds) {
    item.setGroundsForConcurrentSupply(grounds);
    return this;
  }

  /**
   * Add a Directions <br> may be chained with other calls
   */
  public PrescriptionItemBuilder directions(String directionsForUse) {
    item.setDirections(directionsForUse);
    return this;
  }

  /**
   * Add a PBS Type <br> may be chained with other calls
   */
  public PrescriptionItemBuilder pbsType(PBSPrescriptionTypeCode type) {
    item.setPbsType(type);
    return this;
  }

  /**
   * Add a close the gap benifit id <br> may be chained with other calls
   * <p>
   *
   * Indicates that a subsidy under the PBS Closing the Gap Co-payment measure applies to this
   * item.
   *
   * @param id An extension and root detailing the CTG benefit identifiers
   */
  public PrescriptionItemBuilder closeTheGap(UniqueIdentifier id) {
    item.setCloseTheGapBenefitId(id);
    return this;
  }

  public PrescriptionItemBuilder pbsAuthorityPrescriptionNumber(UniqueIdentifier id) {
    item.setPbsAuthorityPrescriptionNumber(id);
    return this;
  }

  /**
   * THis Element Should NOT be populated if: (i) 1 the Medical Benefit Category type is PBS; and 2
   * the item is not listed as Authority Required, 'Authority Required (Streamlined)', or an
   * application to increase the maximum quantity and/or repeats has not been approved; or(ii) the
   * Medical Benefit Category type is neither PBS nor RPBS.
   *
   * @param id thePbs Authority Approval Number as a root+extension
   */
  public PrescriptionItemBuilder pbsAuthorityApprovalNumber(UniqueIdentifier id) {
    item.setPbsAuthorityApprovalNumber(id);
    return this;
  }

  /**
   * Add a prn <br> may be chained with other calls
   * <p>
   *
   * @param prn - An indicator that states the timing of the use or administration of the medicine,
   * vaccine or other therapeutic good is dependent, within limits, on the conditions or symptoms of
   * the subject of care.
   */
  public PrescriptionItemBuilder prn(Boolean prn) {
    item.setPRN(prn);
    return this;
  }

  /**
   * Add an indicator describing if this item is for long term usage<br> may be chained with other
   * calls
   */
  public PrescriptionItemBuilder longTerm(Boolean isLongTerm) {
    item.setLongTerm(isLongTerm);
    return this;
  }

  /**
   * Add an medication instruction identifier<br> may be chained with other calls
   */
  public PrescriptionItemBuilder medicationInstruction(UniqueIdentifier id) {
    item.setMedicationInstructionIdentifier(id);
    return this;
  }

  /**
   * Add a Streamlined Authority Approval Number<br> may be chained with other calls
   */
  public PrescriptionItemBuilder streamlinedAuthorityApprovalNumber(UniqueIdentifier id) {
    item.setStreamlinedAuthorityApprovalNumber(id);
    return this;
  }

  /**
   * Add a Structured Time<br> may be chained with other calls
   */
  public PrescriptionItemBuilder addStructuredTime(SetComponentTime time) {
    item.getStructuredTime().add(time);
    return this;
  }

  /**
   * Add a PBS/RPBS Manufacturer Code<br> may be chained with other calls
   */
  public PrescriptionItemBuilder pbsRpbsManufacturerCode(UniqueIdentifier id) {
    item.setPbsRpbsManufacturerCode(id);
    return this;
  }

  /**
   * Add a Start criterion date<br> may be chained with other calls
   */
  public PrescriptionItemBuilder startCriterion(PreciseDate date) {
    item.setStartCriterion(date);
    return this;
  }

  /**
   * Add a Stop criterion date<br> may be chained with other calls
   */
  public PrescriptionItemBuilder stopCriterion(PreciseDate date) {
    item.setStopCriterion(date);
    return this;
  }

  /**
   * Add a timming description <br> may be chained with other calls
   */
  public PrescriptionItemBuilder setTimingDescription(String string) {
    item.setTimingDescription(string);
    return this;
  }

  /**
   * Add an approach site<br> may be chained with other calls
   */
  public PrescriptionItemBuilder approachSiteCode(SNOMED_AU_Code snomed) {
    item.setApproachSiteCode(snomed);
    return this;
  }

  /**
   * Add a Route Code<br> may be chained with other calls
   */
  public PrescriptionItemBuilder routeCode(SNOMED_AU_Code snomed) {
    item.setRouteCode(snomed);
    return this;
  }

  /**
   * Add a Method Code<br> may be chained with other calls
   */
  public PrescriptionItemBuilder methodCode(SNOMED_AU_Code snomed) {
    item.setMethodCode(snomed);
    return this;
  }

  /**
   * Add an Ingrediten<br> may be called multiple times <br> may be chained with other calls
   */
  public PrescriptionItemBuilder extemporaneousIngredient(Ingredient ingr) {
    item.addExtemporaneousIngredient(ingr);
    return this;
  }

  /**
   * Build a Prescription Item
   *
   * Mandatory items are:
   *
   * Prescription expiry time          <br> Prescription written time        <br>
   * therapeuticGoodIdentification pbs/rpbs item code <br> prescriptionItemIdentifier<br>
   * brandSubstituteAllowed<br> maximumNumberOfRepeats<br> medicalBenefitCategoryType<br>
   * instructions for use (diretions)<br> Pbs type<br> close the gap id<br>
   * groundsForConcurrentSupply <br>
   *
   * <p>
   * Items not allowed for a prescription request:<br>
   *
   * GroundsForConcurrentSupply<br> ReasonForTherapeuticGood<br> MinimumIntervalBetweenRepeats<br>
   *
   * @return the built prescriptionItem object
   * @throws IllegalArgumentException if a mandatory data item has not been set.
   */
  public PrescriptionItem build() throws IllegalArgumentException {
    isValid(); // throws exception if not valid
    return item;
  }

  private boolean isValid() throws IllegalArgumentException {
    ArgumentUtils.checkNotNull(item.getDateTimePrescriptionExpires(),
        "Prescripiton Item - Prescription expiry time ");
    ArgumentUtils.checkNotNull(item.getDateTimePrescriptionWritten(),
        "Prescripiton Item - Prescription written time ");
    ArgumentUtils.checkNotNull(item.getPbsRpbsItemCode(),
        "Prescripiton Item - therapeuticGoodIdentification pbs/rpbs item code");
    ArgumentUtils.checkNotNull(item.getPrescriptionItemIdentifier(),
        "Prescripiton Item -prescriptionItemIdentifier");
    ArgumentUtils.checkNotNull(item.getBrandSubstituteAllowed(),
        "Prescripiton Item - brandSubstituteAllowed");
    ArgumentUtils.checkNotNull(item.getMaximumNumberOfRepeats(),
        "Prescripiton Item - maximumNumberOfRepeats");
    ArgumentUtils.checkNotNull(item.getMedicalBenefitCategoryType(),
        "Prescripiton Item - medicalBenefitCategoryType");
    ArgumentUtils.checkNotNull(item.getGroundsForConcurrentSupply(),
        "Prescripiton Item - groundsForConcurrentSupply");

    ArgumentUtils
        .checkNotNull(item.getDirections(), "Prescripiton Item - instructions for use (diretions)");
    ArgumentUtils.checkNotNull(item.getPbsType(), "Prescripiton Item - Pbs type");
    ArgumentUtils
        .checkNotNull(item.getCloseTheGapBenifitId(), "Prescripiton Item - close the gap id");
    return true;
  }

  /**
   * Build a Prescription Item suitable for a prescription request
   *
   * Mandatory items are:
   *
   * Prescription expiry time          <br> Prescription written time        <br>
   * therapeuticGoodIdentification pbs/rpbs item code <br> prescriptionItemIdentifier<br>
   * brandSubstituteAllowed<br> maximumNumberOfRepeats<br> medicalBenefitCategoryType<br>
   * instructions for use (diretions)<br> Pbs type<br> close the gap id<br>
   *
   * <p>
   * Items not allowed for a prescription request:<br>
   *
   * GroundsForConcurrentSupply<br> ReasonForTherapeuticGood<br> MinimumIntervalBetweenRepeats<br>
   *
   * @return the built prescriptionItem object
   * @throws IllegalArgumentException - if a mandatory data item has not been set. - if a supplied
   * field is not allowed, eg: ReasonForTheraputicGood
   */
  public PrescriptionItem buildPrescriptionRequestItem() throws IllegalArgumentException {
    isValidPrescriptionRequest(); // throws exception if not valid
    item.setRequestItem(true);
    return item;
  }

  private void isValidPrescriptionRequest() {
    ArgumentUtils.checkNotNull(item.getDateTimePrescriptionExpires(),
        "Prescripiton (Request) Item - Prescription expiry time ");
    ArgumentUtils.checkNotNull(item.getDateTimePrescriptionWritten(),
        "Prescripiton (Request) Item - Prescription written time ");
    ArgumentUtils.checkNotNull(item.getPbsRpbsItemCode(),
        "Prescripiton (Request) Item - therapeuticGoodIdentification pbs/rpbs item code");
    ArgumentUtils.checkNotNull(item.getPrescriptionItemIdentifier(),
        "Prescripiton (Request) Item - prescriptionItemIdentifier");
    ArgumentUtils.checkNotNull(item.getBrandSubstituteAllowed(),
        "Prescripiton (Request) Item - brandSubstituteAllowed");
    ArgumentUtils.checkNotNull(item.getMaximumNumberOfRepeats(),
        "Prescripiton (Request) Item - maximumNumberOfRepeats");
    ArgumentUtils.checkNotNull(item.getMedicalBenefitCategoryType(),
        "Prescripiton (Request) Item - medicalBenefitCategoryType");
//        ArgumentUtils.checkNotNull( item.getGroundsForConcurrentSupply(), "groundsForConcurrentSupply" );

    ArgumentUtils.checkNotNull(item.getDirections(),
        "Prescripiton (Request) Item - instructions for use (diretions)");
    ArgumentUtils.checkNotNull(item.getPbsType(), "Prescripiton (Request) Item - Pbs type");
    ArgumentUtils.checkNotNull(item.getCloseTheGapBenifitId(),
        "Prescripiton (Request) Item - close the gap id");

    if (item.getGroundsForConcurrentSupply() != null) {
      throw new IllegalArgumentException(
          "Grounds for concurrent supply is not allowed in a 'Prescription Request' prescription item ");
    }

    if (item.getReasonForTherapeuticGood() != null) {
      throw new IllegalArgumentException(
          "Reason for theraputic good is not allowed in a 'Prescription Request' prescription item ");
    }

    if (item.getMinimumIntervalBetweenRepeats() != null) {
      throw new IllegalArgumentException(
          "Minimum interval between repeats is not allowed in a 'Prescription Request' prescription item ");
    }

  }


  /**
   * Build a Prescription Item suitable for a prescription request
   *
   * Mandatory items are:
   *
   * Prescription expiry time          <br> Prescription written time        <br>
   * therapeuticGoodIdentification pbs/rpbs item code <br> prescriptionItemIdentifier<br>
   * brandSubstituteAllowed<br> maximumNumberOfRepeats<br> medicalBenefitCategoryType<br>
   * instructions for use (diretions)<br> Pbs type<br> close the gap id<br>
   *
   * <p>
   * Items not allowed for a prescription request:<br>
   *
   * GroundsForConcurrentSupply<br> ReasonForTherapeuticGood<br> MinimumIntervalBetweenRepeats<br>
   *
   * @return the built prescriptionItem object
   * @throws IllegalArgumentException - if a mandatory data item has not been set. - if a supplied
   * field is not allowed, eg: ReasonForTheraputicGood
   */
  public PrescriptionItem buildPCEHRPrescriptionItem() throws IllegalArgumentException {
    isValidPCEHRPrescription(); // throws exception if not valid
    // item.setRequestItem(true);
    return item;
  }

  private void isValidPCEHRPrescription() {
    ArgumentUtils.checkNotNull(item.getDateTimePrescriptionExpires(),
        "Prescripiton Item - Prescription expiry time ");
    ArgumentUtils.checkNotNull(item.getDateTimePrescriptionWritten(),
        "Prescripiton Item - Prescription written time ");
    ArgumentUtils.checkNotNull(item.getPbsRpbsItemCode(),
        "Prescripiton Item - therapeuticGoodIdentification pbs/rpbs item code");
    ArgumentUtils.checkNotNull(item.getPrescriptionItemIdentifier(),
        "Prescripiton Item -prescriptionItemIdentifier");
    ArgumentUtils.checkNotNull(item.getBrandSubstituteAllowed(),
        "Prescripiton Item - brandSubstituteAllowed");
    ArgumentUtils.checkNotNull(item.getMaximumNumberOfRepeats(),
        "Prescripiton Item - maximumNumberOfRepeats");
    ArgumentUtils.checkNotNull(item.getMedicalBenefitCategoryType(),
        "Prescripiton Item - medicalBenefitCategoryType");
    ArgumentUtils.checkNotNull(item.getGroundsForConcurrentSupply(),
        "Prescripiton Item - groundsForConcurrentSupply");

    ArgumentUtils
        .checkNotNull(item.getDirections(), "Prescripiton Item - instructions for use (diretions)");
    ArgumentUtils
        .checkNotNull(item.getCloseTheGapBenifitId(), "Prescripiton Item - close the gap id");


  }

}

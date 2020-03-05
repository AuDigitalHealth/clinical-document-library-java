package au.gov.nehta.model.clinical.etp.dispenserecord;

import java.util.List;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;

public interface DispenseItem {

  /**
   * @return the theraputicGood
   */
  public Coded getTheraputicGood();

  /**
   * @return the eventDate
   */
  public DateTime getEventDate();

  /**
   * @return the prescriptionItem
   */
  public UniqueIdentifier getPrescriptionItem();

  /**
   * @return the dispenseItem
   */
  public UniqueIdentifier getDispenseItem();

  /**
   * @return the formula
   */
  public String getFormula();

  /**
   * @return the labelInstruction
   */
  public String getLabelInstruction();

  /**
   * @return the isbrandSubstitutionOccured
   */
  public Boolean isbrandSubstitutionOccured();

  /**
   * @return the maxRepeats
   */
  public Integer getMaxRepeats();

  /**
   * @return the numberOfDispenses
   */
  public Integer getNumberOfThisDispense();

  /**
   * @return the closeTheGapId
   */
  public UniqueIdentifier getCloseTheGapId();

  /**
   * @return the pbsItemCode
   */
  public Coded getPbsItemCode();

  /**
   * @return the pbsManufactureCode
   */
  public UniqueIdentifier getPbsManufactureCode();

  /**
   * @return the quantityDispensed
   */
  public QuantityUnitDescription getQuantityDispensed();

  /**
   * @return the extemporaneousIngredients
   */
  public List<Ingredient> getExtemporaneousIngredients();

  /**
   * @return the claimTypeCategory
   */
  public Coded getClaimTypeCategory();

  /**
   * @return the underCoPayment
   */
  public Coded getUnderCoPayment();

  /**
   * @return the earlySupplyWithBenifit
   */
  public Boolean isEarlySupplyWithBenifit();

  /**
   * @return the additionalComments
   */
  public String getAdditionalComments();

  /**
   * @return the patientCategory
   */
  public Coded getPatientCategory();

  /**
   * @return the racfId
   */
  public String getRacfId();
  
  /**
   * @return the dispensing status
   */
  public DispensingStatusType getDispensingStatus();

}
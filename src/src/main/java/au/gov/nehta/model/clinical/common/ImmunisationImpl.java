package au.gov.nehta.model.clinical.common;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.AMTCode;
import au.gov.nehta.model.cda.common.code.AMTv3Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

/**
 * The act of administering a dose of a vaccine to a person for the purpose of preventing or
 * minimising the effects of a disease by producing immunity and/or to counter the effects of an
 * infectious organism or insult.
 */
public class ImmunisationImpl implements Immunisation {


  private Coded theraputicGood;
  private PreciseDate actionDateTime;
  private Integer sequenceNumber;
  private UniqueIdentifier id = UniqueIdentifierImpl.random();

  /**
   * @param theraputicGood The vaccine which was the focus of the action.
   *
   * Australian Medicines Terminology <br> The permissible values are the members of <br> the
   * following AMT reference sets:<br>  929360061000036106 Medicinal product reference set<br> 
   * 929360081000036101 Medicinal product pack reference set<br>  929360021000036102 Trade product
   * reference set<br>  929360041000036105 Trade product pack reference set
   * @param actionDateTime The point in time at which the Medication Action is completed.
   * @param sequenceNumber optional - The sequence number specific to the action being recorded
   */
  public ImmunisationImpl(AMTCode theraputicGood, PreciseDate actionDateTime,
      Integer sequenceNumber) {
    ArgumentUtils.checkNotNull(theraputicGood, "theraputicGood");
    ArgumentUtils.checkNotNull(actionDateTime, "actionDateTime");
    this.theraputicGood = theraputicGood;
    this.actionDateTime = actionDateTime;
    this.sequenceNumber = sequenceNumber;
  }

  /**
   * @param theraputicGood The vaccine which was the focus of the action.
   *
   * Australian Medicines Terminology <br> The permissible values are the members of <br> the
   * following AMT reference sets:<br>  929360061000036106 Medicinal product reference set<br> 
   * 929360081000036101 Medicinal product pack reference set<br>  929360021000036102 Trade product
   * reference set<br>  929360041000036105 Trade product pack reference set
   * @param actionDateTime The point in time at which the Medication Action is completed.
   * @param sequenceNumber optional - The sequence number specific to the action being recorded
   */
  public ImmunisationImpl(AMTv3Code theraputicGood, PreciseDate actionDateTime,
      Integer sequenceNumber) {
    ArgumentUtils.checkNotNull(theraputicGood, "theraputicGood");
    ArgumentUtils.checkNotNull(actionDateTime, "actionDateTime");
    this.theraputicGood = theraputicGood;
    this.actionDateTime = actionDateTime;
    this.sequenceNumber = sequenceNumber;
  }

  /**
   * Constructor to be used for Event Summary - sequence number is specified in event summary
   *
   * @param theraputicGood
   * @param actionDateTime
   */
  public ImmunisationImpl(Coded theraputicGood,
      PreciseDate actionDateTime) {
    ArgumentUtils.checkNotNull(theraputicGood, "theraputicGood");
    ArgumentUtils.checkNotNull(actionDateTime, "actionDateTime");
    this.theraputicGood = theraputicGood;
    this.actionDateTime = actionDateTime;
  }

  /**
   * The vaccine which was the focus of the action.
   */
  @Override
  public Coded getTheraputicGood() {
    return theraputicGood;
  }

  /**
   * optional The sequence number specific to the action being recorded
   */
  @Override
  public Integer getSequenceNumber() {
    return sequenceNumber;
  }

  /**
   * The point in time at which the Medication Action is completed.
   */
  @Override
  public PreciseDate getMedicationActionDateTime() {
    return actionDateTime;
  }

  /**
   * Random UUID if not explicitly set
   *
   *
   * This is a technical identifier that is used for system purposes such as matching. If a suitable
   * internal key is not available, a UUID may be used.
   */
  @Override
  public UniqueIdentifier getID() {
    return id;
  }

  /**
   * UUID
   *
   * This is a technical identifier that is used for system purposes such as matching. If a suitable
   * internal key is not available, a UUID may be used.
   */
  public void setID(UniqueIdentifier id) {
    this.id = id;
  }

}

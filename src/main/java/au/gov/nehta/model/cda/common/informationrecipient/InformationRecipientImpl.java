package au.gov.nehta.model.cda.common.informationrecipient;

import au.gov.nehta.model.cda.common.id.IntendedRecipient;

public class InformationRecipientImpl implements InformationRecipient {

  private IntendedRecipient intendedRecipient;

  private InformationRecipientImpl(IntendedRecipient intendedRecipient) {
    this.intendedRecipient = intendedRecipient;
  }

  public static InformationRecipient getInstance(IntendedRecipient intendedRecipient) {
    return new InformationRecipientImpl(intendedRecipient);
  }

  @Override
  public IntendedRecipient getIntendedRecipient() {
    return intendedRecipient;
  }
}

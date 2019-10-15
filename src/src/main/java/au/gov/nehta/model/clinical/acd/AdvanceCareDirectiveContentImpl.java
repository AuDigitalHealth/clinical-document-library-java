package au.gov.nehta.model.clinical.acd;

import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import java.util.List;

public class AdvanceCareDirectiveContentImpl implements AdvanceCareDirectiveContent {

  private List<ParticipationServiceProvider> acdCustodians;

  @Override
  public List<ParticipationServiceProvider> getACDCustodians() {
    return acdCustodians;
  }

  @Override
  public void setACDCustodians(List<ParticipationServiceProvider> acdCustodians) {
    this.acdCustodians = acdCustodians;
  }
}

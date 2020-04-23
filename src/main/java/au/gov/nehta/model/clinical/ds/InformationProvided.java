package au.gov.nehta.model.clinical.ds;

public class InformationProvided {

  private String infoProvidedToSubOfCareOrRelParties;

  public InformationProvided() {
  }

  public InformationProvided(String infoProvidedToSubOfCareOrRelParties) {
    this.infoProvidedToSubOfCareOrRelParties = infoProvidedToSubOfCareOrRelParties;
  }

  public String getInfoProvidedToSubOfCareOrRelParties() {
    return infoProvidedToSubOfCareOrRelParties;
  }

  public void setInfoProvidedToSubOfCareOrRelParties(String infoProvidedToSubOfCareOrRelParties) {
    this.infoProvidedToSubOfCareOrRelParties = infoProvidedToSubOfCareOrRelParties;
  }
}

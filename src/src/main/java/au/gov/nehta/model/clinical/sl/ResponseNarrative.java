package au.gov.nehta.model.clinical.sl;

public class ResponseNarrative {
  private String narrative;


  public ResponseNarrative() {
  }

  public ResponseNarrative(String narrative) {
    this.narrative = narrative;
  }

  public String getNarrative() {
    return narrative;
  }

  public void setNarrative(String narrative) {
    this.narrative = narrative;
  }
}

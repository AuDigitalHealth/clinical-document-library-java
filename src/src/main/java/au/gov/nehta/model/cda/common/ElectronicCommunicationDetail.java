package au.gov.nehta.model.cda.common;

public class ElectronicCommunicationDetail {
  private String address;
  private ElectronicCommunicationMedium medium;
  private ElectronicCommunicationUsage usage;

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public ElectronicCommunicationMedium getMedium() {
    return medium;
  }

  public void setMedium(ElectronicCommunicationMedium medium) {
    this.medium = medium;
  }

  public ElectronicCommunicationUsage getUsage() {
    return usage;
  }

  public void setUsage(ElectronicCommunicationUsage usage) {
    this.usage = usage;
  }
}

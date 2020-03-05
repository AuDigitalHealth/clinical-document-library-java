package au.gov.nehta.model.cda.common;

public enum ElectronicCommunicationUsage {
  UNDEFINED(null, null), // TODO-Confirm defaults
  HOME("H", "Home"),
  PRIMARY_HOME("HP", "Primary Home"),
  VACATION_HOME("HV", "Vacation Home"),
  WORKPLACE("WP", "Work Place"),
  ANSWERING_SERVICE("AS", "Answering Service"),
  EMERGENCY_CONTACT("EC", "Emergency Contact"),
  MOBILE_CONTACT("MC", "Mobile Contact"),
  PAGER("PG", "Pager");

  private String code;
  private String name;

  public String getCode() {
    return code;
  }

  public String getName() {
    return name;
  }

  ElectronicCommunicationUsage(String code, String name) {
    this.code = code;
    this.name = name;
  }
}

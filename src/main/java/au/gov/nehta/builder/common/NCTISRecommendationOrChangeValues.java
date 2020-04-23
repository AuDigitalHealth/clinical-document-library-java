package au.gov.nehta.builder.common;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;

public enum NCTISRecommendationOrChangeValues {
  RECOMMENDATION_TO_MAKE_CHANGE(new CodeImpl("01", "1.2.36.1.2001.1001.101.104.16594",
      "NCTIS Recommendation or Change Values", "A recommendation to make the change.")),
  CHANGE_HAS_BEEN_MADE(new CodeImpl("02", "1.2.36.1.2001.1001.101.104.16594",
      "NCTIS Recommendation or Change Values", "The change has been made."));
  private Code codeValue;

  NCTISRecommendationOrChangeValues(Code codeValue) {
    this.codeValue = codeValue;
  }

  public Code getCodeValue() {
    return codeValue;
  }
}

package au.gov.nehta.builder.common;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;

public enum NCTISChanceTypeValues {
  UNCHANGED(new CodeImpl("01", "1.2.36.1.2001.1001.101.104.16592", "NCTIS Change Type Values",
      "Unchanged")),
  CHANGED(new CodeImpl("02", "1.2.36.1.2001.1001.101.104.16592", "NCTIS Change Type Values",
      "Changed")),
  CANCELLED(new CodeImpl("03", "1.2.36.1.2001.1001.101.104.16592", "NCTIS Change Type Values",
      "Cancelled")),
  PRESCRIBED(new CodeImpl("04", "1.2.36.1.2001.1001.101.104.16592", "NCTIS Change Type Values",
      "Prescribed")),
  CEASED(
      new CodeImpl("05", "1.2.36.1.2001.1001.101.104.16592", "NCTIS Change Type Values", "Ceased")),
  SUSPENDED(new CodeImpl("06", "1.2.36.1.2001.1001.101.104.16592", "NCTIS Change Type Values",
      "Suspended"));

  private Code codeValue;

  NCTISChanceTypeValues(Code codeValue) {
    this.codeValue = codeValue;
  }

  public Code getCodeValue() {
    return codeValue;
  }

}

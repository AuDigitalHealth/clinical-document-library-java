package au.gov.nehta.model.cda.common.code;

public class AMTv3Code extends CodeImpl implements Code {

  public static final String CODE_SYSTEM = "2.16.840.1.113883.6.96";
  public static final String CODE_SYSTEM_NAME = "Australian Medicines Terminology";

  /**
   * Creates an AMT version 3 based Code element.<br>
   *
   * Example:
   * <pre>
   * Code amt = new AMTV3Code("23641011000036102","paracetamol 500 mg + codeine phosphate 30 mg tablet");
   * <pre>
   *
   * will produce the following Hl7 element
   *
   * <code code="23641011000036102" codeSystem="1.2.36.1.2001.1004.100" codeSystemName="Australian Medicines Terminology (AMT)" displayName="paracetamol 500 mg + codeine phosphate 30 mg tablet">
   *
   * &lt;code code="23641011000036102"
   *  codeSystem="1.2.36.1.2001.1004.100"
   *  codeSystemName="Australian Medicines Terminology (AMT)"
   *  displayName="paracetamol 500 mg + codeine phosphate 30 mg tablet"&gt;
   */
  public AMTv3Code(String code, String displayName) {
    super(code);
    setCodeSystem(CODE_SYSTEM);
    setCodeSystemName(CODE_SYSTEM_NAME);
    setDisplayName(displayName);
  }
}

package au.gov.nehta.model.cda.common.code;


/**
 * AMTv2 has been deprecated in favour of AMTv3 which brings the Australian Medicines Terminology to
 * be a part of the SNOMED-CT AU terminology release. For more information see
 * https://www.healthterminologies.gov.au
 *
 * Use {@link AMTv3Code}
 */
@Deprecated
public class AMTCode extends CodeImpl implements Code {

  public static final String CODE_SYSTEM = "1.2.36.1.2001.1004.100";
  public static final String CODE_SYSTEM_NAME = "Australian Medicines Terminology (AMT)";

  /**
   * Creates an AMT based Code element.<br>
   *
   * Example:
   * <pre>
   * Code amt = new AMTCode("23641011000036102","paracetamol 500 mg + codeine phosphate 30 mg tablet");
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
  public AMTCode(String code, String displayName) {
    super(code);
    setCodeSystem(CODE_SYSTEM);
    setCodeSystemName(CODE_SYSTEM_NAME);
    setDisplayName(displayName);
  }
}

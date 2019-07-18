package au.gov.nehta.model.cda.common.code;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class CodeImpl implements Code {

  private String code;
  private String codeSystem;
  private String codeSystemName;
  private String displayName;
  private String originalText;
  private String version;
  private List<Code> translations = new ArrayList<>(3);

  /**
   * Use this constructor if only the original text is available and no other attributes such as
   * code, codeSystem and codeSystemName
   */
  public CodeImpl(String code) {
    this.code = code;
  }

  public CodeImpl(String code, String codeSystem, String codeSystemName, String displayName) {
    this.code = code;
    this.codeSystem = codeSystem;
    this.codeSystemName = codeSystemName;
    this.displayName = displayName;
  }

  public CodeImpl(String code, String codeSystem, String codeSystemName, String displayName,
      String originalText) {
    this.code = code;
    this.codeSystem = codeSystem;
    this.codeSystemName = codeSystemName;
    this.displayName = displayName;
    this.originalText = originalText;
  }

  public CodeImpl() {
  }

  /**
   * shorthand for creating a code with original text
   *
   * @param s the original text
   * @return a valid code
   */
  public static CodeImpl fromOriginalText(String s) {
    CodeImpl i = new CodeImpl();
    i.setOriginalText(s);
    return i;
  }

  @Override
  public String getCode() {
    return code;
  }

  @Override
  public void setCode(String code) {
    this.code = code;
  }

  @Override
  public String getCodeSystem() {
    return codeSystem;
  }

  @Override
  public void setCodeSystem(String codeSystem) {
    this.codeSystem = codeSystem;
  }

  @Override
  public String getCodeSystemName() {
    return codeSystemName;
  }

  @Override
  public void setCodeSystemName(String codeSystemName) {
    this.codeSystemName = codeSystemName;
  }

  @Override
  public String getCodeSystemVersion() {
    return version;
  }

  @Override
  public void setCodeSystemVersion(String version) {
    this.version = version;
  }

  @Override
  public String getDisplayName() {
    return displayName;
  }

  @Override
  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  @Override
  public String getOriginalText() {
    return originalText;
  }

  @Override
  public void setOriginalText(String originalText) {
    this.originalText = originalText;
  }

  @Override
  public boolean isCoded() {
    return null != code;
  }

  @Override
  public List<Code> getTranslations() {
    return translations;
  }

  @Override
  public void addTranslation(Code code) {
    translations.add(code);
  }

  /**
   * @return a new Code with the same values, instead of a reference to this code.
   * <p>This amounts to a shallow copy. Translation references are/remain copied references.
   */
  public Code copy() {
    Code that = new CodeImpl();
    that.setCode(this.code);
    that.setCodeSystem(this.codeSystem);
    that.setCodeSystemName(this.codeSystemName);
    that.setCodeSystemVersion(this.version);
    that.setDisplayName(this.displayName);
    that.setOriginalText(this.originalText);

    for (Code translation : this.translations) {
      that.addTranslation(translation);
    }

    return that;
  }

  @Override
  public String toString() {
    return new StringJoiner(", ", CodeImpl.class.getSimpleName() + "[", "]")
        .add("code='" + code + "'")
        .add("codeSystem='" + codeSystem + "'")
        .add("codeSystemName='" + codeSystemName + "'")
        .add("displayName='" + displayName + "'")
        .add("originalText='" + originalText + "'")
        .add("version='" + version + "'")
        .add("translations=" + translations)
        .toString();
  }
}

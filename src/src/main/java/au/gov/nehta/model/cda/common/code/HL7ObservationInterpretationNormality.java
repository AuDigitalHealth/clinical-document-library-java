package au.gov.nehta.model.cda.common.code;

/*
 * Copyright 2013 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */


/* HL7 Observation Interpretation Normality*/
public enum HL7ObservationInterpretationNormality {

  /// Undefined, this is the default value if the enum is left unset.
  /// 
  /// The validation engine uses this to test and assert that the enum has been set (if required)
  /// and is therefore valid.

  Undefined(null, null),

  /// Abnormal

  Abnormal("Abnormal", "A"),

  /// Abnormal Alert

  AbnormalAlert("Abnormal alert", "AA"),

  /// High Alert

  HighAlert("High alert", "HH"),

  /// Low Alert

  LowAlert("Low alert", "LL"),

  /// High

  High("High", "H"),

  /// Low

  Low("Low", "L"),


  /// Normal
  Normal("Normal", "N");

  private String code;
  private String name;
    private String codeSystem;
    private String codeSystemName;

  HL7ObservationInterpretationNormality(String name, String code) {
    this.code = code;
    this.name = name;
      this.codeSystem = "2.16.840.1.113883.5.83";
      this.codeSystemName = "HL7 ObservationInterpretationNormality";
  }

  public String getCode() {
    return code;
  }

  public String getName() {
    return name;
  }

  public Coded getAsCoded() {
      return new CodeImpl(code, codeSystem, codeSystemName, name);
  }
}



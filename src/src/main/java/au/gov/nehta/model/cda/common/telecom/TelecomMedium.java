/*
 * Copyright 2011 NEHTA
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

package au.gov.nehta.model.cda.common.telecom;

import au.gov.nehta.model.clinical.common.types.EnumTuple;

public enum TelecomMedium implements EnumTuple {
  TELEPHONE("Telephone (excluding mobile telephone)", "1"),
  MOBILE("Mobile (cellular) telephone", "2"),
  FAX("Facsimile machine", "3"),
  PAGE("Pager", "4"),
  EMAIL("Email", "5"),
  URL("URL", "6"),
  OTHER("Other", "8");

  private final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.10270";
  private final String CODE_SYSTEM_NAME =
      "AS 5017 (2006) - Healthcare Client Identification: Electronic Communication Medium; AS 4846 (2006) - Healthcare Provider Identification: Electronic Communication Medium";
  private final String CODE_SYSTEM_VERSION = "2006";
  private final String descriptor;
  private final String code;

  TelecomMedium(String descriptor, String code) {
    this.descriptor = descriptor;
    this.code = code;
  }

  public String getDescriptor() {
    return descriptor;
  }

  public String getCode() {
    return code;
  }

  public String getOriginalText() {
    return descriptor;
  }

  public String getCodeSystem() {
    return CODE_SYSTEM;
  }

  public String getCodeSystemName() {
    return CODE_SYSTEM_NAME;
  }

  public String getCodeSystemVersion() {
    return CODE_SYSTEM_VERSION;
  }

  public String getDisplayName() {
    return descriptor;
  }

  public boolean hasDisplayName() {
    return true;
  }
}

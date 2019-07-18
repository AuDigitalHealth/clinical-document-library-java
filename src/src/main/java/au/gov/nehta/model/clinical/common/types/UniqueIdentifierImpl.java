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

package au.gov.nehta.model.clinical.common.types;

import au.gov.nehta.model.cda.common.HL7Nullable;
import java.util.StringJoiner;
import java.util.UUID;

public class UniqueIdentifierImpl extends HL7Nullable implements UniqueIdentifier {

  protected String root;
  protected String extension;
  protected String assigningAuthorityName;
  protected String assigningGeographicArea;
  private Boolean displayable;


  public UniqueIdentifierImpl() {
  }

  public UniqueIdentifierImpl(String root) {
    setRoot(root);
  }

  public UniqueIdentifierImpl(String root, String extension) {
    setRoot(root);
    setExtension(extension);
  }

  public UniqueIdentifierImpl(String root, String extension, String assigningAuthorityName) {
    setRoot(root);
    setExtension(extension);
    setAssigningAuthorityName(assigningAuthorityName);
  }

  public UniqueIdentifierImpl(String root, String extension, String assigningAuthorityName,
      String assigningGeographicArea) {
    setRoot(root);
    setExtension(extension);
    setAssigningAuthorityName(assigningAuthorityName);
    setAssigningGeographicArea(assigningGeographicArea);
  }

  /**
   * example:   <id root="93d195dd-25d1-4b9c-a7be-6c44632d96d0"/>
   *
   * @return a random UUID as the root
   */
  public static UniqueIdentifierImpl random() {
    return new UniqueIdentifierImpl(UUID.randomUUID().toString());
  }

  public static UniqueIdentifier createSimpleIdentifier(String root, String extension) {
    UniqueIdentifierImpl u = new UniqueIdentifierImpl();
    u.setRoot(root);
    u.setExtension(extension);
    return u;
  }

  @Override
  public String getAssigningGeographicArea() {
    return assigningGeographicArea;
  }

  public void setAssigningGeographicArea(String assigningGeographicArea) {
    this.assigningGeographicArea = assigningGeographicArea;
  }

  @Override
  public String getRoot() {
    return this.root;
  }

  public void setRoot(String root) {
    this.root = root;
  }

  @Override
  public String getExtension() {
    return this.extension;
  }

  public void setExtension(String extension) {
    this.extension = extension;
  }

  public boolean hasRoot() {
    return this.root != null;
  }

  public boolean hasExtension() {
    return this.extension != null;
  }

  @Override
  public String getAssigningAuthorityName() {
    return assigningAuthorityName;
  }

  public void setAssigningAuthorityName(String assigningAuthorityName) {
    this.assigningAuthorityName = assigningAuthorityName;
  }

  @Override
  public Boolean getDisplayable() {
    return displayable;
  }

  /**
   * @param displayable the displayable to set
   */
  public void setDisplayable(Boolean displayable) {
    this.displayable = displayable;
  }

  @Override
  public String toString() {
    return new StringJoiner(", ", UniqueIdentifierImpl.class.getSimpleName() + "[", "]")
        .add("root='" + root + "'")
        .add("extension='" + extension + "'")
        .add("assigningAuthorityName='" + assigningAuthorityName + "'")
        .add("assigningGeographicArea='" + assigningGeographicArea + "'")
        .add("displayable=" + displayable)
        .toString();
  }
}

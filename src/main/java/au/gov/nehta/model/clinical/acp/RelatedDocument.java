package au.gov.nehta.model.clinical.acp;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public class RelatedDocument {

  private AttachedMedia documentTarget;
  private DocumentDetails documentDetails;

  public AttachedMedia getDocumentTarget() {
    return documentTarget;
  }

  public void setDocumentTarget(AttachedMedia documentTarget) {
    this.documentTarget = documentTarget;
  }

  public DocumentDetails getDocumentDetails() {
    return documentDetails;
  }

  public void setDocumentDetails(DocumentDetails documentDetails) {
    this.documentDetails = documentDetails;
  }
}

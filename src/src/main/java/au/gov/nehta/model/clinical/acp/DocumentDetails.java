package au.gov.nehta.model.clinical.acp;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public class DocumentDetails {

  private DocumentAuthor documentAuthor;
  private String documentTitle;
  private UniqueIdentifier documentIdentifier;
  private Coded documentType;

  public DocumentAuthor getDocumentAuthor() {
    return documentAuthor;
  }

  public void setDocumentAuthor(DocumentAuthor documentAuthor) {
    this.documentAuthor = documentAuthor;
  }

  public UniqueIdentifier getDocumentIdentifier() {
    return documentIdentifier;
  }

  public void setDocumentIdentifier(
      UniqueIdentifier documentIdentifier) {
    this.documentIdentifier = documentIdentifier;
  }

  public String getDocumentTitle() {
    return documentTitle;
  }

  public void setDocumentTitle(String documentTitle) {
    this.documentTitle = documentTitle;
  }


  public Coded getDocumentType() {
    return documentType;
  }

  public void setDocumentType(Coded documentType) {
    this.documentType = documentType;
  }
}

package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public interface RelatedDocument {

  Coded getLinkNature();

  void setLinkNature(Coded linkNature);

  AttachedMedia getDocumentTarget();

  void setDocumentTarget(AttachedMedia documentTarget);

  DocumentDetail getDocumentDetail();

  void setDocumentDetail(DocumentDetail documentDetail);
}

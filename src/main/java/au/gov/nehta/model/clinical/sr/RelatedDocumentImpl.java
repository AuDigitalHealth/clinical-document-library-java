package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public class RelatedDocumentImpl implements RelatedDocument {

    private Coded linkNature;
    private AttachedMedia documentTarget;
    private DocumentDetail documentDetail;

    @Override
    public Coded getLinkNature() {
        return linkNature;
    }

    @Override
    public void setLinkNature(Coded linkNature) {
        this.linkNature = linkNature;
    }

    @Override
    public AttachedMedia getDocumentTarget() {
        return documentTarget;
    }

    @Override
    public void setDocumentTarget(AttachedMedia documentTarget) {
        this.documentTarget = documentTarget;
    }

    @Override
    public DocumentDetail getDocumentDetail() {
        return documentDetail;
    }

    @Override
    public void setDocumentDetail(DocumentDetail documentDetail) {
        this.documentDetail = documentDetail;
    }
}

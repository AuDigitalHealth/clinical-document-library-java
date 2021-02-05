package au.gov.nehta.model.clinical.acp;

public class AdvanceCareInformationSectionImpl implements AdvanceCareInformationSection {

    private RelatedDocument relatedDocument;

    @Override
    public RelatedDocument getRelatedDocument() {
        return relatedDocument;
    }

    @Override
    public void setRelatedDocument(RelatedDocument relatedDocument) {
        this.relatedDocument = relatedDocument;
    }
}

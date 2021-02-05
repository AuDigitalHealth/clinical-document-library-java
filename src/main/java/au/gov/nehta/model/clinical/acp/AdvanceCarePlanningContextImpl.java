package au.gov.nehta.model.clinical.acp;

import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public class AdvanceCarePlanningContextImpl implements AdvanceCarePlanningContext {

    private DocumentAuthor documentAuthor;
    private String documentTitle;
    private SubjectOfCareParticipant subjectOfCare;

    @Override
    public DocumentAuthor getDocumentAuthor() {
        return documentAuthor;
    }

    @Override
    public void setDocumentAuthor(DocumentAuthor documentAuthor) {
        this.documentAuthor = documentAuthor;
    }

    @Override
    public SubjectOfCareParticipant getSubjectOfCare() {
        return subjectOfCare;
    }

    @Override
    public void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare) {
        this.subjectOfCare = subjectOfCare;
    }

    @Override
    public String getDocumentTitle() {
        return documentTitle;
    }

    @Override
    public void setDocumentTitle(String documentTitle) {
        this.documentTitle = documentTitle;
    }
}

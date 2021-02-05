package au.gov.nehta.model.clinical.acp;

import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public interface AdvanceCarePlanningContext {

    DocumentAuthor getDocumentAuthor();

    void setDocumentAuthor(DocumentAuthor documentAuthor);

    SubjectOfCareParticipant getSubjectOfCare();

    void setSubjectOfCare(SubjectOfCareParticipant subjectOfCare);

    String getDocumentTitle();

    void setDocumentTitle(String documentTitle);
}

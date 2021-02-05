package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;

public class SharedHealthSummaryContextImpl implements SharedHealthSummaryContext {

    private SharedHealthSummaryAuthor author;
    private SubjectOfCareParticipant subjectOfCare;

    public SharedHealthSummaryContextImpl(SubjectOfCareParticipant subjectOfCare, SharedHealthSummaryAuthor author) {

        ArgumentUtils.checkNotNull(subjectOfCare, "subjectOfCare");
        ArgumentUtils.checkNotNull(author, "author");

        this.author = author;
        this.subjectOfCare = subjectOfCare;
    }

    @Override
    public SubjectOfCareParticipant getSubjectOfCare() {
        return subjectOfCare;
    }

    @Override
    public SharedHealthSummaryAuthor getDocumentAuthor() {
        return author;
    }
}

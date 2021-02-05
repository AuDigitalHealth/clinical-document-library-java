package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.time.ZonedDateTime;
import java.util.UUID;

public class AuthoriserParticipantImpl implements AuthoriserParticipant {

    private AuthorParticipant participant;
    private ZonedDateTime editingEndTime;
    private String id = UUID.randomUUID().toString();

    public AuthoriserParticipantImpl(AuthorParticipant participant, ZonedDateTime editingEndTime) {
        this.participant = participant;
        this.editingEndTime = editingEndTime;
    }

    @Override
    public AuthorParticipant getParticipant() {
        return participant;
    }

    @Override
    public ZonedDateTime getEditingEndTime() {
        return editingEndTime;
    }

    @Override
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}

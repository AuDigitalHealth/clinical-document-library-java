package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.util.UUID;

import org.joda.time.DateTime;

public class AuthoriserParticipantImpl implements AuthoriserParticipant {

    private AuthorParticipant participant;
    private DateTime editingEndTime;
    private String id = UUID.randomUUID().toString();
    
    public AuthoriserParticipantImpl(AuthorParticipant participant,  DateTime editingEndTime){
        this.participant=participant;
        this.editingEndTime=editingEndTime;
    }
    
    @Override
    public AuthorParticipant getParticipant() {
        return participant;
    }

    
    @Override
    public DateTime getEditingEndTime() {
        return editingEndTime;
    }

    @Override
    public String getId() {
        return id ;
    }
    
    public void setId(String id) {
         this.id=id ;
    }

}

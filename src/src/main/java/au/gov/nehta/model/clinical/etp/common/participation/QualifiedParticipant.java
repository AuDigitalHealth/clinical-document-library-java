package au.gov.nehta.model.clinical.etp.common.participation;


public interface QualifiedParticipant extends Participant{
    public String getQualifications();
    public void setQualifications( String qualifications );
    

	public String getAssignedAuthorId();
	public void setAssignedAuthorId(String id);
}

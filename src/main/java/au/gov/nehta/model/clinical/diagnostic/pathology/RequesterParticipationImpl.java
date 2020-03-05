package au.gov.nehta.model.clinical.diagnostic.pathology;

import org.joda.time.DateTime;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.Role;

public class RequesterParticipationImpl implements RequesterParticipation {
	private Role role;
	private RequesterParticipant participant;
	private DateTime endTime;
	

	/**
     * 
     * @param role
     *            The involvement or role of the participant in the related action from a
     *            healthcare perspective rather than the specific participation
     *            perspective.
     * 
     * @param participant Details pertinent to the identification of an individual or organisation or device that has participated in a healthcare event/encounter/clinical interaction.
     * 
     * @param endOfParticipationPeriod
     *  The time interval during which the participation in the health care event occurred
     *  The end of the participation period of a [EntitledParticipant] participation is the time associated with the completion of editing the content
     */
	public RequesterParticipationImpl( Role role, RequesterParticipant participant, DateTime endOfParticipationPeriod ) {
		ArgumentUtils.checkNotNull( role, "role" );
		ArgumentUtils.checkNotNull( participant, "participant" );
		this.role = role;
		this.participant = participant;
		this.endTime=endOfParticipationPeriod;
	}
	
	@Override
	public Role getRole() {
		return role;
	}
	
	@Override
	public RequesterParticipant getParticipant() {
		return participant;
	}

    @Override
    public DateTime getParticipationEndTime() {
        return endTime;
    }
}

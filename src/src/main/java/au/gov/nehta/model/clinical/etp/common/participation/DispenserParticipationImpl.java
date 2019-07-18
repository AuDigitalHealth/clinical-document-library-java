package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.common.participation.Role;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;

/**
 * Combines a participant and their role.
 * @author NeHTA
 *
 */
public class DispenserParticipationImpl implements DispenserParticipation {
	private Role role;
	private DispenserParticipant participant;
	
	public static final Role PHARMACIST = new RoleImpl(pharmaCode());
	
    /**
     * creates a new DispenserParticipation impl with a default role of DispenserParticipationImpl.PHARMACIST
     * the role code may be overriden via the setRole() method.
     * 
     * @param participant DispenserParticipant
     */
	public DispenserParticipationImpl( DispenserParticipant participant ) {
		ArgumentUtils.checkNotNull( participant, "participant" );
		this.role = PHARMACIST;
		this.participant = participant;
	}

	public Role getRole() {
		return role;
	}
	
	public void setRole(Role role) {
        this.role=role;
    }

	public DispenserParticipant getParticipant() {
		return participant;
	}
	
	private static final Coded pharmaCode(){
	    return ANZSCO_1ED_2006.PHARMACISTS;
	}
}

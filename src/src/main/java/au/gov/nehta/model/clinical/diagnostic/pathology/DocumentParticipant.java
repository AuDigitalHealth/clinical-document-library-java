package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.clinical.common.participation.Role;


public interface DocumentParticipant {
	public AuthorParticipant getParticipant();
    public Role getRole();
}

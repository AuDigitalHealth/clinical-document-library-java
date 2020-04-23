package au.gov.nehta.model.cda.common.id;

import org.joda.time.DateTime;


public class LegalAuthenticatorImpl implements LegalAuthenticator {
	private DateTime authenticationTime;
	private AssignedEntity assignedEntity;

	private LegalAuthenticatorImpl( DateTime authenticationTime, AssignedEntity assignedEntity ) {
		this.authenticationTime = authenticationTime;
		this.assignedEntity = assignedEntity;
	}

	public static LegalAuthenticator getInstance( DateTime authenticationTime, AssignedEntity assignedEntity ) {

		return new LegalAuthenticatorImpl(authenticationTime, assignedEntity);
	}

	public DateTime getAuthenticationTime() {
		return authenticationTime; 
	}

	public AssignedEntity getAssignedEntity() {
		return assignedEntity;
	}
}

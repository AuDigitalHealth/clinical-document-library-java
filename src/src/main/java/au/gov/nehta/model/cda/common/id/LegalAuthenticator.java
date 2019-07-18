package au.gov.nehta.model.cda.common.id;

import org.joda.time.DateTime;


public interface LegalAuthenticator {
    DateTime getAuthenticationTime();

	AssignedEntity getAssignedEntity();
}

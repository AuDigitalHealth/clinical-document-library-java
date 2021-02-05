package au.gov.nehta.model.cda.common.id;

import java.time.ZonedDateTime;


public interface LegalAuthenticator {
    ZonedDateTime getAuthenticationTime();

    AssignedEntity getAssignedEntity();
}

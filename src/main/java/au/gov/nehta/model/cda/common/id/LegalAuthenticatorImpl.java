package au.gov.nehta.model.cda.common.id;

import java.time.ZonedDateTime;

public class LegalAuthenticatorImpl implements LegalAuthenticator {
    private ZonedDateTime authenticationTime;
    private AssignedEntity assignedEntity;

    private LegalAuthenticatorImpl(ZonedDateTime authenticationTime, AssignedEntity assignedEntity) {
        this.authenticationTime = authenticationTime;
        this.assignedEntity = assignedEntity;
    }

    public static LegalAuthenticator getInstance(ZonedDateTime authenticationTime, AssignedEntity assignedEntity) {

        return new LegalAuthenticatorImpl(authenticationTime, assignedEntity);
    }

    public ZonedDateTime getAuthenticationTime() {
        return authenticationTime;
    }

    public AssignedEntity getAssignedEntity() {
        return assignedEntity;
    }
}

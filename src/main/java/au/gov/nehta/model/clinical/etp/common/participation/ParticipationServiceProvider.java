package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;

public interface ParticipationServiceProvider {

    RestrictedTimeInterval getParticipationPeriod();

    Coded getRole();

    void setRole(Coded role);

    // This is IServiceProvider Participant in .net
    ServiceProvider getParticipant();

    void setParticipant(ServiceProvider participant);

    void setParticipationPeriod(RestrictedTimeInterval participationPeriod);
}

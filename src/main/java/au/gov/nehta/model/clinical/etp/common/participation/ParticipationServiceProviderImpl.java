package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;

public class ParticipationServiceProviderImpl implements ParticipationServiceProvider {

    private Coded role;
    private ServiceProvider participant;
  private RestrictedTimeInterval participationPeriod;

    @Override
    public RestrictedTimeInterval getParticipationPeriod() {
      return participationPeriod;
    }

    @Override
    public Coded getRole() {
        return role;
    }

    @Override
    public void setRole(Coded role) {
        this.role = role;
    }

    @Override
    public ServiceProvider getParticipant() {
        return participant;
    }

    @Override
    public void setParticipationPeriod(RestrictedTimeInterval participationPeriod) {
      this.participationPeriod = participationPeriod;
    }

    @Override
    public void setParticipant(ServiceProvider participant) {
        this.participant = participant;
    }
}

package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.List;

public interface EntitledParticipant extends Participant {
  
    public List<Entitlement> getEntitlement();

    public void addEntitlement(Entitlement entitlement);

    public void setEntitlement(List<Entitlement> entitlement);
}

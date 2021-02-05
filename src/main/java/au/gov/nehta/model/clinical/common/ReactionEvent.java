package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.code.Coded;

import java.util.List;

public interface ReactionEvent {

    List<Coded> getManifestations();

    void setManifestations(List<Coded> manifestations);

    Coded getReactionType();

    void setReactionType(Coded reactionType);
}

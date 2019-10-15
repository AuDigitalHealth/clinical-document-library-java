package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

import java.util.List;

//TODO Common Package
public interface ReactionEvent {

    List<Coded> getManifestations();

    void setManifestations(List<Coded> manifestations);

    Coded getReactionType();

    void setReactionType(Coded reactionType);

    //TODO Requires Validation
}

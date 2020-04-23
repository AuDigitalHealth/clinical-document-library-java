package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;
import java.util.StringJoiner;

public class ReactionEventImpl implements ReactionEvent {
    private List<Coded> manifestations;
    private Coded reactionType;

    @Override
    public List<Coded> getManifestations() {
        return manifestations;
    }

    @Override
    public void setManifestations(List<Coded> manifestations) {
        this.manifestations = manifestations;
    }

    @Override
    public Coded getReactionType() {
        return reactionType;
    }

    @Override
    public void setReactionType(Coded reactionType) {
        this.reactionType = reactionType;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", ReactionEventImpl.class.getSimpleName() + "[", "]")
            .add("manifestations=" + manifestations)
            .add("reactionType=" + reactionType)
            .toString();
    }
}

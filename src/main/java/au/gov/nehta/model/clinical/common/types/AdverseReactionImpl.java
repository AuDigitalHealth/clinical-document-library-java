package au.gov.nehta.model.clinical.common.types;

import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;

/**
 * Information about adverse reactions and/or propensity to adverse reaction of
 * the patient (including allergies and intolerances), and any relevant reaction
 * details.
 */
public class AdverseReactionImpl implements AdverseReaction {

    private List<? extends Manifestation> mfsts;
    private Coded agent;
    private UniqueIdentifier id = UniqueIdentifierImpl.random();

    /**
     * @param manifestations - Clinical manifestation of the adverse reaction expressed as a single
     *                       word, phrase or brief description. VOCAB is SNOMED CT AU codes.
     * @param substanceAgent - Identification of a substance, agent, or a class of substance, that is
     *                       considered to be responsible for the adverse reaction.
     */
    public AdverseReactionImpl(Coded substanceAgent, List<? extends Manifestation> manifestations) {
        this.mfsts = manifestations;
        this.agent = substanceAgent;
    }

    /**
     * Identification of a substance, agent, or a class of substance, that is
     * considered to be responsible for the adverse reaction.
     */
    @Override
    public Coded getSubstanceAgent() {
        return agent;
    }

    /**
     * Details about each adverse reaction event.
     * <p>
     * Clinical manifestation of the adverse reaction expressed as a single
     * word, phrase or brief description
     * <p>
     * These should be SNOMED CT-AU Clinical Manifestation Values
     */
    @Override
    public List<? extends Manifestation> getManifestations() {
        return mfsts;
    }

    /**
     * This is a technical identifier that is used for system purposes such as
     * matching. If a suitable internal key is not available, a UUID may be
     * used.
     * <p>
     * <p>
     * Random UUID if not explicitly set
     */
    @Override
    public UniqueIdentifier getID() {
        return id;
    }

    public void setID(UniqueIdentifier id) {
        this.id = id;
    }
}

package au.gov.nehta.model.clinical.common.types;

import au.gov.nehta.model.cda.common.code.Coded;

/**
 * Presentation or exhibition of signs and symptoms of the adverse reaction expressed as a single
 * word, phrase or brief description.
 * <p>
 * Code should be in the vocab of SNOMED CT-AU 142341000036103 |Clinical manifestation reference
 * set| 32570071000036102 |Clinical finding foundation reference set|
 */
public class ManifestationImpl implements Manifestation {

    private UniqueIdentifier id = UniqueIdentifierImpl.random();
    private Coded code;

    public ManifestationImpl(Coded code) {
        this.code = code;
    }

    @Override
    public Coded getCode() {
        return code;
    }

    /**
     * Defaulted as a Random UUID unless explicitly set
     */
    @Override
    public UniqueIdentifier getID() {
        return id;
    }

    public void setID(UniqueIdentifier id) {
        this.id = id;
    }
}

package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * Information pertaining to one or more therapeutic goods that is represented
 * to achieve, or is likely to achieve, its principal intended action by
 * pharmacological, chemical, immunological or metabolic means in or on the body
 * of a human.
 */
public interface KnownMedication {

    /**
     * The medicine or other therapeutic good being 1..1 ordered, administered
     * to or used by the subject of care.
     * <p>
     * Should be an AMT code
     */
    Coded getMedicine();

    /**
     * A complete narrative description of how much, when and how to use the
     * medicine, vaccine or other therapeutic good.
     */
    String getDirections();

    /**
     * Optional.
     * A reason for ordering the medicine, vaccine or other therapeutic good.
     */
    String getClinicalIndication();

    /**
     * Optional.
     * Any additional information that may be needed to ensure the continuity of
     * supply, rationale for current dose and timing, or safe and appropriate
     * use.
     */
    String getComment();

    /**
     * This is a technical identifier that is used for system purposes such as
     * matching. If a suitable internal key is not available, a UUID may be
     * used.
     */
    UniqueIdentifier getID();
}

package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * The act of administering a dose of a vaccine to a person for the purpose
 * of preventing or minimising the effects of a disease by producing
 * immunity and/or to counter the effects of an infectious organism or
 * insult.
 */
public interface Immunisation {

    /**
     * The vaccine which was the focus of the action.
     */
    Coded getTheraputicGood();

    /**
     * The sequence number specific to the action being recorded
     */
    Integer getSequenceNumber();

    /**
     * The point in time at which the Medication Action is completed.
     */
    PreciseDate getMedicationActionDateTime();

    /**
     * This is a technical identifier that is used for system purposes such as
     * matching. If a suitable internal key is not available, a UUID may be
     * used.
     */
    UniqueIdentifier getID();
}

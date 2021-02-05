package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

/**
 * A medical history entry which cannot be categorised into one of the
 * categories such as Procedure and Problem/Diagnosis.
 */
public class OtherMedicalHistoryItemImpl implements OtherMedicalHistoryItem {

    private UniqueIdentifier id = UniqueIdentifierImpl.random();
    private String description;
    private RestrictedTimeInterval timeInterval;
    private String comment;

    /**
     * @param description
     *            A description of the problem, diagnosis, intervention or other
     *            medical history item.
     * 
     * @param timeInterval optional
     * The date range during which the item applied or occurred.
     * 
     * @param comment optional 
     * Free text comments providing additional information relevant to the item
     * in question.
     * 
     */
    public OtherMedicalHistoryItemImpl(String description, RestrictedTimeInterval timeInterval, String comment) {
        ArgumentUtils.checkNotNull(description, "description");
        this.description = description;
        this.timeInterval = timeInterval;
        this.comment = comment;
    }

    /**
     * A description of the problem, diagnosis, intervention or other medical
     * history item.
     */
    @Override
    public String getDescription() {
        return description;
    }

    /**
     * Optional.
     * The date range during which the item applied or occurred.
     */
    @Override
    public RestrictedTimeInterval getTimeInterval() {
        return timeInterval;
    }

    /**
     * Optional.
     * Free text comments providing additional information relevant to the item
     * in question.
     */
    @Override
    public String getComment() {
        return comment;
    }

    /**
     * A random UUID unless explicitly set.
     * 
     * This is a technical identifier that is used for system purposes such as
     * matching. If a suitable internal key is not available, a UUID may be
     * used.
     */
    @Override
    public UniqueIdentifier getID() {
        return id ;
    }

    public void setID(UniqueIdentifier id) {
        this.id = id;
    }
}

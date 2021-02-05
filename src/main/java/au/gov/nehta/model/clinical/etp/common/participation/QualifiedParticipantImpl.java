package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.UUID;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.types.HPII;

public abstract class QualifiedParticipantImpl extends ParticipantImpl implements QualifiedParticipant {

    protected String qualifications;
    protected HPII entityIdentifier;
    private String authorID = UUID.randomUUID().toString();


    @Override
    public HPII getEntityIdentifiers() {
        return entityIdentifier;
    }

    @Override
    public String getQualifications() {
        return qualifications;
    }

    @Override
    public void setQualifications(String qualifications) {
        ArgumentUtils.checkNotNullNorBlank(qualifications, "qualifications");
        this.qualifications = qualifications;
    }

    /**
     * Defaults to random UUID if not Explicitly set.
     */
    @Override
    public String getAssignedAuthorId() {
        return authorID;
    }

    @Override
    public void setAssignedAuthorId(String id) {
        this.authorID = id;
    }
}

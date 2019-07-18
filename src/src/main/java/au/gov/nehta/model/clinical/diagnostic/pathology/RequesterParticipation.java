package au.gov.nehta.model.clinical.diagnostic.pathology;

import org.joda.time.DateTime;

import au.gov.nehta.model.clinical.common.participation.Role;

public interface RequesterParticipation {

    /**
     * The involvement or role of the participant in the related action from a
     * healthcare perspective rather than the specific participation
     * perspective.
     *
     * Should be an Occupation as in the ANZSCO_1ED_2006
     * 
     */
    public Role getRole();

    /**
     * Details pertinent to the identification of an individual or organisation
     * or device that has participated in a healthcare event/encounter/clinical
     * interaction.
     */
    public RequesterParticipant getParticipant();

    /**
     * The time interval during which the participation in the health care event
     * occurred The end of the participation period of a [EntitledParticipant]
     * participation is the time associated with the completion of editing the
     * content
     */
    public DateTime getParticipationEndTime();
}

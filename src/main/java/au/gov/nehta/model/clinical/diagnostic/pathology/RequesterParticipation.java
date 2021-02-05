package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.clinical.common.participation.Role;

import java.time.ZonedDateTime;

public interface RequesterParticipation {

    /**
     * The involvement or role of the participant in the related action from a
     * healthcare perspective rather than the specific participation
     * perspective.
     * <p>
     * Should be an Occupation as in the ANZSCO_1ED_2006
     */
    Role getRole();

    /**
     * Details pertinent to the identification of an individual or organisation
     * or device that has participated in a healthcare event/encounter/clinical
     * interaction.
     */
    RequesterParticipant getParticipant();

    /**
     * The time interval during which the participation in the health care event
     * occurred The end of the participation period of a [EntitledParticipant]
     * participation is the time associated with the completion of editing the
     * content
     */
    ZonedDateTime getParticipationEndTime();
}

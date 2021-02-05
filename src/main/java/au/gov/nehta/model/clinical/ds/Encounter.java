package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.util.List;

public interface Encounter {

    RestrictedTimeInterval getEncounterPeriod();

    Coded getSeparationMode();

    List<Coded> getSpecialtyList();

    String getLocationOfDischarge();

    /**
     * Responsible Health Professional At Time Of Discharge
     *
     * @return @{@link ParticipationServiceProvider}
     */
    ParticipationServiceProvider getResponsibleHealthProfessionalAtDischarge();

    List<ParticipationServiceProvider> getOtherParticipants();

    void setEncounterPeriod(RestrictedTimeInterval encounterPeriod);

    void setSeparationMode(Coded separationMode);

    void setSpecialtyList(List<Coded> specialtyList);

    void setLocationOfDischarge(String locationOfDischarge);

    void setResponsibleHealthProfessionalAtDischarge(
            ParticipationServiceProvider responsibleHealthProfessionalAtDischarge);

    void setOtherParticipant(
            List<ParticipationServiceProvider> otherParticipants);

    StrucDocText getCustomNarrative();

    void setCustomNarrative(StrucDocText customNarrative);
}

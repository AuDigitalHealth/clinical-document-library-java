package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class EncounterImpl implements Encounter {

  private RestrictedTimeInterval encounterPeriod;
  private Coded separationMode;
  private List<Coded> specialtyList;
  private String locationOfDischarge;
  private ParticipationServiceProvider responsibleHealthProfessionalAtDischarge;
  private List<ParticipationServiceProvider> otherParticipants;
  private StrucDocText customNarrative;

  @Override
  public RestrictedTimeInterval getEncounterPeriod() {
    return encounterPeriod;
  }

  @Override
  public Coded getSeparationMode() {
    return separationMode;
  }

  @Override
  public List<Coded> getSpecialtyList() {
    return specialtyList;
  }

  @Override
  public String getLocationOfDischarge() {
    return locationOfDischarge;
  }

  @Override
  public ParticipationServiceProvider getResponsibleHealthProfessionalAtDischarge() {
    return responsibleHealthProfessionalAtDischarge;
  }

  @Override
  public List<ParticipationServiceProvider> getOtherParticipants() {
    return otherParticipants;
  }

  @Override
  public void setEncounterPeriod(RestrictedTimeInterval encounterPeriod) {
    this.encounterPeriod = encounterPeriod;
  }

  @Override
  public void setSeparationMode(Coded separationMode) {
    this.separationMode = separationMode;
  }

  @Override
  public void setSpecialtyList(List<Coded> specialtyList) {
    this.specialtyList = specialtyList;
  }

  @Override
  public void setLocationOfDischarge(String locationOfDischarge) {
    this.locationOfDischarge = locationOfDischarge;
  }

  @Override
  public void setResponsibleHealthProfessionalAtDischarge(
      ParticipationServiceProvider responsibleHealthProfessionalAtDischarge) {
    this.responsibleHealthProfessionalAtDischarge = responsibleHealthProfessionalAtDischarge;
  }

  @Override
  public void setOtherParticipant(
      List<ParticipationServiceProvider> otherParticipants) {
    this.otherParticipants = otherParticipants;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }
}

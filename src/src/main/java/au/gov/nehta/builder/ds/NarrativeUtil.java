package au.gov.nehta.builder.ds;

import static au.gov.nehta.builder.DocumentCreatorUtil.add;
import static au.gov.nehta.builder.DocumentCreatorUtil.addBody;
import static au.gov.nehta.builder.DocumentCreatorUtil.addCaption;
import static au.gov.nehta.builder.DocumentCreatorUtil.addHeader;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.getBoldTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.getNormalTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.narrativeVersion;
import static au.gov.nehta.builder.DocumentCreatorUtil.print;
import static au.gov.nehta.builder.DocumentCreatorUtil.safe;
import static au.gov.nehta.builder.common.NarrativeUtilCommon.PLAN_SECTION_TEXT;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.ds.AdverseReactions;
import au.gov.nehta.model.clinical.ds.Alerts;
import au.gov.nehta.model.clinical.ds.ArrangedServices;
import au.gov.nehta.model.clinical.ds.CeasedMedications;
import au.gov.nehta.model.clinical.ds.ClinicalInterventionsPerformedThisVisit;
import au.gov.nehta.model.clinical.ds.ClinicalSynopsis;
import au.gov.nehta.model.clinical.ds.CurrentMedicationsOnDischarge;
import au.gov.nehta.model.clinical.ds.Event;
import au.gov.nehta.model.clinical.ds.HealthProfile;
import au.gov.nehta.model.clinical.ds.Medications;
import au.gov.nehta.model.clinical.ds.Plan;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosesThisVisit;
import au.gov.nehta.model.clinical.ds.RecordOfRecommendationsAndInfoProvided;
import au.gov.nehta.model.clinical.ds.TherapeuticGood;
import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocItem;
import au.net.electronichealth.ns.cda._2_0.StrucDocList;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import javax.xml.bind.JAXBElement;

public class NarrativeUtil {


  private static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";
  private static ObjectFactory objectFactory = new ObjectFactory();

  static StrucDocText getPlan(Plan planObj) {
    if (null != planObj.getCustomNarrative()) {
      return planObj.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    StrucDocText strucDocText = objectFactory.createStrucDocText();
    StrucDocParagraph para = objectFactory.createStrucDocParagraph();
    para.getContent().add(PLAN_SECTION_TEXT);
    JAXBElement<StrucDocParagraph> paraJaxbElement = objectFactory
        .createStrucDocTextParagraph(para);
    strucDocText.getContent().add(paraJaxbElement);
    narrative.getContent().add(paraJaxbElement);
    return narrative;
  }

  static StrucDocText getArrangedServices(ArrangedServices arrangedServices) {
    if (null != arrangedServices.getCustomNarrative()) {
      return arrangedServices.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (!arrangedServices.getArrangedServiceList().isEmpty()) {
      narrative.getContent()
          .add(objectFactory.createStrucDocTextParagraph(new StrucDocParagraph() {{
            getStyleCode().add("Bold Underline");
            getContent().add("Arranged Services");
          }}));
      arrangedServices.getArrangedServiceList().stream().filter(Objects::nonNull).forEach(
          arrangedService -> {
            StrucDocTable arrangedServicesTable = objectFactory.createStrucDocTable();
            addHeader(arrangedServicesTable, "Field", "Value");
            StrucDocTbody arrangedServicesTBody = addBody(arrangedServicesTable);
            add(arrangedServicesTBody, getBoldTextTd("Description"),
                getNormalTextTd(print(arrangedService.getArrangedServiceDesc())));
            add(arrangedServicesTBody, getBoldTextTd("Booking Status"),
                getNormalTextTd(arrangedService.getServiceBookingStatus().getName()));
            add(arrangedServicesTBody, getBoldTextTd("Service Commencement Window"),
                getNormalTextTd(narrativeVersion(arrangedService.getServiceCommencementWindow())));
            StrucDocTd serviceProviderTh = new StrucDocTd() {{
              getStyleCode().add("Bold");
              getContent().add("Protocol Service Provider:");
              setColspan("2");
            }};
            add(arrangedServicesTBody, serviceProviderTh);
            StrucDocTd serviceProviderTd = au.gov.nehta.builder.util.narrative.NarrativeUtil
                .getParticipationServiceProviderTdNarrative(
                    arrangedService.getProtocol().getServiceProvider());
            serviceProviderTd.setColspan("2");
            add(arrangedServicesTBody, serviceProviderTd);
            addTable(narrative, arrangedServicesTable);
          });
    }
    return narrative;
  }

  static StrucDocText getRecordOfRecommendNInfoForPlan(
      RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided) {
    if (null != recordOfRecommendationsAndInfoProvided.getCustomNarrative()) {
      return recordOfRecommendationsAndInfoProvided.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (!recordOfRecommendationsAndInfoProvided.getRecommendationsProvidedList().isEmpty()) {
      StrucDocTable recommProvidedTable = objectFactory.createStrucDocTable();
      StrucDocTbody recommProvidedTBody = addBody(recommProvidedTable);
      addCaption(recommProvidedTable, "Recommendations Provided");
      addHeader(recommProvidedTable, "Recommendation Note", "Recommendation Recipient");
      recordOfRecommendationsAndInfoProvided.getRecommendationsProvidedList().stream()
          .filter(Objects::nonNull).forEach(recommendationsProvided -> {
        List<StrucDocTd> recommProvidedCols = new LinkedList<>();
        recommProvidedCols.add(getNormalTextTd(recommendationsProvided.getRecommendationNote()));
        recommProvidedCols.add(au.gov.nehta.builder.util.narrative.NarrativeUtil
            .getParticipationServiceProviderTdNarrative(
                recommendationsProvided.getRecommendationRecipient()));
        add(recommProvidedTBody, recommProvidedCols);
      });
      addTable(narrative, recommProvidedTable);
      StrucDocList infoProvidedList = objectFactory.createStrucDocList();
      StrucDocCaption listCaption = objectFactory.createStrucDocCaption();
      listCaption.getContent().add("Info provided to Subject of Care or Related Parties");
      infoProvidedList.setCaption(listCaption);
      StrucDocItem infoProvidedToSubOfCareItem = objectFactory.createStrucDocItem();
      infoProvidedToSubOfCareItem.getContent()
          .add(recordOfRecommendationsAndInfoProvided.getInformationProvided()
              .getInfoProvidedToSubOfCareOrRelParties());
      infoProvidedList.getItem().add(infoProvidedToSubOfCareItem);
      narrative.getContent().add(objectFactory.createStrucDocTdList(infoProvidedList));
    }
    return narrative;
  }

  static StrucDocText getClinicalSynopsisForEvent(ClinicalSynopsis clinicalSynopsis) {
    if (null != clinicalSynopsis.getCustomNarrative()) {
      return clinicalSynopsis.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocList synopsisList = objectFactory.createStrucDocList();
    StrucDocCaption synopsisCaption = objectFactory.createStrucDocCaption();
    synopsisCaption.getContent().add("Clinical Synopsis");
    synopsisList.setCaption(synopsisCaption);
    StrucDocItem synopsisItem = objectFactory.createStrucDocItem();
    synopsisItem.getContent().add(clinicalSynopsis.getClinicalSynopsisDesc());
    synopsisList.getItem().add(synopsisItem);
    narrative.getContent().add(objectFactory.createStrucDocTdList(synopsisList));
    return narrative;
  }

  static StrucDocText getProblemDiagnosesForEvent(
      ProblemDiagnosesThisVisit problemDiagnosesThisVisit) {
    if (null != problemDiagnosesThisVisit.getCustomNarrative()) {
      return problemDiagnosesThisVisit.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != problemDiagnosesThisVisit.getProblemDiagnoses()
        || !problemDiagnosesThisVisit.getProblemDiagnoses().isEmpty()) {
      StrucDocTable probDiagnosesTable = objectFactory.createStrucDocTable();
      StrucDocTbody problemDiagnosesTBody = addBody(probDiagnosesTable);
      addCaption(probDiagnosesTable, "Problem Diagnoses");
      addHeader(probDiagnosesTable, "Description", "Type");
      problemDiagnosesThisVisit.getProblemDiagnoses().stream().filter(Objects::nonNull)
          .forEach(problemDiagnosis -> add(problemDiagnosesTBody,
              print(problemDiagnosis.getProblemDiagnosisDesc()),
              print(problemDiagnosis.getProblemDiagnosisType())));
      addTable(narrative, probDiagnosesTable);
    }
    if (null != problemDiagnosesThisVisit.getExclusionStatement()
        && null != problemDiagnosesThisVisit.getExclusionStatement().getGlobalStatement()) {
      StrucDocList globalStatementList = objectFactory.createStrucDocList();
      StrucDocItem globalStatementItem = objectFactory.createStrucDocItem();
      globalStatementItem.getContent()
          .add(print(problemDiagnosesThisVisit.getExclusionStatement().getGlobalStatement()));
      globalStatementList.setCaption(new StrucDocCaption() {{
        getContent().add("Problem Diagnoses > Global Statement");
      }});
      globalStatementList.getItem().add(globalStatementItem);
      narrative.getContent().add(objectFactory.createStrucDocTdList(globalStatementList));
    }
    return narrative;
  }

  static StrucDocText getEvent(Event eventObj) {
    if (null != eventObj.getCustomNarrative()) {
      return eventObj.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != eventObj.getEncounter().getSpecialtyList()
        && !eventObj.getEncounter().getSpecialtyList().isEmpty()) {
      StrucDocList specialtyList = objectFactory.createStrucDocList();
      specialtyList.setCaption(new StrucDocCaption() {{
        getContent().add("Event > Specialty");
      }});
      eventObj.getEncounter().getSpecialtyList().stream().filter(Objects::nonNull).forEach(
          specialty -> {
            StrucDocItem specialtyItem = objectFactory.createStrucDocItem();
            specialtyItem.getContent().add(print(specialty));
            specialtyList.getItem().add(specialtyItem);
          });
      narrative.getContent().add(objectFactory.createStrucDocTdList(specialtyList));
    }
    if (null != eventObj.getEncounter().getLocationOfDischarge()) {
      StrucDocList locationOfDischargeList = objectFactory.createStrucDocList();
      locationOfDischargeList.setCaption(new StrucDocCaption() {{
        getContent().add("Event > Location Of Discharge");
      }});
      locationOfDischargeList.getItem().add(new StrucDocItem() {{
        getContent().add(eventObj.getEncounter().getLocationOfDischarge());
      }});
      narrative.getContent().add(objectFactory.createStrucDocTdList(locationOfDischargeList));
    }
    if (null != eventObj.getEncounter().getOtherParticipants()
        && !eventObj.getEncounter().getOtherParticipants().isEmpty()) {
      StrucDocTable otherParticipantsTable = objectFactory.createStrucDocTable();
      StrucDocTbody otherParticipantsTBody = addBody(otherParticipantsTable);
      addCaption(otherParticipantsTable, "Event > Encounter > Other Participants");
      addHeader(otherParticipantsTable, "Details");
      eventObj.getEncounter().getOtherParticipants().stream().filter(Objects::nonNull)
          .forEach(otherParticipant -> add(otherParticipantsTBody,
              au.gov.nehta.builder.util.narrative.NarrativeUtil
                  .getParticipationServiceProviderTdNarrative(otherParticipant)));
      addTable(narrative, otherParticipantsTable);
    }
    if (null != eventObj.getEncounter().getResponsibleHealthProfessionalAtDischarge()) {
      narrative.getContent().add(au.gov.nehta.builder.util.narrative.NarrativeUtil
          .getServiceProviderDetails(
              eventObj.getEncounter().getResponsibleHealthProfessionalAtDischarge(),
              Optional.of("Event > Encounter > Responsible Health Professional at Discharge")));
    }
    if (null != eventObj.getEncounter().getEncounterPeriod()) {
      narrative.getContent()
          .add(objectFactory.createStrucDocTdList(
              getEncounterPeriodForEvent(eventObj.getEncounter().getEncounterPeriod())));
    }
    if (null != eventObj.getEncounter().getSeparationMode()) {
      narrative.getContent()
          .add(objectFactory.createStrucDocTdList(
              getSeparationModeForEncounter(eventObj.getEncounter().getSeparationMode())));
    }
    return narrative;
  }

  private static StrucDocList getSeparationModeForEncounter(Coded separationMode) {
    StrucDocList separationModeList = objectFactory.createStrucDocList();
    separationModeList.setCaption(new StrucDocCaption() {{
      getContent().add("Event > Encounter > Separation Mode");
    }});
    StrucDocItem separationModeItem = objectFactory.createStrucDocItem();
    separationModeList.getItem().add(separationModeItem);
    separationModeItem.getContent().add(print(separationMode));
    return separationModeList;
  }

  private static StrucDocList getEncounterPeriodForEvent(RestrictedTimeInterval encounterPeriod) {
    StrucDocList encounterPeriodList = objectFactory.createStrucDocList();
    encounterPeriodList.setCaption(new StrucDocCaption() {{
      getContent().add("Event > Encounter > Encounter Period");
    }});
    StrucDocItem encounterPeriodItem = objectFactory.createStrucDocItem();
    encounterPeriodItem.getContent().add(narrativeVersion(encounterPeriod));
    encounterPeriodList.getItem().add(encounterPeriodItem);
    return encounterPeriodList;
  }

  static StrucDocText getClinicalInterventionsPerformedForEvent(
      ClinicalInterventionsPerformedThisVisit clinicalInterventionsPerformedThisVisit) {
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != clinicalInterventionsPerformedThisVisit.getClinicalInterventions()
        && !clinicalInterventionsPerformedThisVisit.getClinicalInterventions().isEmpty()) {
      StrucDocTable clinicalInterventionsTable = objectFactory.createStrucDocTable();
      StrucDocTbody clinicalInterventionsTBody = addBody(clinicalInterventionsTable);
      addCaption(clinicalInterventionsTable, "Clinical Interventions");
      addHeader(clinicalInterventionsTable, "Description");
      clinicalInterventionsPerformedThisVisit.getClinicalInterventions().stream().filter(
          Objects::nonNull).forEach(clinicalIntervention -> add(clinicalInterventionsTBody,
          print(clinicalIntervention.getClinicalInterventionDesc())));
      addTable(narrative, clinicalInterventionsTable);
    }
    return narrative;
  }

  static StrucDocText getMedications(Medications medicationsObj) {
    if (null != medicationsObj.getCustomNarrative()) {
      return medicationsObj.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
  /*  if (null != medicationsObj.getCurrentMedicationsOnDischarge()) {
      if (null != medicationsObj.getCurrentMedicationsOnDischarge().getExclusionStatement()) {
        narrative.getContent().add(objectFactory.createStrucDocTdList(getExclusionStatement(
            medicationsObj.getCurrentMedicationsOnDischarge().getExclusionStatement(),
            "Current Medications On Discharge")));
      }
      if (null != medicationsObj.getCurrentMedicationsOnDischarge().getTherapeuticGoods()
          && !medicationsObj.getCurrentMedicationsOnDischarge().getTherapeuticGoods().isEmpty()) {
        addTable(narrative, getTherapeuticGoods(
            medicationsObj.getCurrentMedicationsOnDischarge().getTherapeuticGoods(),
            "Current Medications On Discharge"));
      }
    }*/
   /* if (null != medicationsObj.getCeasedMedications().getExclusionStatement()) {
      narrative.getContent().add(objectFactory.createStrucDocTdList(getExclusionStatement(
          medicationsObj.getCeasedMedications().getExclusionStatement(), "Ceased Medications")));
    }
    if (null != medicationsObj.getCeasedMedications().getTherapeuticGoods()
        && !medicationsObj.getCeasedMedications().getTherapeuticGoods().isEmpty()) {
      addTable(narrative, getTherapeuticGoods(
          medicationsObj.getCeasedMedications().getTherapeuticGoods(), "Ceased Medications"));
    }*/
    return narrative;
  }

  static StrucDocText getCeasedMedications(CeasedMedications ceasedMedications) {
    if (null != ceasedMedications.getCustomNarrative()) {
      return ceasedMedications.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();

    if (null != ceasedMedications.getExclusionStatement()) {
      narrative.getContent().add(objectFactory.createStrucDocTdList(getExclusionStatement(
          ceasedMedications.getExclusionStatement(), "Ceased Medications")));
    }
    if (null != ceasedMedications.getTherapeuticGoods()
        && !ceasedMedications.getTherapeuticGoods().isEmpty()) {
      addTable(narrative, getTherapeuticGoods(
          ceasedMedications.getTherapeuticGoods(), "Ceased Medications"));
    }
    return narrative;
  }

  static StrucDocText getCurrentMedicationsOnDischarge(
      CurrentMedicationsOnDischarge currentMedicationsOnDischargeObj) {
    if (null != currentMedicationsOnDischargeObj.getCustomNarrative()) {
      return currentMedicationsOnDischargeObj.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != currentMedicationsOnDischargeObj) {
      if (null != currentMedicationsOnDischargeObj.getExclusionStatement()) {
        narrative.getContent().add(objectFactory.createStrucDocTdList(getExclusionStatement(
            currentMedicationsOnDischargeObj.getExclusionStatement(),
            "Current Medications On Discharge")));
      }
      if (null != currentMedicationsOnDischargeObj.getTherapeuticGoods()
          && !currentMedicationsOnDischargeObj.getTherapeuticGoods().isEmpty()) {
        addTable(narrative, getTherapeuticGoods(
            currentMedicationsOnDischargeObj.getTherapeuticGoods(),
            "Current Medications On Discharge"));
      }
    }
    return narrative;
  }

  private static StrucDocTable getTherapeuticGoods(List<TherapeuticGood> therapeuticGoods,
      String level) {
    StrucDocTable therapeuticGoodsTable = objectFactory.createStrucDocTable();
    StrucDocTbody therapeuticGoodsTbody = addBody(therapeuticGoodsTable);
    addCaption(therapeuticGoodsTable, String.format("%s > Therapeutic Goods", level));
    addHeader(therapeuticGoodsTable, "Identification", "Unit of Qty", "Dosage Instruc.",
        "Reason", "Additional Comments", "Item Status", "Reason for Change (Med. History)",
        "Changes Made (Med. History)", "Medication Duration (Med. History)");
    therapeuticGoods.stream().filter(Objects::nonNull).forEach(
        therapeuticGood -> add(therapeuticGoodsTbody,
            safe(print(therapeuticGood.getTherapeuticGoodIdentification())),
            safe(therapeuticGood.getUnitOfUseQuantityDispensed()),
            safe(null != therapeuticGood.getDosage() ? therapeuticGood.getDosage()
                .getDosageInstruction() : "NA"),
            safe(therapeuticGood.getReasonForTherapeuticGood()),
            safe(therapeuticGood.getAdditionalComments()),
            safe(print(null != therapeuticGood.getMedicationHistory() ? therapeuticGood
                .getMedicationHistory().getItemStatus() : null)),
            safe(null != therapeuticGood.getMedicationHistory() ? therapeuticGood
                .getMedicationHistory().getChangeDetail().getReasonForChange() : null),
            safe(print(null != therapeuticGood.getMedicationHistory() ? therapeuticGood
                .getMedicationHistory().getChangeDetail().getChangesMade() : null)),
            safe(narrativeVersion(therapeuticGood.getMedicationHistory().getMedicationDuration()))
        ));
    return therapeuticGoodsTable;
  }

  private static StrucDocList getExclusionStatement(ExclusionStatement exclusionStatement,
      String level) {
    StrucDocList exclusionStatementList = objectFactory.createStrucDocList();
    exclusionStatementList.setCaption(new StrucDocCaption() {{
      getContent().add(String.format("%s > Global Statement", level));
    }});
    exclusionStatementList.getItem().add(new StrucDocItem() {{
      getContent().add(print(exclusionStatement.getGlobalStatement()));
    }});
    return exclusionStatementList;
  }

  static StrucDocText getHealthProfile(HealthProfile healthProfileObj) {
    if (null != healthProfileObj.getCustomNarrative()) {
      return healthProfileObj.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != healthProfileObj.getHealthCareProviders()
        && null != healthProfileObj.getHealthCareProviders()
        .getNominatedPrimaryHealthcareProviders()
        && !healthProfileObj.getHealthCareProviders().getNominatedPrimaryHealthcareProviders()
        .isEmpty()) {
      StrucDocTable healthCareProvidersTable = objectFactory.createStrucDocTable();
      StrucDocTbody healthCareProvidersTbody = addBody(healthCareProvidersTable);
      addCaption(healthCareProvidersTable, "Healthcare Providers");
      addHeader(healthCareProvidersTable, "Service Provider Details");
      healthProfileObj.getHealthCareProviders().getNominatedPrimaryHealthcareProviders().stream()
          .filter(Objects::nonNull).forEach(
          participationServiceProvider -> add(healthCareProvidersTbody,
              au.gov.nehta.builder.util.narrative.NarrativeUtil
                  .getParticipationServiceProviderTdNarrative(participationServiceProvider)));
      addTable(narrative, healthCareProvidersTable);
    }
    return narrative;
  }

  static StrucDocText getAdverseReactions(AdverseReactions adverseReactions) {
    if (null != adverseReactions.getCustomNarrative()) {
      return adverseReactions.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != adverseReactions) {
      if (null != adverseReactions.getExclusionStatement()) {
        narrative.getContent().add(objectFactory.createStrucDocTdList(
            getExclusionStatement(adverseReactions.getExclusionStatement(),
                "Health Profile > Adverse Reactions")));
      }
      if (null != adverseReactions.getAdverseReactionList()
          && !adverseReactions.getAdverseReactionList().isEmpty()) {
        StrucDocTable adverseReactionsTable = objectFactory.createStrucDocTable();
        StrucDocTbody adverseReactionsTbody = addBody(adverseReactionsTable);
        addCaption(adverseReactionsTable, "Health Profile > Adverse Reactions");
        addHeader(adverseReactionsTable, "Reaction Type", "Agent Desc", "Reaction Detail");
        adverseReactions.getAdverseReactionList().stream()
            .filter(Objects::nonNull).forEach(adverseReaction -> {
          StrucDocList reactionDetailList = objectFactory.createStrucDocList();
          adverseReaction.getReactionDetail().stream().filter(Objects::nonNull)
              .forEach(reactionDetail -> {
                StrucDocItem item = objectFactory.createStrucDocItem();
                item.getContent().add(print(reactionDetail.getReactionDesc()));
                reactionDetailList.getItem().add(item);

              });
          StrucDocTd reactionDetailTd = objectFactory.createStrucDocTd();
          reactionDetailTd.getContent().add(objectFactory.createStrucDocTdList(reactionDetailList));
          List<StrucDocTd> cols = new LinkedList<>();
          // Reaction Type
          StrucDocTd rttd = objectFactory.createStrucDocTd();
          rttd.getContent().add(print(adverseReaction.getAdverseReactionType()));
          cols.add(rttd);
          // Agent Desc
          StrucDocTd adtd = objectFactory.createStrucDocTd();
          adtd.getContent().add(print(adverseReaction.getAgentDesc()));
          cols.add(adtd);
          // Reaction Detail
          StrucDocTd rdList = objectFactory.createStrucDocTd();
          rdList.getContent().add(objectFactory.createStrucDocTdList(reactionDetailList));
          cols.add(rdList);
          add(adverseReactionsTbody, cols);
        });
        addTable(narrative, adverseReactionsTable);
      }
    }
    return narrative;
  }

  static StrucDocText getAlerts(Alerts alerts) {
    if (null != alerts.getCustomNarrative()) {
      return alerts.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != alerts && null != alerts.getAlertList()
        && !alerts.getAlertList().isEmpty()) {
      StrucDocTable alertsTable = objectFactory.createStrucDocTable();
      StrucDocTbody alertsTbody = addBody(alertsTable);
      addCaption(alertsTable, "Health Profile > Alerts");
      addHeader(alertsTable, "Description", "Type");
      alerts.getAlertList().stream().filter(Objects::nonNull)
          .forEach(alert -> add(alertsTbody,
              safe(print(alert.getAlertDesc())),
              safe(print(alert.getAlertType()))));
      addTable(narrative, alertsTable);
    }
    return narrative;
  }


}



package au.gov.nehta.builder.common;

import static au.gov.nehta.builder.DocumentCreatorUtil.add;
import static au.gov.nehta.builder.DocumentCreatorUtil.addBody;
import static au.gov.nehta.builder.DocumentCreatorUtil.addCaption;
import static au.gov.nehta.builder.DocumentCreatorUtil.addHeader;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.getNormalTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.print;
import static au.gov.nehta.builder.DocumentCreatorUtil.safe;
import static au.gov.nehta.builder.DocumentCreatorUtil.textWithTable;

import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocItem;
import au.net.electronichealth.ns.cda._2_0.StrucDocList;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import javax.xml.bind.JAXBElement;

public class NarrativeUtilCommon {

    private static final String SECTION_INTRO = "This section contains the following subsections: ";
    private static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";
    private static ObjectFactory objectFactory = new ObjectFactory();
    public static final StrucDocText DIAGNOSTIC_INVESTIGATIONS_SECTION_TEXT =
            NarrativeUtilCommon.getEmptyStrucDocTextParagraph(SECTION_INTRO +
                    "Pathology Test Result, Imaging Examination Result and Requested Service(s).");
    public static final String EVENT_SECTION_TEXT = SECTION_INTRO +
            "Clinical Summary, Problems/Diagnoses This Visit, Procedures and Diagnostic Investigations.";
    public static final String HEALTH_PROFILE_SECTION_TEXT = SECTION_INTRO + "Adverse Reactions and Alerts.";
    public static final String PLAN_SECTION_TEXT = SECTION_INTRO +
            "Follow-up Appointments and Record Of Recommendations And Information Provided.";
    public static final StrucDocText MEDICATIONS_SECTION_TEXT =
            NarrativeUtilCommon.getEmptyStrucDocTextParagraph(SECTION_INTRO +
                    "Current Medications On Discharge and Ceased Medications.");

    /**
     * Medications
     */
    public static StrucDocText getMedications(Medications medications) {

        if (medications.getCustomNarrative() != null) {
            return medications.getCustomNarrative();
        }
        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        if (null != medications.getCustomNarrative()) {
            narrative = medications.getCustomNarrative();
        } else {
            if (null != medications.getKnownMedications()
                    && !medications.getKnownMedications().isEmpty()) {

                StrucDocTable knownMedicationsTable = objectFactory.createStrucDocTable();
                StrucDocTbody knownMedicationsTBody = addBody(knownMedicationsTable);
                addCaption(knownMedicationsTable, "Medications");
                addHeader(knownMedicationsTable,
                        "Medication", "Directions", "Clinical Indication", "Change Status",
                        "Change Description", "Change Reason", "Change Type", "Comment");
                medications.getKnownMedications().stream().filter(Objects::nonNull)
                        .forEach(knownMedication ->
                                add(knownMedicationsTBody,
                                        print(knownMedication.getTherapeuticGoodIdentification()),
                                        safe(knownMedication.getDirections()),
                                        safe(knownMedication.getClinicalIndication()),
                                        safe(print(knownMedication.getChangeStatus())),
                                        safe(knownMedication.getChangeDesc()),
                                        safe(knownMedication.getChangeOrRecommendationReason()),
                                        safe(print(knownMedication.getChangeType())),
                                        safe(knownMedication.getMedicationInstructionComment())));
                addTable(narrative, knownMedicationsTable);
            }
            if (null != medications.getExclusionStatement()) {
                addTable(narrative, getExclusionStatementForMedicationsNarrative(medications));
            }
        }
        return narrative;
    }

    /**
     * Adverse Reactions
     */
    public static StrucDocText getAdverseReactionsNarrative(
            NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions) {

        if (null != newlyIdentifiedAdverseReactions.getCustomNarrative()) {
            return newlyIdentifiedAdverseReactions.getCustomNarrative();
        }
        if (newlyIdentifiedAdverseReactions.getAdverseReactions() == null
                || newlyIdentifiedAdverseReactions.getAdverseReactions().size() == 0) {
            return null;
        }
        StrucDocTable adverseReactionTable = objectFactory.createStrucDocTable();
        StrucDocTbody adverseReactionTBody = addBody(adverseReactionTable);
        addCaption(adverseReactionTable, "Adverse Reactions");
        addHeader(adverseReactionTable, "Substance/Agent", "Manifestations", "Reaction Type");
        newlyIdentifiedAdverseReactions.getAdverseReactions().stream().filter(Objects::nonNull).forEach(
                adverseReaction -> {
                    StrucDocList adverseReactionList = objectFactory.createStrucDocList();
                    adverseReactionList.setCaption(new StrucDocCaption() {{
                        getContent().add(print(adverseReaction.getReactionEvent().getReactionType()));
                    }});
                    adverseReaction.getReactionEvent().getManifestations().stream().filter(Objects::nonNull)
                            .forEach(
                                    manifestation -> {
                                        StrucDocItem item = objectFactory.createStrucDocItem();
                                        item.getContent().add(print(manifestation));
                                        adverseReactionList.getItem().add(item);
                                    });
                    List<StrucDocTd> cols = new LinkedList<>();
                    // Substance/Agent
                    cols.add(getNormalTextTd(print(adverseReaction.getSubstanceOrAgent())));
                    // Manifestations
                    StrucDocTd mlist = objectFactory.createStrucDocTd();
                    mlist.getContent().add(objectFactory.createStrucDocTdList(adverseReactionList));
                    cols.add(mlist);
                    // Reaction Type
                    cols.add(getNormalTextTd(print(adverseReaction.getReactionEvent().getReactionType())));
                    add(adverseReactionTBody, cols);
                }
        );
        return textWithTable(adverseReactionTable);
    }

    /**
     * Medication History / Diagnostic Interventions / Past and current medical history
     */
    public static StrucDocText getMedicalHistory(
            MedicalHistory medicalHistory) {

        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        if (null != medicalHistory.getCustomNarrative()) {
            narrative = medicalHistory.getCustomNarrative();
        } else {
            narrative = getMedicalHistoryDefaultNarrative(medicalHistory);
        }
        return narrative;
    }

    private static StrucDocText getMedicalHistoryDefaultNarrative(MedicalHistory medicalHistory) {

        // Medical History Start
        StrucDocTable medicalHistoryTable = objectFactory.createStrucDocTable();
        addCaption(medicalHistoryTable, "Medical History");
        StrucDocTbody body = addBody(medicalHistoryTable);
        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        if (null != medicalHistory.getProblemDiagnoses()
                && !medicalHistory.getProblemDiagnoses().isEmpty()) {
            // Problem Diagnosis
            addHeader(medicalHistoryTable, "Item", "Date", "Comment");
            medicalHistory.getProblemDiagnoses().stream().filter(Objects::nonNull)
                    .forEach(problemDiagnosis -> add(body,
                            safe(print(problemDiagnosis.getIdentification())),
                            safe(print(problemDiagnosis.getDateOfOnset())),
                            safe(problemDiagnosis.getComment())));
            // safe(problemDiagnosis.getDateOfRemission().toNarrativeForm())));
        }
        // Procedures
        if (null != medicalHistory.getProcedures()
                && !medicalHistory.getProcedures().isEmpty()) {
            medicalHistory.getProcedures().stream().filter(Objects::nonNull)
                    .forEach(procedure -> add(body,
                            print(procedure.getProcedureName()),
                            safe(print(procedure.getProcedureDateTime().getLow())
                                    + " -> " + print(procedure.getProcedureDateTime().getHigh())),
                            safe(procedure.getComment())));
        }
        // Uncategorized Medical History
        if (null != medicalHistory.getUncategorisedMedicalHistoryItems()
                && !medicalHistory.getUncategorisedMedicalHistoryItems().isEmpty()) {
            medicalHistory.getUncategorisedMedicalHistoryItems().stream()
                    .filter(Objects::nonNull).forEach(uncatagorisedMedicalHistoryItem ->
                    add(body,
                            safe(uncatagorisedMedicalHistoryItem.getDescription()),
                            safe(
                                    print(uncatagorisedMedicalHistoryItem.getTimeInterval().getLow())
                                            + " -> "
                                            + print(uncatagorisedMedicalHistoryItem.getTimeInterval().getHigh())),
                            safe(uncatagorisedMedicalHistoryItem.getComment())));
        }
        // Medical History End
        addTable(narrative, medicalHistoryTable);
        return narrative;
    }

    /**
     * Exclusion Statement for Medications
     */
    private static StrucDocTable getExclusionStatementForMedicationsNarrative(
            Medications medications) {

        StrucDocTable exclusionStatementTable = objectFactory.createStrucDocTable();
        StrucDocTbody exclusionStatementTBody = addBody(exclusionStatementTable);
        addCaption(exclusionStatementTable, "Medications > Exclusion Statement");
        addHeader(exclusionStatementTable, "Exclusion Statement");
        StrucDocList exclusionStatementList = objectFactory.createStrucDocList();
        exclusionStatementList.setCaption(new StrucDocCaption() {{
            getContent().add("Exclusion Statement & Global Statement");
        }});
        if (null != medications.getExclusionStatement().getExclusionStatement()) {
            StrucDocItem exclusionStatementItem = objectFactory.createStrucDocItem();
            exclusionStatementItem.getContent().add(String.format("Exclusion Statement: %s",
                    print(medications.getExclusionStatement().getExclusionStatement())));
            exclusionStatementList.getItem().add(exclusionStatementItem);
        }
        if (null != medications.getExclusionStatement().getGlobalStatement()) {
            StrucDocItem globalStatementItem = objectFactory.createStrucDocItem();
            globalStatementItem.getContent().add(String.format("Global Statement: %s",
                    print(medications.getExclusionStatement().getGlobalStatement())));
            exclusionStatementList.getItem().add(globalStatementItem);
        }
        StrucDocTd exclusionStatementTd = objectFactory.createStrucDocTd();
        exclusionStatementTd.getContent()
                .add(objectFactory.createStrucDocTdList(exclusionStatementList));
        add(exclusionStatementTBody, Collections.singletonList(exclusionStatementTd));
        return exclusionStatementTable;
    }

    public static StrucDocText getEmptyStrucDocTextParagraph(String emptyMessage) {

        StrucDocText emptyStrucDocText = objectFactory.createStrucDocText();
        StrucDocParagraph para = objectFactory.createStrucDocParagraph();
        para.getContent().add(emptyMessage);
        JAXBElement<StrucDocParagraph> paraJaxbElement = objectFactory
                .createStrucDocTextParagraph(para);
        emptyStrucDocText.getContent().add(paraJaxbElement);
        return emptyStrucDocText;
    }
}

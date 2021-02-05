package au.gov.nehta.builder.common.components;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.NarrativeUtilCommon;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.UncategorisedMedicalHistoryItem;
import au.gov.nehta.model.clinical.es.Procedure;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Procedure;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentProcedureMood;

import java.util.Map;
import java.util.Objects;
import java.util.UUID;

public class MedicalHistoryComponent {

    private static ObjectFactory objectFactory = new ObjectFactory();
    private Map<String, CD> codeMap;

    public MedicalHistoryComponent(Map<String, CD> codeMap) {
        this.codeMap = codeMap;
    }

    public POCDMT000040Component3 getMedicalHistory(MedicalHistory medicalHistory, String title) {

        if (null == medicalHistory) {
            return null;
        }
        POCDMT000040Component3 medicalHistoryComponent = objectFactory
                .createPOCDMT000040Component3();
        medicalHistoryComponent.setTypeCode(ActRelationshipHasComponent.COMP);
        POCDMT000040Section medicalHistorySection = objectFactory.createPOCDMT000040Section();
        medicalHistorySection.setClassCode(ActClass.DOCSECT);
        medicalHistorySection.setMoodCode(ActMood.EVN);
        medicalHistorySection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
        medicalHistorySection.setCode((CE) codeMap.get(ClinicalDocumentCodes.MEDICAL_HISTORY));
        medicalHistorySection.setTitle(CDATypeUtil.getST(title));
        medicalHistorySection.setText(
                NarrativeUtilCommon.getMedicalHistory(medicalHistory));
        // Problem Diagnoses
        if (null != medicalHistory.getProblemDiagnoses()
                && !medicalHistory.getProblemDiagnoses().isEmpty()) {
            medicalHistory.getProblemDiagnoses().stream().filter(Objects::nonNull)
                    .forEach(
                            problemDiagnosis -> medicalHistorySection.getEntry()
                                    .add(getProblemDiagnosisEntry(problemDiagnosis)));
        }
        // Procedures
        if (null != medicalHistory.getProcedures()
                && !medicalHistory.getProcedures().isEmpty()) {
            medicalHistory.getProcedures().stream().filter(Objects::nonNull).forEach(
                    procedureObj -> medicalHistorySection.getEntry()
                            .add(getProcedureEntry(procedureObj)));
        }
        // Uncategorized Medical History
        if (null != medicalHistory.getUncategorisedMedicalHistoryItems()
                && !medicalHistory.getUncategorisedMedicalHistoryItems().isEmpty()) {
            medicalHistory.getUncategorisedMedicalHistoryItems().stream()
                    .filter(Objects::nonNull).forEach(
                    uncategorisedMedicalHistoryItem -> medicalHistorySection.getEntry().add(
                            getUncategorisedMedicalHistoryItemEntry(uncategorisedMedicalHistoryItem)));
        }
        medicalHistoryComponent.setSection(medicalHistorySection);
        return medicalHistoryComponent;
    }


    private POCDMT000040Entry getProblemDiagnosisEntry(ProblemDiagnosis problemDiagnosis) {

        POCDMT000040Entry problemDiagnosisEntry = objectFactory.createPOCDMT000040Entry();
        POCDMT000040Observation problemDiagnosisObservation = objectFactory
                .createPOCDMT000040Observation();
        problemDiagnosisObservation.setClassCode(ActClassObservation.OBS);
        problemDiagnosisObservation.setMoodCode(XActMoodDocumentObservation.EVN);
        problemDiagnosisObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        problemDiagnosisObservation
                .setCode(codeMap.get(ClinicalDocumentCodes.DIAGNOSIS_INTERPRETATION));
        if (null != problemDiagnosis.getDateOfRemission()) {
            RestrictedTimeInterval effectiveTime = RestrictedTimeInterval.getLowHighInstance(
                    problemDiagnosis.getDateOfOnset(),
                    problemDiagnosis.getDateOfRemission());
            problemDiagnosisObservation
                    .setEffectiveTime(Converter.convert(effectiveTime, true, true, true));
        } else {
            problemDiagnosisObservation.setEffectiveTime(
                    Converter.convertIVLTSwithLow(problemDiagnosis.getDateOfOnset()));
        }
        problemDiagnosisObservation.getValue()
                .add(CDATypeUtil.getCD(problemDiagnosis.getIdentification()));
        POCDMT000040EntryRelationship probDiagnosisCommentEntryRelationship =
                objectFactory.createPOCDMT000040EntryRelationship();
        probDiagnosisCommentEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
        POCDMT000040Act probDiagnosisCommentAct = objectFactory.createPOCDMT000040Act();
        probDiagnosisCommentAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        probDiagnosisCommentAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        probDiagnosisCommentAct.setMoodCode(XDocumentActMood.EVN);
        probDiagnosisCommentAct.setCode(codeMap.get(ClinicalDocumentCodes.PROB_OR_DIAG_COMMENT));
        probDiagnosisCommentAct.setText(CDATypeUtil.getST(problemDiagnosis.getComment()));
        probDiagnosisCommentEntryRelationship.setAct(probDiagnosisCommentAct);
        problemDiagnosisObservation.getEntryRelationship().add(probDiagnosisCommentEntryRelationship);
        problemDiagnosisEntry.setObservation(problemDiagnosisObservation);
        return problemDiagnosisEntry;
    }

    private POCDMT000040Entry getProcedureEntry(Procedure procedureObj) {

        POCDMT000040Entry procedureEntry = objectFactory.createPOCDMT000040Entry();
        POCDMT000040Procedure procedure = objectFactory.createPOCDMT000040Procedure();
        procedure.setClassCode(ActClass.PROC);
        procedure.setMoodCode(XDocumentProcedureMood.EVN);
        procedure.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        procedure.setCode(Converter.convertToCDCode(procedureObj.getProcedureName()));
        procedure.setEffectiveTime(Converter.convert(procedureObj.getProcedureDateTime()));
        POCDMT000040EntryRelationship procedureCommentEntryRelationship =
                objectFactory.createPOCDMT000040EntryRelationship();
        procedureCommentEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
        POCDMT000040Act procEntryRelationshipAct = objectFactory.createPOCDMT000040Act();
        procEntryRelationshipAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        procEntryRelationshipAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        procEntryRelationshipAct.setMoodCode(XDocumentActMood.EVN);
        procEntryRelationshipAct.setCode(codeMap.get(ClinicalDocumentCodes.PROCEDURE_COMMENT));
        procEntryRelationshipAct.setText(CDATypeUtil.getST(procedureObj.getComment()));
        procedureCommentEntryRelationship.setAct(procEntryRelationshipAct);
        procedure.getEntryRelationship().add(procedureCommentEntryRelationship);
        procedureEntry.setProcedure(procedure);
        return procedureEntry;
    }

    private POCDMT000040Entry getUncategorisedMedicalHistoryItemEntry(
            UncategorisedMedicalHistoryItem uncategorisedMedicalHistoryItem) {

        POCDMT000040Entry uncategorisedMedHistEntry = objectFactory.createPOCDMT000040Entry();
        POCDMT000040Act uncategorisedMedHistAct = objectFactory.createPOCDMT000040Act();
        uncategorisedMedHistAct.setClassCode(XActClassDocumentEntryAct.ACT);
        uncategorisedMedHistAct.setMoodCode(XDocumentActMood.EVN);
        uncategorisedMedHistAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        uncategorisedMedHistAct
                .setCode(codeMap.get(ClinicalDocumentCodes.UNCATEGORISED_MEDICAL_HISTORY_ITEM));
        uncategorisedMedHistAct.setEffectiveTime(
                Converter.convert(uncategorisedMedicalHistoryItem.getTimeInterval()));
        uncategorisedMedHistAct.setText(
                CDATypeUtil.getST(uncategorisedMedicalHistoryItem.getDescription()));
        POCDMT000040EntryRelationship medHistItemCommentEntryRelationship =
                objectFactory.createPOCDMT000040EntryRelationship();
        medHistItemCommentEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
        POCDMT000040Act medHistItemEntryRelAct = objectFactory.createPOCDMT000040Act();
        medHistItemEntryRelAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        medHistItemEntryRelAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        medHistItemEntryRelAct.setMoodCode(XDocumentActMood.EVN);
        medHistItemEntryRelAct.setCode(codeMap.get(ClinicalDocumentCodes.MEDICALHISTORY_ITEM_COMMENT));
        medHistItemEntryRelAct.setText(CDATypeUtil.getST(uncategorisedMedicalHistoryItem.getComment()));
        medHistItemCommentEntryRelationship.setAct(medHistItemEntryRelAct);
        uncategorisedMedHistAct.getEntryRelationship().add(medHistItemCommentEntryRelationship);
        uncategorisedMedHistEntry.setAct(uncategorisedMedHistAct);
        return uncategorisedMedHistEntry;
    }
}

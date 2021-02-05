package au.gov.nehta.builder.ds;

import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.LOINC;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.CV;

public interface DischargeSummaryCodes {

    String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";

    CD RESULT_GROUP_SPEC_DETAIL =
            Converter.convertToCDCode(new NCTISDataComponent("102.16156.136.2.2", "Specimen"));

    CD SAMPLING_PRECONDITIONS =
            Converter.convertToCDCode(new NCTISDataComponent("103.16171", "Sampling Preconditions"));
    CD SPECIMEN =
            Converter.convertToCDCode(new NCTISDataComponent("102.16156.136.2.1", "Specimen"));
    CE PATHOLOGY_TEST_RESULT =
            Converter.convertToCECode(new NCTISDataComponent("102.16144", "Pathology Test Result") {{
                //setCodeSystemVersion("20110531");
            }});
    CD DATETIME_RECEIVED =
            Converter.convertToCDCode(new NCTISDataComponent("103.11014", "DateTime Received"));
    CD PARENT_SPECIMEN_IDENTIFIER =
            Converter.convertToCDCode(new NCTISDataComponent("103.16187", "Parent Specimen Identifier"));
    CD CLINICAL_INFO =
            Converter.convertToCDCode(new LOINC("55752-0", "Clinical information"));
    CD REPORT_STATUS =
            Converter.convertToCDCode(new SNOMED_AU_Code("308552006", "report status") {{
                setCodeSystemVersion("20110531");
            }});
    CD PATHOLOGY_SERVICE =
            Converter.convertToCDCode(new SNOMED_AU_Code("310074003", "pathology service") {{
                setCodeSystemVersion("20110531");
            }});
    CE MEDICATION_ORDERS =
            Converter.convertToCECode(new NCTISDataComponent("101.16146", "Medication Orders"));
    CD CHANGE_TYPE =
            Converter.convertToCDCode(new NCTISDataComponent("103.16593", "Change Type"));
    CD CHANGE_STATUS =
            Converter.convertToCDCode(new NCTISDataComponent("103.16595", "Change Status"));
    CD CHANGE_OR_RECOMMENDATION_REASON =
            Converter
                    .convertToCDCode(new NCTISDataComponent("103.10177", "Change or Recommendation Reason"));
    CD CLINICAL_INDICATION =
            Converter.convertToCDCode(new NCTISDataComponent("103.10141", "Clinical Indication"));
    CE MEDICAL_HISTORY =
            Converter.convertToCECode(new NCTISDataComponent("101.16117", "Medical History"));
    CD UNCATEGORISED_MEDICAL_HISTORY_ITEM =
            Converter.convertToCDCode(
                    new NCTISDataComponent("102.16627", "Uncategorised Medical History Item"));
    CD MEDICALHISTORY_ITEM_COMMENT =
            Converter
                    .convertToCDCode(new NCTISDataComponent("103.16630", "Medical History Item Comment"));
    CD PROCEDURE_COMMENT =
            Converter.convertToCDCode(new NCTISDataComponent("103.15595", "Procedure Comment"));
    CD PROB_OR_DIAG_COMMENT =
            Converter.convertToCDCode(new NCTISDataComponent("103.16545", "Problem/Diagnosis Comment"));
    CD DIAGNOSIS_INTERPRETATION =
            Converter.convertToCDCode(new SNOMED_AU_Code("282291009", "Diagnosis interpretation") {{
                setCodeSystemVersion("20110531");
            }});
    CE IMMUNISATIONS =
            Converter.convertToCECode(new NCTISDataComponent("101.16638", "Immunisations"));
    CE ADVERSE_REACTIONS =
            Converter.convertToCECode(new NCTISDataComponent("101.20113", "Adverse Reactions"));
    CD ADVERSE_REACTION =
            Converter.convertToCDCode(new NCTISDataComponent("102.15517", "Adverse Reaction"));
    CE EVENT_OVERVIEW =
            Converter.convertToCECode(new NCTISDataComponent("101.16672", "Event Overview"));
    CD INDIVIDUAL_TEST_RESULT_COMMENT =
            Converter.convertToCDCode(new SNOMED_AU_Code("281296001", "result comments") {{
                setCodeSystemVersion("20110531");
            }});
    CD INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS =
            Converter.convertToCDCode(new SNOMED_AU_Code("281298000", "reference range comments") {{
                setCodeSystemVersion("20110531");
            }});
    CD INDIVIDUAL_TEST_RESULT_STATUS =
            Converter.convertToCDCode(new SNOMED_AU_Code("308552006", "report status") {{
                setCodeSystemVersion("20110531");
            }});
    CD CLINICAL_INFORMATION_PROVIDED =
            Converter.convertToCDCode(new LOINC("55752-0", "Clinical information"));
    CD IMAGING_EXAMINATION_RESULT_STATUS =
            Converter.convertToCECode(new SNOMED_AU_Code("308552006", "report status") {{
                setCodeSystemVersion("20110531");
            }});
    CD IMAGING_EXAMINATION_RESULT_FINDINGS =
            Converter.convertToCECode(new NCTISDataComponent("103.16503", "Findings"));

    CD COLLECTION_SETTINGS =
            Converter.convertToCDCode(new NCTISDataComponent("103.16529", "Collection Setting"));
    CE IMAGING_EXAMINATION_RESULT =
            Converter.convertToCECode(new NCTISDataComponent("102.16145", "Imaging Examination Result"));
    CE REQUESTED_SERVICE =
            Converter.convertToCECode(new NCTISDataComponent("102.20158", "Requested Service"));
    CD SUBJECT_OF_CARE_INSTR_DESC =
            Converter.convertToCECode(
                    new NCTISDataComponent("103.10146", "Subject of Care Instruction Description"));
    CD REQUESTED_SERVICE_DATETIME =
            Converter.convertToCECode(new NCTISDataComponent("103.16635", "Requested Service DateTime"));
    CE CLINICAL_SYNOPSIS =
            Converter.convertToCECode(new NCTISDataComponent("102.15513.4.1.1", "Clinical Synopsis"));
    CD REACTION_EVENT =
            Converter.convertToCDCode(new NCTISDataComponent("102.16474", "Reaction Event"));
    CE DIAGNOSTIC_INVESTIGATIONS =
            Converter.convertToCECode(new NCTISDataComponent("101.20117", "Diagnostic Investigations"));
    CD PATHOLOGICAL_DIAGNOSIS =
            Converter.convertToCDCode(new SNOMED_AU_Code("88101002", "pathology diagnosis") {{
                setCodeSystemVersion("20110531");
            }});
    CD LAB_FINDINGS_INTERPRETATION =
            Converter.convertToCDCode(
                    new SNOMED_AU_Code("386344002", "laboratory findings data interpretation") {{
                        setCodeSystemVersion("20110531");
                    }});
    CD PATH_TEST_COMMENT =
            Converter.convertToCDCode(new NCTISDataComponent("103.16468", "Test Comment"));
    CD TEST_REQ_DETAILS =
            Converter.convertToCDCode(new NCTISDataComponent("102.16160", "Test Request Details"));
    CD TEST_REQ_NAME =
            Converter.convertToCDCode(new NCTISDataComponent("103.11017", "Test Requested Name"));
    CD PATHOLOGY_TEST_RESULT_DATETIME =
            Converter
                    .convertToCDCode(new NCTISDataComponent("103.16605", "Pathology Test Result DateTime"));
    CD INDIVIDUAL_RESULT_COMMENT_CODE =
            Converter.convertToCDCode(new SNOMED_AU_Code("281296001", "result comments") {{
                setCodeSystemVersion("20110531");
            }});
    CD EXAMINATION_REQUESTED_NAME =
            Converter.convertToCDCode(new NCTISDataComponent("103.16512", "Examination Requested Name"));
    CD DICOM_STUDY_IDENTIFIER =
            Converter.convertToCDCode(new NCTISDataComponent("103.16513", "DICOM Study Identifier"));

    CD DICOM_SERIES_IDENTIFIER =
            Converter.convertToCDCode(new NCTISDataComponent("103.16517", "DICOM Series Identifier"));
    CD EXAMINATION_REQUEST_DETAILS =
            Converter.convertToCDCode(new NCTISDataComponent("102.16511", "Examination Request Details"));
    CD EXAMINATION_IMAGE_DETAILS =
            Converter.convertToCDCode(new NCTISDataComponent("103.16515", "Image Details"));
    CD EXAMINATION_REPORT_IDENTIFIER =
            Converter.convertToCDCode(new NCTISDataComponent("103.16514", "Report Identifier"));
    CD SUBJECT_POSITION =
            Converter.convertToCDCode(new NCTISDataComponent("103.16519", "Subject Position"));
    CD IMAGING_EXAMINATION_RESULT_DATETIME = Converter
            .convertToCECode(new NCTISDataComponent("103.16589", "Imaging Examination Result DateTime"));
    CE OTHER_TEST_RESULT = Converter
            .convertToCECode(new NCTISDataComponent("102.16029", "Diagnostic Investigation"));
    CD OTHER_TEST_RESULT_REPORT_STATUS = Converter
            .convertToCDCode(new SNOMED_AU_Code("308552006", "report status") {{
                setCodeSystemVersion("20110531");
            }});
    CV LATERALITY =
            Converter.convertToCVCode(new SNOMED_AU_Code("78615007", "with laterality") {{
                setCodeSystemVersion("20110531");
            }});
    CE EVENT = Converter.convertToCECode(new NCTISDataComponent("101.16006", "Event"));
    CD SPECIALTY = Converter
            .convertToCDCode(new SNOMED_AU_Code("408459003", "Paediatric cardiology"));
    CD PROBLEM_DIAGNOSIS_GLOBAL_STATEMENT = Converter
            .convertToCDCode(new NCTISDataComponent("103.16302.4.3.1", "Global Statement"));
    CE PROBLEM_DIAGNOSIS_THIS_VISIT = Converter
            .convertToCECode(new NCTISDataComponent("101.16142", "Problems/Diagnoses This Visit"));
    CE CLINICAL_INTERVENTIONS_PERF_THIS_VISIT = Converter.convertToCECode(
            new NCTISDataComponent("101.20109", "Clinical Interventions Performed This Visit"));
    CD CLINICAL_SYNOPSIS_DESC = Converter
            .convertToCDCode(new NCTISDataComponent("103.15582", "Clinical Synopsis Description"));
    CE PLAN = Converter.convertToCECode(new NCTISDataComponent("101.16020", "Plan"));
    CE ARRANGED_SERVICES = Converter
            .convertToCECode(new NCTISDataComponent("101.16021", "Arranged Services"));
    CE RECORD_OF_RECOMM_AND_INFO_PROVIDED = Converter.convertToCECode(
            new NCTISDataComponent("101.20016", "Record of Recommendations and Information Provided"));
    CD RECOMMENDATIONS_PROVIDED = Converter
            .convertToCDCode(new NCTISDataComponent("102.20016.4.1.1", "Recommendations Provided"));
    CD INFORMATION_PROVIDED = Converter
            .convertToCDCode(new NCTISDataComponent("102.20016.4.1.2", "Information Provided"));
    CE MEDICATIONS = Converter.convertToCECode(new NCTISDataComponent("101.16022", "Medications"));
    CE CURRENT_MEDICATIONS_ON_DISCHARGE = Converter.convertToCECode(
            new NCTISDataComponent("101.16146.4.1.1", "Current Medications on Discharge"));
    CD CURRENT_MEDICATIONS_ON_DISCHARGE_GLOBAL_STATEMENT = Converter
            .convertToCECode(new NCTISDataComponent("103.16302.4.3.2", "Global Statement"));
    CD REASON_FOR_THERAPEUTIC_GOOD = Converter
            .convertToCDCode(new NCTISDataComponent("103.10141", "Reason for Therapeutic Good"));
    CD CHANGE_DETAIL_REASON_FOR_CHANGE = Converter
            .convertToCDCode(new NCTISDataComponent("103.10177", "Reason for Change"));
    CE CEASED_MEDICATIONS = Converter
            .convertToCECode(new NCTISDataComponent("101.16146.4.1.2", "Ceased Medications"));
    CD CEASED_MEDICATIONS_GLOBAL_STATEMENT = Converter
            .convertToCECode(new NCTISDataComponent("103.16302.4.3.3", "Global Statement"));
    CE HEALTH_PROFILE = Converter
            .convertToCECode(new NCTISDataComponent("101.16011", "Health Profile"));
    CE ALERTS = Converter.convertToCECode(new NCTISDataComponent("101.20021", "Alerts"));
}

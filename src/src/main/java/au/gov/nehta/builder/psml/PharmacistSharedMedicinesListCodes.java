package au.gov.nehta.builder.psml;

import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.CV;

public interface PharmacistSharedMedicinesListCodes {

  String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";

  CD OTHER_DIAGNOSIS_PROCEDURE_ENTRY = Converter.convertToCDCode(
      new CodeImpl("102.15513.132.1.1", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Other Diagnosis Procedure Entry"));
  CV LATERALITY =
      Converter.convertToCVCode(
          new CodeImpl("78615007", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU", "with laterality"));
  CD RESPONSE_NARRATIVE = Converter.convertToCDCode(
      new CodeImpl("102.15513.132.1.2", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Response Narrative"));
  CD RECOMMENDATION = Converter.convertToCDCode(
      new CodeImpl(
          "102.20016", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Recommendation"));
  CD RECOMMENDATIONS_EXCLUSION = Converter.convertToCDCode(
      new CodeImpl("102.16134", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Recommendations Exclusion"));
  CD GLOBAL_STATEMENT = Converter.convertToCDCode(
      new CodeImpl("103.16302.132.1.1", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Global Statement"));
  CE MEDICATIONS = Converter.convertToCECode(
      new CodeImpl("101.16146", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Medications"));
  CE RECOMMENDATIONS = Converter.convertToCECode(
      new CodeImpl("101.16606", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Recommendations"));
  CE RESPONSE_DETAILS = Converter.convertToCECode(
      new CodeImpl("101.16611", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Response Details"));
  /*  CD RESULT_GROUP_SPEC_DETAIL = Converter.convertToCDCode(
        new CodeImpl("102.16156.132.1.1", "1.2.36.1.2001.1001.101",
            "NCTIS Data Components", "Specimen"));*/
  CD SAMPLING_PRECONDITIONS = Converter.convertToCDCode(
      new CodeImpl("103.16171", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Sampling Preconditions"));
  CD SPECIMEN = Converter.convertToCDCode(
      new CodeImpl("102.16156.132.1.1", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components", "Test Specimen Detail"));
  CE PATHOLOGY_TEST_RESULT = Converter.convertToCECode(
      new CodeImpl("102.16144", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Pathology Test Result"));
  CD DATETIME_RECEIVED = Converter.convertToCDCode(
      new CodeImpl("103.11014", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components", "DateTime Received"));
  CD PARENT_SPECIMEN_IDENTIFIER = Converter.convertToCDCode(
      new CodeImpl("103.16187", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Parent Specimen Identifier"));
  CD CLINICAL_INFO = Converter.convertToCDCode(
      new CodeImpl("55752-0", "2.16.840.1.113883.6.1",
          "LOINC", "Clinical information"));
  CD REPORT_STATUS = Converter.convertToCDCode(
      new CodeImpl("308552006", "2.16.840.1.113883.6.96",
          "SNOMED CT-AU", "report status") {{
        setCodeSystemVersion("20110531");
      }});
  CD PATHOLOGY_SERVICE = Converter.convertToCDCode(
      new CodeImpl("310074003", "2.16.840.1.113883.6.96",
          "SNOMED CT-AU", "pathology service") {{
        setCodeSystemVersion("20110531");
      }});
  CE MEDICATION_ORDERS = Converter.convertToCECode(
      new CodeImpl("101.16146", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components", "Medications"));
  CD CHANGE_TYPE = Converter.convertToCDCode(
      new CodeImpl("103.16593", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components", "Change Type"));
  CD CHANGE_STATUS = Converter.convertToCDCode(
      new CodeImpl("103.16595", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components", "Recommendation or Change"));
  CD CHANGE_OR_RECOMMENDATION_REASON = Converter.convertToCDCode(
      new CodeImpl("103.10177", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Change Reason"));
  CD CLINICAL_INDICATION = Converter.convertToCDCode(
      new CodeImpl("103.10141", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Clinical Indication"));
  CE MEDICAL_HISTORY = Converter.convertToCECode(
      new CodeImpl("101.16117", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components", "Medical History"));
  CD UNCATEGORISED_MEDICAL_HISTORY_ITEM = Converter.convertToCDCode(
      new CodeImpl("102.16627", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Uncategorised Medical History Item"));
  CD MEDICALHISTORY_ITEM_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16630",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Medical History Item Comment"));
  CD PROCEDURE_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.15595", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Procedure Comment"));
  CD PROB_OR_DIAG_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16545",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Problem/Diagnosis Comment"));
  CD DIAGNOSIS_INTERPRETATION =
      Converter.convertToCDCode(
          new CodeImpl(
              "282291009", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU", "Diagnosis interpretation"));
  CE IMMUNISATIONS =
      Converter.convertToCECode(
          new CodeImpl(
              "101.16638", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Immunisations"));
  CE ADVERSE_REACTIONS =
      Converter.convertToCECode(
          new CodeImpl(
              "101.20113", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Adverse Reactions"));
  CD ADVERSE_REACTION =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.15517", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Adverse Reaction"));
  CE EVENT_OVERVIEW =
      Converter.convertToCECode(
          new CodeImpl(
              "101.16672", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Event Overview"));
  CD INDIVIDUAL_TEST_RESULT_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl("281296001", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU", "result comments") {{
            setCodeSystemVersion("20110531");
          }});
  CD INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS =
      Converter.convertToCDCode(
          new CodeImpl(
              "281298000", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU", "reference range comments") {{
            setCodeSystemVersion("20110531");
          }});
  CD INDIVIDUAL_TEST_RESULT_STATUS =
      Converter.convertToCDCode(
          new CodeImpl("308552006", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU", "report status") {{
            setCodeSystemVersion("20110531");
          }});
  CD CLINICAL_INFORMATION_PROVIDED =
      Converter.convertToCDCode(
          new CodeImpl("55752-0", "2.16.840.1.113883.6.1",
              "LOINC", "Clinical information"));
  CD IMAGING_EXAMINATION_RESULT_STATUS =
      Converter.convertToCECode(
          new CodeImpl("308552006", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU",
              "report status") {{
            setCodeSystemVersion("20110531");
          }});
  CD IMAGING_EXAMINATION_RESULT_FINDINGS =
      Converter.convertToCECode(
          new CodeImpl("103.16503", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Findings"));

  CD COLLECTION_SETTINGS =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16529",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Collection Setting"));
  CE IMAGING_EXAMINATION_RESULT =
      Converter.convertToCECode(
          new CodeImpl(
              "102.16145",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Imaging Examination Result"));
  CE REQUESTED_SERVICE =
      Converter.convertToCECode(
          new CodeImpl(
              "102.20158", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Requested Service"));
  CD SUBJECT_OF_CARE_INSTR_DESC =
      Converter.convertToCECode(
          new CodeImpl(
              "103.10146",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Subject of Care Instruction Description"));
  CD REQUESTED_SERVICE_DATETIME =
      Converter.convertToCECode(
          new CodeImpl(
              "103.16635",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Requested Service DateTime"));
  CD CLINICAL_SYNOPSIS =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.15513", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Clinical Synopsis"));
  CD REACTION_EVENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16474", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Reaction Event"));
  CE DIAGNOSTIC_INVESTIGATIONS =
      Converter.convertToCECode(
          new CodeImpl(
              "101.20117",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Diagnostic Investigations"));
  CD PATHOLOGICAL_DIAGNOSIS =
      Converter.convertToCDCode(
          new CodeImpl("88101002", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU",
              "pathology diagnosis"));
  CD LAB_FINDINGS_INTERPRETATION =
      Converter.convertToCDCode(
          new CodeImpl(
              "386344002",
              "2.16.840.1.113883.6.96",
              "SNOMED CT-AU",
              "laboratory findings data interpretation") {{
            setCodeSystemVersion("20110531");
          }});
  CD PATH_TEST_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16468", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Test Comment"));
  CD TEST_REQ_DETAILS =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16160",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Test Request Details"));
  CD TEST_REQ_NAME =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.11017",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Test Requested Name"));
  CD PATHOLOGY_TEST_RESULT_DATETIME =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16605",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Pathology Test Result DateTime"));
  CD INDIVIDUAL_RESULT_COMMENT_CODE =
      Converter.convertToCDCode(
          new CodeImpl("281296001", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU", "result comments") {{
            setCodeSystemVersion("20110531");
          }});
  CD EXAMINATION_REQUESTED_NAME =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16512",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Examination Requested Name"));
  CD DICOM_STUDY_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16513",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "DICOM Study Identifier"));

  CD DICOM_SERIES_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16517",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "DICOM Series Identifier"));
  CD EXAMINATION_REQUEST_DETAILS =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16511",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Examination Request Details"));
  CD EXAMINATION_IMAGE_DETAILS =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16515", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Image Details"));
  CD EXAMINATION_REPORT_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16514", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Report Identifier"));
  CD SUBJECT_POSITION =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16519", "1.2.36.1.2001.1001.101",
              "NCTIS Data Components", "Subject Position"));
  CD IMAGING_EXAMINATION_RESULT_DATETIME = Converter.convertToCECode(
      new CodeImpl(
          "103.16589",
          "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Imaging Examination Result DateTime"));
  CE OTHER_TEST_RESULT = Converter.convertToCECode(
      new CodeImpl("102.16029", "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Diagnostic Investigation"));
  CD OTHER_TEST_RESULT_REPORT_STATUS = Converter
      .convertToCDCode(
          new CodeImpl("308552006", "2.16.840.1.113883.6.96",
              "SNOMED CT-AU", "report status") {{
            setCodeSystemVersion("20110531");
          }});


}

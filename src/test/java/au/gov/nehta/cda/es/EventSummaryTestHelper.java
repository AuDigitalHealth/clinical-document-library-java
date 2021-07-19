package au.gov.nehta.cda.es;

import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.HL7ObservationInterpretationNormality;
import au.gov.nehta.model.cda.common.code.LOINC;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.clinical.common.types.Quantity;
import au.gov.nehta.model.clinical.common.types.QuantityRange;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.es.*;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class EventSummaryTestHelper {

    private static String attachmentDir = null;

    static {
        Path resourceDirectory = Paths.get("src", "test", "resources");
        attachmentDir = resourceDirectory.toFile().getAbsolutePath() + "/";
    }

    public static PathologyTestResult createPathologyResults(Boolean mandatorySectionsOnly)
        throws IOException {

        // It is best to think of PathologyTestResult as one Report/Panel or OBR in a HL7 V2 ORU Message
        PathologyTestResult pathologyTestResult = new PathologyTestResultImpl();

        // This is the overall report or panel name, it is akin to OBR-4 in a HL7 V2 ORU message
        Coded testResultName = new CodeImpl(
                "FBC", // The local code used by the LIS system
                "2.999.100",
                // Needs to be a real OID for the Pathology Report names of this LIS system at this installation
                "ACME Laboratories Report CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                "Full blood count",//The display name of the code 'FBP'
                "Full blood count"
                // What the LIS user saw when selecting the code, might be different to the display name of the code, or the same
        );
        pathologyTestResult.setTestResultName(testResultName);
        // Translations are not mandatory and for Pathology should be SNOMED if provided
        testResultName.getTranslations().add(new CodeImpl() {{
            setCode("26604007");
            setCodeSystem("2.16.840.1.113883.6.96");
            setDisplayName("Complete blood count");
            // setOriginalText("Complete blood count");
        }});

        // Clinical Notes
        pathologyTestResult.setClinicalInformationProvided("Feeling lethargic");

        // The status of the entire panel, akin to OBR-25 in HL7 V2, the HL7 V2 terms
        // would need to be mapped to the ValueSet used in here
        Coded overallTestResultStatus = new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                "NCTIS Result Status Values", "Final", "Final");
        pathologyTestResult.setOverallPathologyTestResultStatus(overallTestResultStatus);

        // Pathology Department performing the analysis (DiagnosticServiceSectionID), OBR-24
        pathologyTestResult.setDiagnosticService(DiagnosticServiceSectionID.Hematology);

        // Collection DateTime, with TimeZone and Precision of min e.g '20-06-2019 9:00 +1000'
        // Found in OBR-7 in a HL7 V2 ORM Message
        pathologyTestResult.setObservationDateTime(
                new PrecisionDate(Precision.MINUTE, ZonedDateTime.of(2019, 6, 20, 11,
                        20, 0, 0, ZoneId.systemDefault())));

        // List of Pathology Panels or an OBR Segment in HL7 V2

        // The TestResultGroup is akin to the OBX.4 (Observation Sub-Id) in a HL7 V2 message
        // In a FBC example it does not seem to make sense as there are generally no SubIds in use.
        // However there is effectively one SubID that being the Parent, which is just the FBC its self.
        // For this reason we just repeat the same name for the ResultGroupName as used for the TestResultName above.
        // However, in a structured Urine MC & S report (See next example) there would be meaning full groups
        // such as (Microscopy urine, Culture1, Culture2)
        ResultGroup fullBloodCountResultGroup = new ResultGroup();
        fullBloodCountResultGroup
                .setPathologyTestResultGroupName(pathologyTestResult.getTestResultName());

        // The list of atomic results e.g (WCC, HB, PLT ..etc), is akin to the OBX segments under the OBR segment in HL7 V2
        List<Result> individualResults = new ArrayList<>();
        fullBloodCountResultGroup.setIndividualPathologyTestResults(individualResults);

        //==================================================================================================
        // HB: Haemoglobin
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result hbResult = new Result();
        // The code of the Atomic result , akin to OBX.3
        Coded hbResultName = new CodeImpl("58745656",// The local code used by the LIS system
                "2.999.200",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                "Haemoglobin",//The display name of the code 'FBP'
                "Haemoglobin"
                // What the LIS user saw when selecting the code, might be different to the display name of the code, or the same
        );
        hbResult.setIndividualPathologyTestResultName(hbResultName);

        // Translations are not mandatory but shoudl be LOINC if provided
        hbResultName.getTranslations().add(new CodeImpl() {{
            // The mapped/Translated LOINC Term associated to this local code, see the
            // RCPA Haematology Terminology https://www.rcpa.edu.au/Library/Practising-Pathology/PTIS/APUTS-Downloads
            setCode("718-7");
            setCodeSystem(LOINC.CODE_SYSTEM);
            setCodeSystemName(LOINC.CODE_SYSTEM_NAME);
            setDisplayName("Hemoglobin");
        }});

        // The atomic result's value and it's unit, in OBX-5 and OBX-6
        ResultValue hbResultValue = new ResultValue();
        hbResult.setIndividualPathologyTestResultValue(hbResultValue);
        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT,
        //    "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actualy carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        hbResultValue.setQuantityResultValue(new Quantity("189", "g/L"));

        // Abnormal Flag as per HL7 V2 OBX.8
        ReferenceRangeDetails hbReferenceRangeDetails = new ReferenceRangeDetails();
        hbReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.High.getAsCoded());
        // Reference Range
        // The atomic result's Reference Range, OBX-7, the units are the same as the result value from OBX.6
        // You can have a list of different types of ranges 'Normal', Critical' or 'Therapeutic' but in general
        // you will usually only encounter one range which will be the 'Normal' range.
        hbReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // Here is the range values Height, then Low, and then units
                // TODO: There is a problem here in that the library cannot handle open-ended ranges such as <100 or >100
                // which are very common in Pathology
                setReferenceRange(new QuantityRange(180, 130, "g/L"));
                // You need this to state that the ReferenceRange is a 'Normal' range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        hbResultValue.setReferenceRangeDetails(hbReferenceRangeDetails);

        // Any guidance about the Reference Range.
        // Typically this type of guidance, if provided, is found in the text comment for the panel and cannot
        // be easily obtained by implementers to place here.
        // Most implementations, especially ones based off HL7 V2 transforms will struggle to set this property
        // at all. The guidance will just be in the another
        hbResult.setIndividualPathologyTestResultReferenceRangeGuidance(
                "Hb normal ranges were modified on the 20/02/018");

        // Set the hb result comment
        hbResult.setIndividualPathologyTestResultComment(
                "This is a comment that could be provided about the HB result");

        // The status of the actual HB result, Final: 3, Interim 2, Amended 4, Cancelled/Aborted : 5
        // Would be mapped from OBX-11 Observation Result Status
        hbResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));
        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(hbResult);
        List<ResultGroup> pathologyResultGroups = new ArrayList<>();
        pathologyTestResult.setResultGroups(pathologyResultGroups);

        //==================================================================================================
        // Red Cell Count: (Erythrocytes)
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result rccResult = new Result();
        // The code of the Atomic result , akin to OBX.3
        rccResult.setIndividualPathologyTestResultName(
                new CodeImpl("456337895",// The local code used by the LIS system
                        "2.999.200",
                        // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                        "ACME Laboratories Atomic Result CodeSystem",
                        // The name of the set of codes in use in this LIS system at this installation
                        "Red Cell Count",//The display name of the code 'FBP'
                        "Red Cell Count") {{
                    // The mapped/Translated LOINC Term accosiatedd to this local code, see the
                    // RCPA Haematology Terminology https://www.rcpa.edu.au/Library/Practising-Pathology/PTIS/APUTS-Downloads
                    getTranslations().add(new CodeImpl() {{
                        setCode("789-8");
                        setCodeSystem(LOINC.CODE_SYSTEM);
                        setCodeSystemName(LOINC.CODE_SYSTEM_NAME);
                        setDisplayName("Red Cell Count");
                    }});
                }}); // What the LIS user saw when selecting the code, might be different to the display name of the code,
        // or the same

        ResultValue rccResultValue = new ResultValue();
        rccResult.setIndividualPathologyTestResultValue(rccResultValue);
        // The atomic result's value and its unit, OBX-5 and OBX-6
        rccResultValue.setQuantityResultValue(new Quantity("5.30", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails rccReferenceRangeDetails = new ReferenceRangeDetails();
        rccReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        rccReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(6.5, 4.5, "g/L"));
                // You need this to state that the ReferenceRange is a Normal Range as opposed to a 'Critical' or 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        rccResultValue.setReferenceRangeDetails(rccReferenceRangeDetails);
        rccResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(rccResult);

        //==================================================================================================
        // HCT: Hematocrit
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result hctResult = new Result();
        // The code of the Atomic result , akin to OBX.3
        hctResult.setIndividualPathologyTestResultName(new CodeImpl(
                "7854343223",// The local code used by the LIS system
                "2.999.200",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                "Hematocrit",  // The display name of the code 'FBP'
                "Hematocrit"
                // What the LIS user saw when selecting the code, might be different to the display name of the code, or the same
        ) {{
            // The mapped/Translated LOINC Term accosiatedd to this local code, see the
            // RCPA Haematology Terminology https://www.rcpa.edu.au/Library/Practising-Pathology/PTIS/APUTS-Downloads
            getTranslations().add(new CodeImpl() {{
                setCode("4544-3");
                setCodeSystem(LOINC.CODE_SYSTEM);
                setCodeSystemName(LOINC.CODE_SYSTEM_NAME);
                setDisplayName("Hematocrit");
            }});
            // Invalid translation example below - with Original Text which must be null or empty
      /*getTranslations().add(new CodeImpl() {{
        setCode("4544-3");
        setCodeSystem(LOINC.CODE_SYSTEM);
        setCodeSystemName(LOINC.CODE_SYSTEM_NAME);
        setDisplayName("Hematocrit");
        setOriginalText("Original Text Must not be initialized for translation");
      }});*/
        }});

        ResultValue hctResultValue = new ResultValue();
        hctResult.setIndividualPathologyTestResultValue(hctResultValue);
        // The atomic result's value and its unit, OBX-5 and OBX-6
        hctResultValue.setQuantityResultValue(new Quantity("0.43", "L/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails hctReferenceRangeDetails = new ReferenceRangeDetails();
        hctReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        hctReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // You need this to state that the ReferenceRange is a Normal Range as opposed to a 'Critical' or 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(0.54, 0.40, "L/L"));
            }});
        }});
        hctResultValue.setReferenceRangeDetails(hctReferenceRangeDetails);
        hctResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(hctResult);

        //==================================================================================================
        // MCV - Mean Cell Volume
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result mcvResult = new Result();
        // The code of the Atomic result , akin to OBX.3
        mcvResult.setIndividualPathologyTestResultName(new CodeImpl(
                "6322353455", // The local code used by the LIS system
                "2.999.200",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                "Mean Cell Volume", // The display name of the code 'FBP'
                "Mean Cell Volume"
                // What the LIS user saw when selecting the code, might be different to the display name of the code, or the same
        ));

        ResultValue mcvResultValue = new ResultValue();
        mcvResult.setIndividualPathologyTestResultValue(mcvResultValue);
        // The atomic result's value and its unit, OBX-5 and OBX-6
        mcvResultValue.setQuantityResultValue(new Quantity("81", "fL"));

        ReferenceRangeDetails mcvReferenceRangeDetails = new ReferenceRangeDetails();
        // Abnormal Flag as per4 HL7 V2 OBX.8
        mcvReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        mcvReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                setReferenceRange(new QuantityRange(96, 80, "fL"));
                // You need this to state that the ReferenceRange is a Normal Range as opposed to a 'Critical' or 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        mcvResultValue.setReferenceRangeDetails(mcvReferenceRangeDetails);
        mcvResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(mcvResult);

        //==================================================================================================
        // MCH - Mean Cell Hemoglobin
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result mchResult = new Result();
        // The code of the Atomic result , akin to OBX.3
        mchResult.setIndividualPathologyTestResultName(new CodeImpl(
                "62109543",// The local code used by the LIS system
                "2.999.200",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                "Mean Cell Hemoglobin", // The display name of the code 'FBP'
                "Mean Cell Hemoglobin"
                // What the LIS user saw when selecting the code, might be different to the display name of the code, or the same
        ));

        ResultValue mchResultValue = new ResultValue();
        // The atomic result's value and its unit, OBX-5 and OBX-6
        mchResultValue.setQuantityResultValue(new Quantity("27.4", "pg"));
        mchResult.setIndividualPathologyTestResultValue(mchResultValue);
        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails mchReferenceRangeDetails = new ReferenceRangeDetails();
        mchReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        mchReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // You need this to state that the ReferenceRange is a Normal Range as opposed to a 'Critical' or
                // 'Therapeutic' range
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(32.0, 24.0, "pg"));
            }});
        }});
        mchResultValue.setReferenceRangeDetails(mchReferenceRangeDetails);
        mchResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(mchResult);

        //==================================================================================================
        // MCHC - Mean Cell Hemoglobin Concentration
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result mchcResult = new Result();

        // The code of the Atomic result , akin to OBX.3
        Coded mchcResultName = new CodeImpl(
                "2333342107", // The local code used by the LIS system
                "2.999.200",
                //Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                //The name of the set of codes in use in this LIS system at this installation
                //The display name of the code 'FBP'
                "Mean Cell Hemoglobin Concentration",
                //What the LIS user saw when selecting the code, might be different to the display name of the code,
                //or the same
                "Mean Cell Hemoglobin Concentration");

        mchcResult.setIndividualPathologyTestResultName(mchcResultName);

        // The atomic result's value and its unit, OBX-5 and OBX-6
        ResultValue mchcResultValue = new ResultValue();
        mchcResult.setIndividualPathologyTestResultValue(mchcResultValue);
        mchcResult.setIndividualPathologyTestResultValue(mchcResultValue);
        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT,
        //    "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actually carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        mchcResultValue.setQuantityResultValue(new Quantity("338", "g/L"));

        //Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails mchcReferenceRangeDetails = new ReferenceRangeDetails();
        mchcReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        mchcReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(360, 320, "g/L"));
                // You need this to state that the ReferenceRange is a 'Normal' range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        mchcResultValue.setReferenceRangeDetails(mchcReferenceRangeDetails);
        mchcResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(mchcResult);

        //==================================================================================================
        // PLAT - Platelet
        //==================================================================================================

        //A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result platResult = new Result();

        Coded platResultCode = new CodeImpl(
                "87687987",  // The local code used by the LIS system
                "2.999.200",
                // Need to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                // The display name of the code 'FBP'
                "Platelet",
                // What the LIS user saw when selecting the code, might be different to the display name of the code,
                // or the same
                "Platelet");

        platResult.setIndividualPathologyTestResultName(platResultCode);

        // The atomic result's value and its unit, OBX-5 and OBX-6
        ResultValue platResultValue = new ResultValue();
        platResult.setIndividualPathologyTestResultValue(platResultValue);

        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT,
        //    "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actually carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        platResultValue.setQuantityResultValue(new Quantity("198", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails platReferenceRangeDetails = new ReferenceRangeDetails();
        platReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        platReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(400, 150, "g/L"));
                // You need this to state that the ReferenceRange is a Normal Range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        platResultValue.setReferenceRangeDetails(platReferenceRangeDetails);
        platResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(platResult);

        //==================================================================================================
        // WCC : White Cell Count
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result wccResult = new Result();

        // The code of the Atomic result , akin to OBX.3
        wccResult.setIndividualPathologyTestResultName(
                new CodeImpl("87736222225",// The local code used by the LIS system
                        "2.999.200",
                        // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                        "ACME Laboratories Atomic Result CodeSystem",
                        // The name of the set of codes in use in this LIS system at this installation
                        "White Cell Count",//The display name of the code 'FBP'
                        "White Cell Count") {{
                    // The mapped/Translated LOINC Term associated to this local code, see the
                    // RCPA Haematology Terminology https://www.rcpa.edu.au/Library/Practising-Pathology/PTIS/APUTS-Downloads
                    getTranslations().add(new CodeImpl() {{
                        setCode("6690-2");
                        setCodeSystem(LOINC.CODE_SYSTEM);
                        setCodeSystemName(LOINC.CODE_SYSTEM_NAME);
                        setDisplayName("White Cell Count");
                    }});
                    // What the LIS user saw when selecting the code, might be different to the display name of the code, or the same
                }});

        ResultValue wccResultValue = new ResultValue();
        wccResult.setIndividualPathologyTestResultValue(wccResultValue);
        // The atomic result's value and its unit, OBX-5 and OBX-6
        wccResultValue.setQuantityResultValue(new Quantity("12.1", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails wccReferenceRangeDetails = new ReferenceRangeDetails();
        wccReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        wccReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(11.0, 4.0, "g/L"));
                // You need this to state that the ReferenceRange is a Normal Range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        wccResultValue.setReferenceRangeDetails(wccReferenceRangeDetails);
        wccResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(wccResult);

        //==================================================================================================
        // NEUTS : Neutrophils
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result neutsResult = new Result();

        // The code of the Atomic result , akin to OBX.3
        Coded neutsResultName = new CodeImpl(
                "13546224", // The local code used by the LIS system
                "2.999.200",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                // The display name of the code 'FBP'
                "Neutrophils",
                // What the LIS user saw when selecting the code, might be different to the display name of the code,
                // or the same
                "Neutrophils");

        neutsResult.setIndividualPathologyTestResultName(neutsResultName);

        // The atomic result's value and its unit, OBX-5 and OBX-6
        ResultValue neutsResultValue = new ResultValue();
        neutsResult.setIndividualPathologyTestResultValue(neutsResultValue);

        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT,
        //    "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actually carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        neutsResultValue.setQuantityResultValue(new Quantity("9.3", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails neutsReferenceRangeDetails = new ReferenceRangeDetails();
        neutsReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        neutsReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(7.5, 2.0, "g/L"));
                // You need this to state that the ReferenceRange is a 'Normal' range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        neutsResultValue.setReferenceRangeDetails(neutsReferenceRangeDetails);
        neutsResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));
        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(neutsResult);

        //==================================================================================================
        // LYMPHOS : Lymphocytes
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result lymphosResult = new Result();

        // The code of the Atomic result , akin to OBX.3
        Coded lymphosResultName = new CodeImpl(
                "34268543", // The local code used by the LIS system
                "2.999.200",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                // The display name of the code 'FBP'
                "Lymphocytes",
                // What the LIS user saw when selecting the code, might be different to the display name of the code,
                // or the same
                "Lymphocytes");

        lymphosResult.setIndividualPathologyTestResultName(lymphosResultName);

        // The atomic result's value and its unit, OBX-5 and OBX-6
        ResultValue lymphosResultValue = new ResultValue();
        lymphosResult.setIndividualPathologyTestResultValue(lymphosResultValue);

        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT,
        //    "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actually carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        lymphosResultValue.setQuantityResultValue(new Quantity("2.1", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails lymphosReferenceRangeDetails = new ReferenceRangeDetails();
        lymphosReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        lymphosReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(4.0, 1.0, "g/L"));
                // You need this to state that the ReferenceRange is a 'Normal' range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        lymphosResultValue.setReferenceRangeDetails(lymphosReferenceRangeDetails);
        lymphosResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(lymphosResult);

        //==================================================================================================
        // MONOS : Monocytes
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result monosResult = new Result();

        // The code of the Atomic result , akin to OBX.3
        Coded monosResultName = new CodeImpl(
                "867645352", // The local code used by the LIS system
                "2.999.200",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                // The display name of the code 'FBP'
                "Monocytes",
                // What the LIS user saw when selecting the code, might be different to the display name of the code,
                // or the same
                "Monocytes");

        monosResult.setIndividualPathologyTestResultName(monosResultName);

        // The atomic result's value and its unit, OBX-5 and OBX-6
        ResultValue monosResultValue = new ResultValue();
        monosResult.setIndividualPathologyTestResultValue(monosResultValue);

        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT, "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actually carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        monosResultValue.setQuantityResultValue(new Quantity("0.7", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails monosReferenceRangeDetails = new ReferenceRangeDetails();
        monosReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        monosReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(0.8, 0.1, "g/L"));
                // You need this to state that the ReferenceRange is a 'Normal' range as opposed to a 'Critical' or 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        monosResultValue.setReferenceRangeDetails(monosReferenceRangeDetails);
        monosResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(monosResult);

        //==================================================================================================
        // EOS : Eosinophils
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result eosResult = new Result();

        // The code of the Atomic result , akin to OBX.3
        Coded eosResultName = new CodeImpl(
                "53075433", // The local code used by the LIS system
                "2.999.1",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                "Eosinophils", //The display name of the code 'FBP'
                // What the LIS user saw when selecting the code, might be different to the display name of the code,
                // or the same
                "Eosinophils");

        eosResult.setIndividualPathologyTestResultName(eosResultName);

        // The atomic result's value and its unit, OBX-5 and OBX-6
        ResultValue eosResultValue = new ResultValue();
        eosResult.setIndividualPathologyTestResultValue(eosResultValue);

        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT,
        //    "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actually carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        eosResultValue.setQuantityResultValue(new Quantity("0.0", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails eosReferenceRangeDetails = new ReferenceRangeDetails();
        eosReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        eosReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(0.4, 0.0, "g/L"));
                // You need this to state that the ReferenceRange is a 'Normal' range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        eosResultValue.setReferenceRangeDetails(eosReferenceRangeDetails);
        eosResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(eosResult);

        //==================================================================================================
        // BASOS : Basophils
        //==================================================================================================

        // A single Atomic result value for White Cell Count (WCC), an OBX in HL7 V2
        Result basosResult = new Result();

        // The code of the Atomic result , akin to OBX.3
        Coded basosResultName = new CodeImpl(
                "917542254", // The local code used by the LIS system
                "2.999.2",
                // Needs to be a real OID for the Pathology Result names of this LIS system at this installation
                "ACME Laboratories Atomic Result CodeSystem",
                // The name of the set of codes in use in this LIS system at this installation
                "Basophils", //The display name of the code 'FBP'
                // What the LIS user saw when selecting the code, might be different to the display name of the code,
                // or the same
                "Basophils");

        basosResult.setIndividualPathologyTestResultName(basosResultName);

        // The atomic result's value and its unit, OBX-5 and OBX-6
        ResultValue basosResultValue = new ResultValue();
        basosResult.setIndividualPathologyTestResultValue(basosResultValue);

        // There can be many different types of result values:
        // -Numbers are Quantity e.g 145 or 2.3
        //    HB.ResultValue.TestResultValue = BaseCDAModel.CreateQuantity("145", "g/L");
        // -Numeric Ranges are QuantityRange e.g (2.0 - 6.8)
        //    HB.ResultValue.ValueAsQuantityRange = BaseCDAModel.CreateQuantityRange(100, 10, "g/L")
        // -Codes are CodableText e.g Negative, Positive, Equivocal, Detected, Not Detected
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Code", CodingSystem.SNOMEDCT, "CodeDisplayName");
        // -Text are CodableText e.g "Some long string comment or statement", please note you must map line breaks such
        //  as HL7 V2's \.br\ to actually carriage return.
        //    HB.ResultValue.ValueAsCodableText = BaseCDAModel.CreateCodableText("Some long string comment or statement");
        basosResultValue.setQuantityResultValue(new Quantity("0.0", "g/L"));

        // Abnormal Flag as per4 HL7 V2 OBX.8
        ReferenceRangeDetails basosReferenceRangeDetails = new ReferenceRangeDetails();
        basosReferenceRangeDetails
                .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());

        // Reference Range
        basosReferenceRangeDetails.setReferenceRange(new ArrayList<ReferenceRange>() {{
            add(new ReferenceRange() {{
                // The atomic result's  Reference Range, OBX-7, the units are the same as the result value from OBX.6
                setReferenceRange(new QuantityRange(0.2, 0.0, "g/L"));
                // You need this to state that the ReferenceRange is a 'Normal' range as opposed to a 'Critical' or
                // 'Therapeutic' range.
                setReferenceRangeMeaning(
                        new CodeImpl("260395002", "2.16.840.1.113883.6.96",
                                "SNOMED CT-AU", "Normal Range",
                                "Normal Range"));
            }});
        }});
        basosResultValue.setReferenceRangeDetails(basosReferenceRangeDetails);
        basosResult.setIndividualPathologyTestResultStatus(
                new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
                        "NCTIS Result Status Values", "Final"));

        fullBloodCountResultGroup.getIndividualPathologyTestResults().add(basosResult);

        //==================================================================================================
        // End of Atomic Results (OBXs)
        //==================================================================================================

        // Add the whole Group to the FBC
        // pathologyTestResult.ResultGroup.Add(FBC_Group);
        pathologyTestResult.getResultGroups().add(fullBloodCountResultGroup);

        List<TestSpecimenDetail> specimenDetailList = new ArrayList<>();
        TestSpecimenDetail specimenDetail = new TestSpecimenDetailImpl();
        HandlingAndProcessing handlingAndProcessing = new HandlingAndProcessing();
        handlingAndProcessing.setCollectionDateTime(
                new PrecisionDate(Precision.MINUTE,
                        ZonedDateTime.of(2019, 6, 20, 10, 0, 0, 0, ZoneId.systemDefault())));
        handlingAndProcessing.setReceiptDateTime(
                new PrecisionDate(Precision.MINUTE,
                        ZonedDateTime.of(2019, 6, 20, 11, 0, 0, 0, ZoneId.systemDefault())));
        specimenDetail.setSpecimenTissueType(new CodeImpl() {{
            setOriginalText("Blood");
        }});
        specimenDetail.setHandlingAndProcessing(handlingAndProcessing);

        // Anatomical Site
        /*List<AnatomicalSite> anatomicalSites = new ArrayList<>();
        anatomicalSites.add(EventSummaryMaxTest.getAnatomicalSite("SpecimenDetail"));
        // anatomicalSites.add(EventSummaryMaxTest.getAnatomicalSite());
        specimenDetail.setAnatomicalSites(anatomicalSites);*/

        // Collections and handling
        CollectionAndHandling collectionsAndHandling = new CollectionAndHandling();
        collectionsAndHandling.setSamplingPreconditions(
                new CodeImpl("16214131000119104",
                        "2.16.840.1.113883.6.96",
                        "SNOMED CT",
                        "Frozen tissue section specimen", "Frozen tissue section specimen"));
        specimenDetail.setCollectionAndHandling(collectionsAndHandling);

        // Identifiers
        Identifiers identifiers = new IdentifiersImpl();
        identifiers.setSpecimenIdentifier(
                new UniqueIdentifierImpl("2.999.78", "123456789"));
        identifiers.setParentSpecimenIdentifier(new UniqueIdentifierImpl("2.999.5",
                "1029384756"));
        identifiers.setContainerSpecimenIdentifier(new UniqueIdentifierImpl("2.999.6",
                "9087654321"));
        specimenDetail.setIdentifiers(identifiers);

        // Physical Details
        List<PhysicalDetails> physicalDetailsList = new ArrayList<>();
        PhysicalDetails physicalDetails = new PhysicalDetails();
        Dimensions dimensions = new Dimensions();
        physicalDetails.setDimensions(dimensions);
        physicalDetails.setDescription("0.5 cm x 0.5 cm excised nevus");
        physicalDetails.setImage(getAttachedMedia("", Optional.empty()));
        Quantity weight = new Quantity("2", "mg");
        physicalDetails.setWeight(weight);
        physicalDetailsList.add(physicalDetails);
        specimenDetail.setPhysicalDetails(physicalDetailsList);

        specimenDetailList.add(specimenDetail);
        pathologyTestResult.setTestSpecimenDetails(specimenDetailList);

        // The Collection Date and Time is the only mandatory element required in SpecimenDetail
        // Found in OBR-7 in a HL7 V2 ORM Message
        // You would generally have the DateTime the specimens came into the lab in OBR-14 so you could populate this
        // however, it is not mandatory
        // Not required and unlikely to have it in a HL7 V2 message, it might be in a SAC segment
        // in a ORM order message not ORU reports
        // Optional: Can be a list of codified Diagnosis in SNOMED or some other terminology
        // Generally not found in HL7 V2 Messages. More a concept used in Anatomical pathology then general pathology

        // [Optional] : pathologyTestResult.PathologicalDiagnosis = new List<ICodableText>();
        // pathologyTestResult.setDiagnosticService();
        // Optional: Rarely seen and difficult to obtain as a separate element if coming from a HL7 V2 message.
        // Not impossible  but difficult as it will be in one of the OBXs and needs to be located.
        // pathologyTestResult.Conclusion = "I could write a final conclusion for the whole FBC panel";
        pathologyTestResult.setConclusion("I could write a final conclusion for the whole FBC panel");
        // pathologyTestResult.setTestResultRepresentation(getAttachedMediaPDF("radiologyreport.pdf"));

        // Optional: If coming from a HL7 V2 message this can be difficult as it will be one of the OBX segments
        // and could be identified in OBX.3.1 in different ways across different panels/reports due to the lab not follow a
        // strict terminology policy when creating the panel config
        // pathologyTestResult.TestComment = "I could write an overall comment for the whole FBC panel";
        pathologyTestResult.setTestComment("I could write an overall comment for the whole FBC panel");

        // Optional: Here you can state the Test that was asked for or order which maybe different to the test performed
        // More importantly the LabNumber can go here which i slightly advisable although optional.
        //LabNumber is generally found in OBR.3

        TestRequestDetails testRequestDetails = new TestRequestDetails();
        List<Coded> codedList = new ArrayList<>();
        Coded code = new CodeImpl("CBC", "2.999.3",
                "ACME Laboratories Atomic Result CodeSystem",
                "Full Blood Count",
                "Full Blood Count");
        codedList.add(code);
        testRequestDetails.setTestRequestedNames(codedList);
        pathologyTestResult.setTestRequestDetails(testRequestDetails);



   /* TestRequestDetail.Code = "CBC"; // The code used by some Pathology Ordering system
    TestRequestDetail.CodeSystemCode = "2.999.300"; //Needs to be a real OID for the Pathology Ordering system's set
    of ordering codes
    TestRequestDetail.CodeSystemName = "ACME Pathology Ordering Catalog"; //The name of the set of codes in use in
    Pathology Ordering system      TestRequestDetail.DisplayName = "Complete Blood Count"; //The display name of the
    code 'FBP'
    TestRequestDetail.OriginalText = "Complete Blood Count";*/ //What the Ordering user saw when selecting the code,
        // might be different to the display name of the code, or the same

        // Filer Order Number (labNumber) OBR.3
   /* Requested.LaboratoryTestResultIdentifier = BaseCDAModel
        .CreateInstanceIdentifier("2.999.400", "19P123456-FBC");
    pathologyTestResult.TestRequestDetails.Add(Requested);*/

        pathologyTestResult.getTestRequestDetails().setLaboratoryTestResultIdentifier(
                new UniqueIdentifierImpl("2.999.4", "19P123456-FBC"));
        return pathologyTestResult;
    }

    public static AttachedMedia getAttachedMedia(String fileNameStr,
                                                 Optional<String> attachmentDirOverrideValue)
        throws IOException {
        File media = new File(String.format("%sx-ray%s.jpg", attachmentDir, fileNameStr));
        if (media.exists()) {
            return new AttachedMedia(media);
        } else {
            throw new FileNotFoundException(
                    String.format("Media unavailable: %sx-ray%s.jpg", attachmentDir, fileNameStr));
        }
    }
}

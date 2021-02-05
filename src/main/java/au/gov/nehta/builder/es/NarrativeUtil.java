package au.gov.nehta.builder.es;

import static au.gov.nehta.builder.DocumentCreatorUtil.add;
import static au.gov.nehta.builder.DocumentCreatorUtil.addBody;
import static au.gov.nehta.builder.DocumentCreatorUtil.addCaption;
import static au.gov.nehta.builder.DocumentCreatorUtil.addHeader;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.getBoldTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.getNormalTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.link;
import static au.gov.nehta.builder.DocumentCreatorUtil.print;
import static au.gov.nehta.builder.DocumentCreatorUtil.safe;

import au.gov.nehta.builder.common.NarrativeUtilCommon;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.es.AnatomicalSite;
import au.gov.nehta.model.clinical.es.EventDetails;
import au.gov.nehta.model.clinical.es.ExaminationRequestDetails;
import au.gov.nehta.model.clinical.es.ImagingExaminationResult;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultGroup;
import au.gov.nehta.model.clinical.es.ImagingResult;
import au.gov.nehta.model.clinical.es.Immunisations;
import au.gov.nehta.model.clinical.es.OtherTestResult;
import au.gov.nehta.model.clinical.es.PathologyTestResult;
import au.gov.nehta.model.clinical.es.PhysicalDetails;
import au.gov.nehta.model.clinical.es.ReferenceRange;
import au.gov.nehta.model.clinical.es.RequestedService;
import au.gov.nehta.model.clinical.es.ResultGroup;
import au.gov.nehta.model.clinical.es.ResultValue;
import au.gov.nehta.model.clinical.es.TestSpecimenDetail;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocContent;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocRenderMultiMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.io.Serializable;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.StringJoiner;
import java.util.stream.Collectors;
import javax.xml.bind.JAXBElement;

/**
 * Utility class for Narrative renderings of Event Summary sections
 */
public class NarrativeUtil {

    private static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";
    private static ObjectFactory objectFactory = new ObjectFactory();

    static StrucDocText getEventDetails(EventDetails eventDetails) {
        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        if (null != eventDetails.getCustomNarrative()) {
            narrative = eventDetails.getCustomNarrative();
        } else {
            StrucDocTable eventDetailsTable = objectFactory.createStrucDocTable();
            addCaption(eventDetailsTable, "Clinical Summary");
            addHeader(eventDetailsTable, "Description");
            StrucDocTbody eventDetailsTBody = addBody(eventDetailsTable);
            add(eventDetailsTBody, safe(eventDetails.getClinicalSynopsisDesc()));
            addTable(narrative, eventDetailsTable);
        }
        return narrative;
    }

    private static StrucDocContent getAnatomicalSites(
            List<AnatomicalSite> anatomicalSites) {
        StrucDocContent anatomicalSitesNarrative = objectFactory.createStrucDocContent();
        if (null != anatomicalSites && !anatomicalSites.isEmpty()) {
            anatomicalSites.stream().filter(Objects::nonNull).forEach(anatomicalSite -> {
                StrucDocTable anatomicalSitesTable = objectFactory.createStrucDocTable();
                StrucDocTbody anatomicalSiteBody = addBody(anatomicalSitesTable);
                addCaption(anatomicalSitesTable, "Anatomical site");
                addHeader(anatomicalSitesTable, "Field", "Value");
                add(anatomicalSiteBody, getBoldTextTd("Location"),
                        getNormalTextTd(
                                safe(print(anatomicalSite.getSpecificLocation().getAnatomicalLocationName()))));
                add(anatomicalSiteBody, getBoldTextTd("Side"),
                        getNormalTextTd(safe(print(anatomicalSite.getSpecificLocation().getSide()))));
                add(anatomicalSiteBody, getBoldTextTd("Date and Time of Receipt"),
                        getNormalTextTd(safe(anatomicalSite.getAnatomicalLocationDesc())));
                anatomicalSitesNarrative
                        .getContent().add(objectFactory.createStrucDocTextTable(anatomicalSitesTable));
                //Add Anatomical Site Images
                anatomicalSite.getAnatomicalLocationImages().stream().filter(Objects::nonNull).forEach(
                        attachedMedia -> {
                            if (null != attachedMedia.getFileName()) {
                                anatomicalSitesNarrative.getContent().add(
                                        getMultimediaFromAttachedMedia(attachedMedia, "Anatomical Site %s"));
                            }
                        });
            });
        }
        return anatomicalSitesNarrative;
    }

    private static StrucDocContent getTestSpecimenDetails(
            List<TestSpecimenDetail> testSpecimenDetails) {
        StrucDocContent testSpecimenDetailsNarrative = objectFactory.createStrucDocContent();
        if (null != testSpecimenDetails && !testSpecimenDetails.isEmpty()) {
            testSpecimenDetails.stream().filter(Objects::nonNull).forEach(testSpecimenDetail -> {
                StrucDocTable specimenDetailsTable = objectFactory.createStrucDocTable();
                StrucDocTbody testSpecDetailsTBody = addBody(specimenDetailsTable);
                // Specimen Tissue Type & Collection Procedure (0..1)
                addCaption(specimenDetailsTable, "Specimen Details");
                addHeader(specimenDetailsTable, "Field", "Value");
                add(testSpecDetailsTBody, getBoldTextTd("Specimen Type"),
                        getNormalTextTd(safe(print(testSpecimenDetail.getSpecimenTissueType()))));
                add(testSpecDetailsTBody, getBoldTextTd("Collection Procedure"),
                        getNormalTextTd(safe(print(testSpecimenDetail.getCollectionProcedure()))));
                testSpecimenDetailsNarrative.getContent()
                        .add(objectFactory.createStrucDocTextTable(specimenDetailsTable));
                // Handling & Processing (1..1)
                StrucDocTable handlingTable = objectFactory.createStrucDocTable();
                StrucDocTbody handlingBody = addBody(handlingTable);
                addHeader(handlingTable, "Field", "Value");
                addCaption(handlingTable, "Handling and Processing");
                add(handlingBody, getBoldTextTd("Date and Time of Collection"),
                        getNormalTextTd(safe(
                                print(testSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime()))));
                add(handlingBody, getBoldTextTd("Collection Setting"),
                        getNormalTextTd(
                                safe(testSpecimenDetail.getHandlingAndProcessing().getCollectionSetting())));
                add(handlingBody, getBoldTextTd("Date and Time of Receipt"),
                        getNormalTextTd(
                                safe(print(testSpecimenDetail.getHandlingAndProcessing().getReceiptDateTime()))));
                testSpecimenDetailsNarrative.getContent()
                        .add(objectFactory.createStrucDocTextTable(handlingTable));
                // Add All Anatomical Sites (0..*)
                testSpecimenDetailsNarrative.getContent().addAll(new LinkedList<Serializable>() {{
                    // add(anatomicalSitesTableJAXBElement);
                    addAll(getAnatomicalSites(testSpecimenDetail
                            .getAnatomicalSites())
                            .getContent());
                }});
                // Add All Physical Details (0..*)
                testSpecimenDetailsNarrative.getContent().addAll(new LinkedList<Serializable>() {{
                    addAll(getPhysicalDetails(testSpecimenDetail.getPhysicalDetails())
                            .getContent());
                }});
                // Collection and Handling (0..1)
                if (null != testSpecimenDetail.getCollectionAndHandling()) {
                    StrucDocTable collectionTable = objectFactory.createStrucDocTable();
                    StrucDocTbody collectionBody = addBody(collectionTable);
                    addHeader(collectionTable, "Field", "Value");
                    addCaption(collectionTable, "Collection & Handling");
                    add(collectionBody, getBoldTextTd("Sample Preconditions"),
                            getNormalTextTd(safe(print(testSpecimenDetail.getCollectionAndHandling()
                                    .getSamplingPreconditions()))));
                    testSpecimenDetailsNarrative.getContent().add(
                            objectFactory.createStrucDocTextTable(collectionTable));
                }
                // Identifiers (0..1)
                if (null != testSpecimenDetail.getIdentifiers()) {
                    StrucDocTable identifiersTable = objectFactory.createStrucDocTable();
                    StrucDocTbody identifiersBody = addBody(identifiersTable);
                    addHeader(identifiersTable, "Field", "Value");
                    addCaption(identifiersTable, "Identifiers");
                    add(identifiersBody, getBoldTextTd("Specimen Identifier"),
                            getNormalTextTd(safe(
                                    testSpecimenDetail.getIdentifiers().getSpecimenIdentifier().getExtension())));
                    add(identifiersBody, getBoldTextTd("Parent Specimen Identifier"),
                            getNormalTextTd(safe(testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier()
                                    .getExtension())));
                    add(identifiersBody, getBoldTextTd("Container Identifier"),
                            getNormalTextTd(safe(
                                    testSpecimenDetail.getIdentifiers().getContainerIdentifier().getExtension())));
                    testSpecimenDetailsNarrative.getContent().add(
                            objectFactory.createStrucDocTextTable(identifiersTable));
                }
            });
        }
        return testSpecimenDetailsNarrative;
    }

    private static StrucDocText getPhysicalDetails(
            List<PhysicalDetails> physicalDetails) {
        StrucDocText physicalDetailsNarrative = objectFactory.createStrucDocText();
        if (null != physicalDetails && !physicalDetails.isEmpty()) {
            physicalDetails.stream().filter(Objects::nonNull).forEach(physicalDetail -> {
                StrucDocTable physicalDetailsTable = objectFactory.createStrucDocTable();
                StrucDocTbody physicalDetailsBody = addBody(physicalDetailsTable);
                addCaption(physicalDetailsTable,
                        String.format("Physical Details of Object: %s", physicalDetail.getDescription()));
                addHeader(physicalDetailsTable, "Field", "Value");
                add(physicalDetailsBody, getBoldTextTd("Weight"),
                        getNormalTextTd(
                                safe(physicalDetail.getWeight().getValue() + " " + physicalDetail.getWeight()
                                        .getUnit())));
                add(physicalDetailsBody, getBoldTextTd("Description"),
                        getNormalTextTd(safe(physicalDetail.getDescription())));
                // First add the details before adding the image(s)
                physicalDetailsNarrative
                        .getContent().add(objectFactory.createStrucDocTextTable(physicalDetailsTable));
                // Images added after details table
                if (null != physicalDetail.getImage() && null != physicalDetail.getImage().getFileName()) {
                    physicalDetailsNarrative.getContent().add(
                            getMultimediaFromAttachedMedia(physicalDetail.getImage(),
                                    "Physical Detail Image %s"));
                }
            });
        }
        return physicalDetailsNarrative;
    }

    private static StrucDocText getResultGroups(List<ResultGroup> resultGroups) {
        StrucDocText resultGroupsNarrative = objectFactory.createStrucDocText();
        resultGroups.stream().filter(Objects::nonNull).forEach(resultGroup -> {
            StrucDocTable resultGroupsTable = objectFactory.createStrucDocTable();
            StrucDocTbody resultGroupBody = addBody(resultGroupsTable);
            resultGroup.getIndividualPathologyTestResults().stream().filter(Objects::nonNull).forEach(
                    result -> result.getIndividualPathologyTestResultValue().getReferenceRangeDetails()
                            .getReferenceRanges().stream().filter(Objects::nonNull).forEach(referenceRange -> {
                                addCaption(resultGroupsTable, safe(resultGroup.getPathologyTestResultGroupName()
                                        .getOriginalText().toUpperCase() + " (" + referenceRange
                                        .getReferenceRangeMeaning()
                                        .getOriginalText() + ")")); //Full blood count (<ref range>)
                                addHeader(resultGroupsTable, "", "", "", safe(referenceRange
                                        .getReferenceRangeMeaning().getOriginalText()), "Units", "Status");
                                add(resultGroupBody,
                                        safe(result.getIndividualPathologyTestResultName().getOriginalText()),
                                        safe(result.getIndividualPathologyTestResultValue().getQuantityResultValue()
                                                .getValue()),
                                        safe(print(result.getIndividualPathologyTestResultValue()
                                                .getReferenceRangeDetails().getNormalStatus())),
                                        safe("(" + referenceRange.getReferenceRange().getLow() + " - "
                                                + referenceRange.getReferenceRange().getHigh() + ")"),
                                        safe(result.getIndividualPathologyTestResultValue()
                                                .getQuantityResultValue().getUnit()),
                                        safe(print(result.getIndividualPathologyTestResultStatus())));
                                if (null != result.getIndividualPathologyTestResultReferenceRangeGuidance()
                                        && !result.getIndividualPathologyTestResultReferenceRangeGuidance().isEmpty()) {
                                    StrucDocTd tdVal = objectFactory.createStrucDocTd();
                                    tdVal.setColspan("6");
                                    tdVal.getStyleCode().add("Bold");
                                    tdVal.getContent().add("Reference Range Guidance :");
                                    tdVal.getContent()
                                            .add(result.getIndividualPathologyTestResultReferenceRangeGuidance());
                                    add(resultGroupBody, tdVal);
                                }
                                if (null != result.getIndividualPathologyTestResultComment()
                                        && !result.getIndividualPathologyTestResultComment().isEmpty()) {
                                    StrucDocTd tdVal = objectFactory.createStrucDocTd();
                                    tdVal.setColspan("6");
                                    tdVal.getContent().add("Comment : ");
                                    tdVal.getStyleCode().add("Bold");
                                    tdVal.getContent().add(result.getIndividualPathologyTestResultComment());
                                    add(resultGroupBody, tdVal);
                                }
                            }));
            resultGroupsNarrative.getContent()
                    .add(objectFactory.createStrucDocTextTable(resultGroupsTable));
        });
        return resultGroupsNarrative;
    }

    public static StrucDocText getPathologyTestResults(
            PathologyTestResult pathologyTestResult) {
        StrucDocText pathologyTestResultsNarrative = objectFactory.createStrucDocText();
        if (null != pathologyTestResult) {
            if (null != pathologyTestResult.getCustomNarrative()) {
                return pathologyTestResult.getCustomNarrative();
            }
            // Test Specimen Details (0..*)
            pathologyTestResultsNarrative.getContent().addAll(new LinkedList<Serializable>() {{
                addAll(getTestSpecimenDetails(pathologyTestResult.getTestSpecimenDetails())
                        .getContent());
            }});
            // Report Header (1..1)
            StrucDocTable reportHeaderTable = objectFactory.createStrucDocTable();
            StrucDocTbody reportHeaderBody = addBody(reportHeaderTable);
            add(reportHeaderBody, getBoldTextTd("Collection Date :"),
                    getNormalTextTd(print(pathologyTestResult.getObservationDateTime())),
                    getBoldTextTd("Report Status :"),
                    getNormalTextTd(print(pathologyTestResult.getOverallPathologyTestResultStatus())));
            addCaption(reportHeaderTable, "Report Header");
            add(reportHeaderBody, getBoldTextTd("Department"),
                    getNormalTextTd(safe(pathologyTestResult.getDiagnosticService().getName())),
                    getNormalTextTd(""), getNormalTextTd(""));
            add(reportHeaderBody, getBoldTextTd("Clinical Information"),
                    getNormalTextTd(safe(pathologyTestResult.getClinicalInformationProvided())),
                    getNormalTextTd(""), getNormalTextTd(""));
            pathologyTestResultsNarrative.getContent()
                    .add(objectFactory.createStrucDocTextTable(reportHeaderTable));
            // Result Groups (0..*)
            pathologyTestResultsNarrative.getContent().addAll(new LinkedList<Serializable>() {{
                addAll(getResultGroups(pathologyTestResult.getResultGroups()).getContent());
            }});
            // Comment (0..1)
            if (null != pathologyTestResult.getTestComment() && !pathologyTestResult.getTestComment()
                    .isEmpty()) {
                StrucDocTable commentTable = objectFactory.createStrucDocTable();
                StrucDocTbody commentBody = addBody(commentTable);
                addCaption(commentTable, "Test Comment");
                add(commentBody, safe(pathologyTestResult.getTestComment()), "");
                pathologyTestResultsNarrative.getContent()
                        .add(objectFactory.createStrucDocTextTable(commentTable));
            }
            // Conclusion (0..1)
            if (null != pathologyTestResult.getConclusion() && !pathologyTestResult.getConclusion()
                    .isEmpty()) {
                StrucDocTable conclusionTable = objectFactory.createStrucDocTable();
                StrucDocTbody conclusionBody = addBody(conclusionTable);
                addCaption(conclusionTable, "Pathology Test Conclusion");
                add(conclusionBody, safe(pathologyTestResult.getConclusion()), "");
                pathologyTestResultsNarrative.getContent()
                        .add(objectFactory.createStrucDocTextTable(conclusionTable));
            }
            // Test Result Representation (0..1)
            if (null != pathologyTestResult.getTestResultRepresentation()
                    && null != pathologyTestResult.getTestResultRepresentation().getFileName()) {
                StrucDocTable representationTable = objectFactory.createStrucDocTable();
                StrucDocTbody representationTBody = addBody(representationTable);
                addCaption(representationTable, "Test Result Representation");
                StrucDocTd tdVal = objectFactory.createStrucDocTd();
                tdVal.getContent().add(
                        getMultimediaFromAttachedMedia(pathologyTestResult.getTestResultRepresentation(),
                                "Test Result Representation"));
                StrucDocTd tdLinkHtml = objectFactory.createStrucDocTd();
                tdLinkHtml.getContent()
                        .add(link(pathologyTestResult.getTestResultRepresentation().getFileName(),
                                pathologyTestResult.getTestResultRepresentation().getFileName(),
                                pathologyTestResult.getTestResultRepresentation().getObservationMediaReference()
                                        .getIDAttribute()));
                add(representationTBody, tdVal, tdLinkHtml);
                addTable(pathologyTestResultsNarrative, representationTable);
            }
        }
        return pathologyTestResultsNarrative;
    }

    public static StrucDocText getImagingExaminationResult(
            ImagingExaminationResult imagingExaminationResults) {

        if (null == imagingExaminationResults) {
            return NarrativeUtilCommon.getEmptyStrucDocTextParagraph(
                    "No Imaging Examination Result Data Available");
        }
        if (null != imagingExaminationResults.getCustomNarrative()) {
            return imagingExaminationResults.getCustomNarrative();
        }
        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        List<JAXBElement<StrucDocRenderMultiMedia>> imagingExaminationResultImages = getExaminationResultTable(
                imagingExaminationResults, narrative);
        imagingExaminationResultImages.stream().filter(Objects::nonNull).forEach(image ->
                narrative.getContent().add(image));
        if (null != imagingExaminationResults.getResultGroups()
                && !imagingExaminationResults.getResultGroups().isEmpty()) {
            processResultGroups(imagingExaminationResults, narrative);
        } else {
            narrative.getContent().add("No Data for Result Groups");
        }
        if (null != imagingExaminationResults.getExaminationRequestDetails()
                && !imagingExaminationResults.getExaminationRequestDetails().isEmpty()) {
            processExaminationReqDetails(imagingExaminationResults, narrative);
        } else {
            narrative.getContent().add("No data available for Examination Request Details");
        }
        return narrative;
    }

    private static List<JAXBElement<StrucDocRenderMultiMedia>> getExaminationResultTable(
            ImagingExaminationResult imagingExaminationResults, StrucDocText narrative) {
        StrucDocTable imagingExaminationResultTable = objectFactory.createStrucDocTable();
        StrucDocTbody imagingExaminationResultTBody = addBody(imagingExaminationResultTable);
        List<JAXBElement<StrucDocRenderMultiMedia>> imagingExaminationResultImages = new LinkedList<>();
        addCaption(imagingExaminationResultTable, "Imaging Examination Result");
        addHeader(imagingExaminationResultTable,
                "Result Name", "Representation", "Clinical Info", "Findings", "Status",
                "Image Modality", "Obs Date Time");
        add(imagingExaminationResultTBody,
                safe(print(imagingExaminationResults.getImagingExaminationResultName())),
                safe(imagingExaminationResults.getExaminationResultRepresentation()),
                safe(imagingExaminationResults.getClinicalInformationProvided()),
                safe(imagingExaminationResults.getFindings()),
                safe(print(imagingExaminationResults.getImagingExaminationResultStatus())),
                safe(print(imagingExaminationResults.getImagingModality())),
                safe(print(imagingExaminationResults.getObservationDateTime())));
        if (null != imagingExaminationResults.getAnatomicalSites()
                && !imagingExaminationResults.getAnatomicalSites().isEmpty()) {
            imagingExaminationResults.getAnatomicalSites().stream().filter(Objects::nonNull)
                    .forEach(anatomicalSite -> anatomicalSite.getAnatomicalLocationImages().stream()
                            .filter(Objects::nonNull).forEach(attachedMedia -> {
                                imagingExaminationResultImages.add(getMultimediaFromAttachedMedia(attachedMedia,
                                        "Imaging Examination Result %s"));
                            }));
        } else {
            narrative.getContent().add("No data for Anatomical Site under Imaging Examination Result");
        }
        addTable(narrative, imagingExaminationResultTable);
        return imagingExaminationResultImages;
    }

    private static void processResultGroups(ImagingExaminationResult imagingExaminationResults,
                                            StrucDocText narrative) {
        List<JAXBElement<StrucDocRenderMultiMedia>> resultGroupImages = new LinkedList<>();
        imagingExaminationResults.getResultGroups().stream().filter(Objects::nonNull)
                .forEach(imagingExaminationResultGroup -> {
                    StrucDocTable resultGroupsTable = objectFactory.createStrucDocTable();
                    StrucDocTbody resultGroupsTBody = addBody(resultGroupsTable);
                    addHeader(resultGroupsTable, "Group Name",
                            "Anatomical Loc Desc"/*, "File Name(s)"*/);
                    addCaption(resultGroupsTable, "Imaging Examination Result > Result Group");
                    add(resultGroupsTBody,
                            safe(print(imagingExaminationResultGroup.getImagingExaminationResultGroupName())),
                            safe(imagingExaminationResultGroup.getAnatomicalSite().getAnatomicalLocationDesc())
                    );
                    imagingExaminationResultGroup.getAnatomicalSite().getAnatomicalLocationImages()
                            .stream().filter(Objects::nonNull).forEach(resultGroupImage ->
                            resultGroupImages.add(
                                    getMultimediaFromAttachedMedia(resultGroupImage, "Result Group Image %s")));
                    addTable(narrative, resultGroupsTable);
                    resultGroupImages.stream().filter(Objects::nonNull)
                            .forEach(image -> narrative.getContent().add(image));
                    if (null != imagingExaminationResultGroup.getResults()
                            && !imagingExaminationResultGroup.getResults().isEmpty()) {
                        getResults(narrative, imagingExaminationResultGroup);
                    } else {
                        narrative.getContent().add("No Data for Results");
                    }
                });
    }

    private static void processExaminationReqDetails(
            ImagingExaminationResult imagingExaminationResults, StrucDocText narrative) {

        StrucDocTable examReqDetailsTable = objectFactory.createStrucDocTable();
        StrucDocTbody examReqDetailsTBody = addBody(examReqDetailsTable);
        addCaption(examReqDetailsTable, "Imaging Examination Results > Examination Request Details");
        addHeader(examReqDetailsTable, "Examination Requested Names", "Obs Date Time");
        imagingExaminationResults.getExaminationRequestDetails().stream()
                .filter(Objects::nonNull).forEach(examinationRequestDetails -> {
            add(examReqDetailsTBody,
                    safe(examinationRequestDetails.getExaminationRequestedNames().stream()
                            .filter(Objects::nonNull).collect(Collectors.joining(", "))),
                    safe(print(examinationRequestDetails.getObservationDateTime())));
            addTable(narrative, examReqDetailsTable);
            if (null != examinationRequestDetails.getImageDetails()
                    && !examinationRequestDetails.getImageDetails().isEmpty()
                    && examinationRequestDetails.getImageDetails().stream().anyMatch(
                    imageDetails -> null != imageDetails.getImage() && null != imageDetails.getImage()
                            .getIntegrityCheck())) {
                processImageDetails(narrative, examinationRequestDetails);
            } else {
                narrative.getContent().add("No data available for Imaging Details");
            }
        });
    }

    private static void processImageDetails(StrucDocText narrative,
                                            ExaminationRequestDetails examinationRequestDetails) {

        List<JAXBElement<StrucDocRenderMultiMedia>> imageList = new LinkedList<>();
        StrucDocTable imageDetailsTable = objectFactory.createStrucDocTable();
        StrucDocTbody imageDetailsTBody = addBody(imageDetailsTable);
        addCaption(imageDetailsTable, "Examination Request Details > Image Details");
        addHeader(
                imageDetailsTable, "View Name", "Image Date Time", "Sub Pos");
        examinationRequestDetails.getImageDetails().stream()
                .filter(Objects::nonNull).forEach(imageDetails -> {
            if (null != imageDetails.getImage() && null != imageDetails.getImage().getFileName()) {
                imageList.add(getMultimediaFromAttachedMedia(imageDetails.getImage(), "Image %s"));
                add(imageDetailsTBody,
                        safe(print(imageDetails.getImageViewName())),
                        safe(print(imageDetails.getImageDateTime())),
                        safe(imageDetails.getSubjectPosition())
                );
            }
        });
        addTable(narrative, imageDetailsTable);
        imageList.stream().filter(Objects::nonNull).forEach(image ->
                narrative.getContent().add(image));
    }

    private static void getResults(StrucDocText narrative,
                                   ImagingExaminationResultGroup imagingExaminationResultGroup) {

        StrucDocTable resultsTable = objectFactory.createStrucDocTable();
        StrucDocTbody resultsTBody = addBody(resultsTable);
        addCaption(resultsTable, "Result Group > Imaging Results");
        addHeader(resultsTable, "Comments", "Result Name", "Value", "Normal Range",
                "Unit");
        imagingExaminationResultGroup.getResults().stream().filter(Objects::nonNull).forEach(
                imagingResult -> {
                    add(resultsTBody,
                            safe(String.join(", ", imagingResult.getResultComments())),
                            safe(print(imagingResult.getIndividualImagingExaminationResultName())),
                            safe(getResultValue(
                                    imagingResult.getIndividualImagingExaminationResultValue())),
                            safe(print(imagingResult.getIndividualImagingExaminationResultValue()
                                    .getReferenceRangeDetails().getNormalStatus())),
                            safe(getResultValueUnit(
                                    imagingResult.getIndividualImagingExaminationResultValue()))
                    );
                    getReferenceRangeDetails(resultsTBody, imagingResult);
                });
        addTable(narrative, resultsTable);
    }

    private static void getReferenceRangeDetails(StrucDocTbody resultsTBody,
                                                 ImagingResult imagingResult) {

        if (null != imagingResult.getIndividualImagingExaminationResultValue()
                .getReferenceRangeDetails()) {
            StrucDocTd referenceRangeTitleTd = objectFactory.createStrucDocTd();
            referenceRangeTitleTd.setColspan("5");
            referenceRangeTitleTd.getStyleCode().add("Bold");
            referenceRangeTitleTd.getContent().add(String.format(
                    "Result Group > Imaging Results > Reference Ranges for %s",
                    print(imagingResult.getIndividualImagingExaminationResultName())));
            add(resultsTBody, Collections.singletonList(referenceRangeTitleTd));
            if (null != imagingResult.getIndividualImagingExaminationResultValue()
                    .getReferenceRangeDetails()
                    && null != imagingResult.getIndividualImagingExaminationResultValue()
                    .getReferenceRangeDetails().getReferenceRanges()) {
                List<ReferenceRange> resultValueRefRanges = imagingResult
                        .getIndividualImagingExaminationResultValue()
                        .getReferenceRangeDetails().getReferenceRanges();
                resultValueRefRanges.stream().filter(Objects::nonNull)
                        .forEach(referenceRange -> add(resultsTBody, " ", " ",
                                "(" + safe(referenceRange.getReferenceRange().getLow()
                                        + " - " + referenceRange.getReferenceRange().getHigh())
                                        + ")",
                                safe(print(referenceRange.getReferenceRangeMeaning())),
                                safe(referenceRange.getReferenceRange().getUnits())
                        ));
            }
        }
    }

    private static String getResultValueUnit(ResultValue resultValue) {

        String resultUnit = "";
        if (null != resultValue) {
            if (null != resultValue.getQuantityResultValue()) {
                resultUnit = resultValue.getQuantityResultValue().getUnit();
            } else if (null != resultValue.getQuantityRangeResultValue()) {
                resultUnit = resultValue.getQuantityRangeResultValue().getUnits();
            } else {
                resultUnit = resultValue.getCodedResultValue().getCodeSystemName();
            }
        }
        return resultUnit;
    }

    private static String getResultValue(ResultValue resultValue) {
        String result = "";
        if (null != resultValue) {
            if (null != resultValue.getQuantityRangeResultValue()) {
                result = resultValue.getQuantityRangeResultValue().getLow() + " - "
                        + resultValue.getQuantityRangeResultValue().getHigh();
            }
            if (null != resultValue.getQuantityResultValue()) {
                result = resultValue.getQuantityResultValue().getValue();
            }
            if (null != resultValue.getCodedResultValue()) {
                result = print(resultValue.getCodedResultValue());
            }
        }
        result = "(" + result + ")";
        return result;
    }

    private static JAXBElement<StrucDocRenderMultiMedia> getMultimediaFromAttachedMedia(
            AttachedMedia attachedMedia, String s) {

        StrucDocRenderMultiMedia multiMedia = objectFactory.createStrucDocRenderMultiMedia();
        StrucDocCaption caption = objectFactory.createStrucDocCaption();
        caption.getContent()
                .add(String.format(s, null != attachedMedia && null != attachedMedia.getFileName()
                        ? attachedMedia.getFileName() : ""));
        multiMedia.setCaption(caption);
        //multiMedia.setID(attachedMedia.getObservationMediaReference().getIDAttribute());
        if (null != attachedMedia) {
            multiMedia.getReferencedObject().add(attachedMedia.getObservationMediaReference());
        }
        return objectFactory.createStrucDocTextRenderMultiMedia(multiMedia);
    }

    static StrucDocText getImmunisations(Immunisations immunisations) {
        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        if (null != immunisations.getCustomNarrative()) {
            narrative = immunisations.getCustomNarrative();
        } else {
            if (null != immunisations.getImmunisations() && !immunisations.getImmunisations().isEmpty()) {
                StrucDocTable immunisationsTable = objectFactory.createStrucDocTable();
                addCaption(immunisationsTable, "Immunisations");
                StrucDocTbody body = addBody(immunisationsTable);
                addHeader(immunisationsTable, "Vaccine", "Date");
                immunisations.getImmunisations().stream().filter(Objects::nonNull).forEach(
                        immunisation -> add(body,
                                print(immunisation.getTheraputicGood()),
                                safe(print(immunisation.getMedicationActionDateTime()))));
                addTable(narrative, immunisationsTable);
            }
        }
        return narrative;
    }

    /**
     * Create the custom narrative for requested service
     *
     * @param requestedServices List of requested services
     * @return StrucDocText Instance of StrucDocText
     */
    public static StrucDocText getRequestedServiceNarrative(RequestedService requestedServices) {
        if (null == requestedServices) {
            return NarrativeUtilCommon
                    .getEmptyStrucDocTextParagraph("No Requested Services Data Available");
        }
        if (null != requestedServices.getCustomNarrative()) {
            return requestedServices.getCustomNarrative();
        }
        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        StrucDocTable requestedServiceTable = objectFactory.createStrucDocTable();
        StrucDocTbody imagingExaminationTBody = addBody(requestedServiceTable);
        addCaption(requestedServiceTable,
                requestedServices.getRequestedServiceDescription().getDisplayName().toUpperCase());
        addHeader(requestedServiceTable, "Field", "Value");
        add(imagingExaminationTBody, getBoldTextTd("Requested Service Description"),
                getNormalTextTd(safe(print(requestedServices.getRequestedServiceDescription()))));
        add(imagingExaminationTBody, getBoldTextTd("Service Requested DateTime"),
                getNormalTextTd(safe(print(requestedServices.getRequestedServiceDateTime()))));
        if (null != requestedServices.getServiceScheduled()) {
            add(imagingExaminationTBody, getBoldTextTd("Service Scheduled"),
                    getNormalTextTd(safe(requestedServices.getServiceScheduled().toNarrativeForm())));
        }
        if (requestedServices.getServiceBookingStatus() == EventTypes.EVENT) {
            add(imagingExaminationTBody, getBoldTextTd("DateTime Requested"),
                    getNormalTextTd(safe(print(requestedServices.getRequestedDateTime()))));
        } else {
            add(imagingExaminationTBody, getBoldTextTd("Commencement Window"),
                    getNormalTextTd(safe(print(requestedServices.getServiceCommencementWindow().getLow())
                            + " -> " + print(requestedServices.getServiceCommencementWindow().getHigh()))));
        }
        if (null != requestedServices.getParticipant().getParticipant().getOrganisation()) {
            add(imagingExaminationTBody, getBoldTextTd("Provider Organisation"),
                    getNormalTextTd(safe(requestedServices.getParticipant().getParticipant().getOrganisation()
                            .getOrganisationName())));
        }
        if (null != requestedServices.getParticipant().getParticipant().getHealthCareProvider()) {
            add(imagingExaminationTBody, getBoldTextTd("Provider Person Name"),
                    getNormalTextTd(getPersonNamesNarrative(requestedServices)));
        }
        add(imagingExaminationTBody, getBoldTextTd("Address / Contact"),
                getNormalTextTd(safe(getAddressesNarrativeText(requestedServices))));
        if (null != requestedServices.getServiceBookingStatus()) {
            add(imagingExaminationTBody, getBoldTextTd("Booking Status"),
                    getNormalTextTd(safe(requestedServices.getServiceBookingStatus().getName())));
        }
        if (null != requestedServices.getParticipant().getParticipationPeriod()) {
            add(imagingExaminationTBody, getBoldTextTd("Participation Period"),
                    getNormalTextTd(
                            safe((null != requestedServices.getParticipant().getParticipationPeriod().getLow()
                                    ? requestedServices.getParticipant().getParticipationPeriod().getLow()
                                    .toNarrativeForm()
                                    : "NA") + "->" + (
                                    null != requestedServices.getParticipant().getParticipationPeriod()
                                            .getHigh()
                                            ? requestedServices.getParticipant().getParticipationPeriod().getHigh()
                                            .toNarrativeForm() : "NA"))));
        }
        add(imagingExaminationTBody, getBoldTextTd("Subject of Care Instruction Description"),
                getNormalTextTd(safe(requestedServices.getSubjectOfCareInstructionDesc())));
        addTable(narrative, requestedServiceTable);
        return narrative;
    }

    private static String getAddressesNarrativeText(RequestedService requestedService) {
        if (null != requestedService && null != requestedService.getParticipant().getParticipant()
                && null != requestedService.getParticipant().getParticipant().getAddresses()) {
            return requestedService.getParticipant().getParticipant().getAddresses().stream()
                    .filter(Objects::nonNull)
                    .map(address -> new StringJoiner("\n", "", "")
                            .add(null != address.getAustralianAddress() ? address.getAustralianAddress()
                                    .toNarrative()
                                    : "Not Provided").toString()).collect(Collectors.joining("\n"));
        }
        return "Addresses Empty";
    }

    public static String getPersonNamesNarrative(RequestedService requestedService) {
        String personNames = "";
        if (null != requestedService.getParticipant()
                && null != requestedService.getParticipant().getParticipant()) {
            if (null != requestedService.getParticipant().getParticipant().getHealthCareProvider()
                    && null != requestedService.getParticipant().getParticipant().getHealthCareProvider()
                    .getPersonNames()) {
                personNames =
                        requestedService.getParticipant().getParticipant().getHealthCareProvider()
                                .getPersonNames().stream().filter(Objects::nonNull).map(personName ->
                                String.join(", ", personName.getNameTitle())
                                        + " "
                                        + String.join(", ", personName.getGivenName())
                                        + " "
                                        + personName.getFamilyName().toUpperCase()
                                        + " "
                                        + String.join(", ", personName.getNameSuffix())
                                        + " Usage(s):"
                                        + personName.getPersonNameUsage().stream()
                                        .map(PersonNameUsage::getDisplayName).collect(Collectors.joining(", ")))
                                .collect(Collectors.joining(", "));
            }
        } else if (null != requestedService.getParticipant()
                && null != requestedService.getParticipant().getParticipant()
                && null != requestedService.getParticipant().getParticipant().getOrganisation()) {
            new StringJoiner(", ", "[", "]")
                    .add(requestedService.getParticipant().getParticipant().getOrganisation()
                            .getOrganisationName())
                    .add("Dept Unit: ")
                    .add(requestedService.getParticipant().getParticipant().getOrganisation()
                            .getDepartmentUnit())
                    .add("Org Name Usage:")
                    .add(requestedService.getParticipant().getParticipant().getOrganisation()
                            .getOrganisationName());
        }
        return personNames;
    }

    public static StrucDocText getOtherTestResult(OtherTestResult otherTestResult) {
        StrucDocText narrative = objectFactory.createStrucDocText();

        StrucDocTable otherTestResultTable = objectFactory.createStrucDocTable();
        StrucDocTbody otherTestResultTBody = addBody(otherTestResultTable);

        addCaption(otherTestResultTable,
                String.format("Other Test Result: %s", print(otherTestResult.getReportName())));
        addHeader(otherTestResultTable, "Field", "Value");
        add(otherTestResultTBody, getBoldTextTd("Report Date"),
                getNormalTextTd(safe(print(otherTestResult.getReportDate()))));
        add(otherTestResultTBody, getBoldTextTd("Report Name"),
                getNormalTextTd(safe(print(otherTestResult.getReportName()))));
        add(otherTestResultTBody, getBoldTextTd("Report Status"),
                getNormalTextTd(safe(print(otherTestResult.getReportStatus()))));

        StrucDocParagraph paragraph = objectFactory.createStrucDocParagraph();
        paragraph.getStyleCode().add("xPre");
        addTable(narrative, otherTestResultTable);
        StrucDocTd tdVal = objectFactory.createStrucDocTd();
        if (null != otherTestResult.getReportContent()) {
            tdVal.setColspan("2");
            paragraph.getContent().add(otherTestResult.getReportContent());
            tdVal.getContent().add(objectFactory.createStrucDocFootnoteParagraph(paragraph));
            add(otherTestResultTBody, tdVal);
        } else {
            tdVal.getContent().add(
                    getMultimediaFromAttachedMedia(otherTestResult.getReportFile(), "Other Test Result"));
            StrucDocTd tdLinkHtml = objectFactory.createStrucDocTd();
            tdLinkHtml.getContent().add(link(otherTestResult.getReportFile().getFileName(),
                    otherTestResult.getReportFile().getFileName(),
                    otherTestResult.getReportFile().getObservationMediaReference().getIDAttribute()));
            add(otherTestResultTBody, tdVal, tdLinkHtml);
        }
        return narrative;
    }
}

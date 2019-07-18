package au.gov.nehta.builder.es;

import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.address.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.es.AnatomicalSite;
import au.gov.nehta.model.clinical.es.DiagnosesInterventions;
import au.gov.nehta.model.clinical.es.EventDetails;
import au.gov.nehta.model.clinical.es.ImagingExaminationResult;
import au.gov.nehta.model.clinical.es.Immunisations;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
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
import au.net.electronichealth.ns.cda._2_0.StrucDocItem;
import au.net.electronichealth.ns.cda._2_0.StrucDocList;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocRenderMultiMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import javax.xml.bind.JAXBElement;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.StringJoiner;
import java.util.stream.Collectors;

import static au.gov.nehta.builder.DocumentCreatorUtil.add;
import static au.gov.nehta.builder.DocumentCreatorUtil.addBody;
import static au.gov.nehta.builder.DocumentCreatorUtil.addCaption;
import static au.gov.nehta.builder.DocumentCreatorUtil.addHeader;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.print;
import static au.gov.nehta.builder.DocumentCreatorUtil.safe;
import static au.gov.nehta.builder.DocumentCreatorUtil.textWithTable;

/**
 * Utility class for Narrative renderings of Event Summary sections
 */
public class NarrativeUtil {

  private static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";
  private static ObjectFactory objectFactory = new ObjectFactory();

    protected static final StrucDocText DIAGNOSTIC_INVESTIGATIONS_SECTION_TEXT =
            NarrativeUtil.getEmptyStrucDocTextParagraph("This section " +
                    "contains the following subsections: Pathology Test Result, Imaging Examination " +
                    "Result and Requested Service(s).");

  static StrucDocText getCustomNarrativeForEventDetails(EventDetails eventDetails) {
    StrucDocText narrative = new StrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    StrucDocTable eventDetailsTable = new StrucDocTable();
    addCaption(eventDetailsTable, "Clinical Summary");
    addHeader(eventDetailsTable, "Description");
    StrucDocTbody eventDetailsTBody = addBody(eventDetailsTable);
    add(eventDetailsTBody, safe(eventDetails.getClinicalSynopsisDesc()));
    addTable(narrative, eventDetailsTable);
    return narrative;
  }

  static StrucDocText getAdverseReactionsNarrativeBlock(
      NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions) {

    if (newlyIdentifiedAdverseReactions.getAdverseReactions() == null
        || newlyIdentifiedAdverseReactions.getAdverseReactions().size() == 0) {
      return null;
    }

    StrucDocTable table = new StrucDocTable();

    StrucDocTbody body = addBody(table);
    addCaption(table, "Adverse Reactions");
    addHeader(table, "Substance/Agent", "Manifestations", "Reaction Type");
    newlyIdentifiedAdverseReactions
        .getAdverseReactions()
        .stream()
        .filter(Objects::nonNull)
        .forEach(
            adverseReaction -> {
              StrucDocList list = new StrucDocList();
              adverseReaction.getReactionEvent().getManifestations().stream()
                  .filter(Objects::nonNull).forEach(
                  manifestation -> {
                    StrucDocItem item = new StrucDocItem();
                    item.getContent().add(print(manifestation));
                    list.getItem().add(item);
                  });
              List<StrucDocTd> cols = new ArrayList<>();

              // Substance/Agent
              StrucDocTd sbst = new StrucDocTd();
              sbst.getContent().add(print(adverseReaction.getSubstanceOrAgent()));
              cols.add(sbst);

              // Manifestations
              StrucDocTd mlist = new StrucDocTd();
              JAXBElement<StrucDocList> jaxblist = new ObjectFactory().createStrucDocTdList(list);
              mlist.getContent().add(jaxblist);
              cols.add(mlist);

              // Reaction Type
              StrucDocTd rt = new StrucDocTd();
              rt.getContent().add(print(adverseReaction.getReactionEvent().getReactionType()));
              cols.add(rt);

              add(body, cols);
            });

    return textWithTable(table);
  }

  private static StrucDocContent getCustomNarrativeAnatomicalSites(
      List<AnatomicalSite> anatomicalSites, String caption) {
    StrucDocContent anatomicalSitesNarrative = new StrucDocContent();
    if (null != anatomicalSites && !anatomicalSites.isEmpty()) {
      anatomicalSites.stream().filter(Objects::nonNull).forEach(anatomicalSite -> {
        StrucDocTable anatomicalSitesTable = new StrucDocTable();
        StrucDocTbody anatomicalSiteBody = addBody(anatomicalSitesTable);
        addCaption(anatomicalSitesTable, caption);
        addHeader(anatomicalSitesTable, "Field", "Value");

        add(anatomicalSiteBody, "Location",
            safe(print(anatomicalSite.getSpecificLocation().getAnatomicalLocationName())));
        add(anatomicalSiteBody, "Side",
            safe(print(anatomicalSite.getSpecificLocation().getSide())));
        add(anatomicalSiteBody, "Date and Time of Receipt",
            safe(anatomicalSite.getAnatomicalLocationDesc()));

        anatomicalSitesNarrative
            .getContent().add(objectFactory.createStrucDocTextTable(anatomicalSitesTable));

        //Add Anatomical Site Images
        anatomicalSite.getAnatomicalLocationImages().stream().filter(Objects::nonNull)
            .forEach(attachedMedia -> {
              if (null != attachedMedia.getFileName()) {
                anatomicalSitesNarrative.getContent().add(
                    getMultimediaFromAttachedMedia(attachedMedia, "Anatomical Site %s"));
              }
            });
      });
    }
    return anatomicalSitesNarrative;
  }

  private static StrucDocContent getCustomNarrativeTestSpecimenDetails(
      List<TestSpecimenDetail> testSpecimenDetails) {
    StrucDocContent testSpecimenDetailsNarrative = new StrucDocContent();
    if (null != testSpecimenDetails && !testSpecimenDetails.isEmpty()) {
      testSpecimenDetails
          .stream()
          .filter(Objects::nonNull)
          .forEach(
              testSpecimenDetail -> {
                StrucDocTable specimenDetailsTable = new StrucDocTable();
                StrucDocTbody testSpecDetailsTBody = addBody(specimenDetailsTable);

                //Specimen Tissue Type & Collection Procedure (0..1)
                addCaption(specimenDetailsTable, "Specimen Details");
                addHeader(specimenDetailsTable, "Field", "Value");
                add(testSpecDetailsTBody, "Specimen Type",
                    safe(print(testSpecimenDetail.getSpecimenTissueType())));
                add(testSpecDetailsTBody, "Collection Procedure",
                    safe(print(testSpecimenDetail.getCollectionProcedure())));
                testSpecimenDetailsNarrative
                    .getContent()
                    .add(objectFactory.createStrucDocTextTable(specimenDetailsTable));

                //Handling & Processing (1..1)
                StrucDocTable handlingTable = new StrucDocTable();
                StrucDocTbody handlingBody = addBody(handlingTable);
                addHeader(handlingTable, "Field", "Value");
                addCaption(handlingTable, "Handling and Processing");
                add(handlingBody, "Date and Time of Collection",
                    safe(print(
                        testSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime())));
                add(handlingBody, "Collection Setting",
                    safe(testSpecimenDetail.getHandlingAndProcessing().getCollectionSetting()));
                add(handlingBody, "Date and Time of Receipt",
                    safe(
                        print(testSpecimenDetail.getHandlingAndProcessing().getReceiptDateTime())));
                testSpecimenDetailsNarrative
                    .getContent()
                    .add(objectFactory.createStrucDocTextTable(handlingTable));

                //Add All Anatomical Sites (0..*)
                testSpecimenDetailsNarrative.getContent().addAll(new LinkedList<Serializable>() {{
                  //add(anatomicalSitesTableJAXBElement);
                  addAll(getCustomNarrativeAnatomicalSites(testSpecimenDetail
                      .getAnatomicalSites(), "Test Specimen Details (Anatomical site)")
                      .getContent());
                }});

                //Add All Physical Details (0..*)
                testSpecimenDetailsNarrative.getContent().addAll(new LinkedList<Serializable>() {{
                  //add(physicalDetailsTableTableJAXBElement);
                  addAll(getCustomNarrativePhysicalDetails(testSpecimenDetail
                      .getPhysicalDetails())
                      .getContent());
                }});

                //Collection and Handling (0..1)
                if (null != testSpecimenDetail.getCollectionAndHandling()) {
                  StrucDocTable collectionTable = new StrucDocTable();
                  StrucDocTbody collectionBody = addBody(collectionTable);
                  addHeader(collectionTable, "Field", "Value");
                  addCaption(collectionTable, "Collection & Handling");
                  add(collectionBody, "Sample Preconditions",
                      safe(print(testSpecimenDetail.getCollectionAndHandling()
                          .getSamplingPreconditions())));
                  testSpecimenDetailsNarrative
                      .getContent()
                      .add(objectFactory.createStrucDocTextTable(collectionTable));
                }

                //Identifiers (0..1)
                if (null != testSpecimenDetail.getIdentifiers()) {
                  StrucDocTable identifiersTable = new StrucDocTable();
                  StrucDocTbody identifiersBody = addBody(identifiersTable);
                  addHeader(identifiersTable, "Field", "Value");
                  addCaption(identifiersTable, "Identifiers");
                  add(identifiersBody, "Specimen Identifier",
                      safe(testSpecimenDetail.getIdentifiers().getSpecimenIdentifier()
                          .getExtension()));
                  add(identifiersBody, "Parent Specimen Identifier",
                      safe(testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier()
                          .getExtension()));
                  add(identifiersBody, "Container Identifier",
                      safe(testSpecimenDetail.getIdentifiers().getContainerIdentifier()
                          .getExtension()));
                  testSpecimenDetailsNarrative
                      .getContent()
                      .add(objectFactory.createStrucDocTextTable(identifiersTable));
                }

          /*        add(testSpecDetailsTBody, safe("Clinical Information"),
                          safe(testSpecimenDetail.getClinicalInformationProvided()), "", "");*/



/*                addHeader(
                    testSpecDetailsTable,
                    "Spec Tissue Type",
                    "Collec Proc",
                    "Samp Precond",
                    "Collec Sett",
                    "Collec DateTime",
                    "Rec DateTime");
                add(
                    testSpecDetailsTBody,
                    safe(testSpecimenDetail.getSpecimenTissueType().getDisplayName()),
                    safe(
                        null != testSpecimenDetail.getCollectionProcedure()
                            ? testSpecimenDetail.getCollectionProcedure().getDisplayName()
                            : "NA"),
                    safe(
                        null != testSpecimenDetail.getCollectionAndHandling()
                            ? testSpecimenDetail
                            .getCollectionAndHandling()
                            .getSamplingPreconditions()
                            .getDisplayName()
                            : "NA"),
                    safe(
                        null != testSpecimenDetail.getHandlingAndProcessing()
                            ? testSpecimenDetail.getHandlingAndProcessing().getCollectionSetting()
                            : "NA"),
                    safe(
                        null != testSpecimenDetail.getHandlingAndProcessing()
                            && null
                            != testSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime()
                            ? print(
                            testSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime())
                            : "NA"),
                    safe(
                        null != testSpecimenDetail.getHandlingAndProcessing()
                            ? print(
                            testSpecimenDetail.getHandlingAndProcessing().getReceiptDateTime())
                            : "NA"));
                testSpecimenDetailsNarrative
                    .getContent()
                    .add(objectFactory.createStrucDocTextTable(testSpecDetailsTable));
                // Test Spec Details -> Physical Details list
                testSpecimenDetailsNarrative
                    .getContent()
                    .add(
                        getCustomNarrativePhysicalDetails(testSpecimenDetail.getPhysicalDetails()));
                // Test Spec Details -> Anatomical Sites
                testSpecimenDetailsNarrative
                    .getContent()
                    .add(
                        NarrativeUtil.getCustomNarrativeAnatomicalSites(
                            testSpecimenDetail.getAnatomicalSites(),
                            "Test Specimen Detail > Anatomical Sites"));*/
              });
    } /*else {
      testSpecimenDetailsNarrative.getContent().add("No Data for Test Specimen Details");*/
    return testSpecimenDetailsNarrative;
    //}
  }

  private static StrucDocText getCustomNarrativePhysicalDetails(
      List<PhysicalDetails> physicalDetails) {
    StrucDocText physicalDetailsNarrative = new StrucDocText();
    if (null != physicalDetails && !physicalDetails.isEmpty()) {
      physicalDetails.stream().filter(Objects::nonNull).forEach(physicalDetail -> {
        StrucDocTable physicalDetailsTable = new StrucDocTable();
        StrucDocTbody physicalDetailsBody = addBody(physicalDetailsTable);
        addCaption(physicalDetailsTable, "Physical Details of Object");
        addHeader(physicalDetailsTable, "Field", "Value");

        add(physicalDetailsBody, "Weight",
            safe(physicalDetail.getWeight().getValue() + " " + physicalDetail.getWeight()
                .getUnit()));
        add(physicalDetailsBody, "Description",
            safe(physicalDetail.getDescription()));

        //First add the details before adding the image(s)
        physicalDetailsNarrative
            .getContent().add(objectFactory.createStrucDocTextTable(physicalDetailsTable));
        //Images added after details table
        if (null != physicalDetail.getImage() && null != physicalDetail.getImage().getFileName()) {
          physicalDetailsNarrative.getContent().add(
              getMultimediaFromAttachedMedia(physicalDetail.getImage(),
                  "Physical Detail Image %s"));
        }
      });

    }
    return physicalDetailsNarrative;
  }

  private static StrucDocText getCustomNarrativeResultGroups(List<ResultGroup> resultGroups) {
    StrucDocText resultGroupsNarrative = new StrucDocText();

    resultGroups.stream().filter(Objects::nonNull).forEach(resultGroup -> {
      StrucDocTable resultGroupsTable = new StrucDocTable();
      StrucDocTbody resultGroupBody = addBody(resultGroupsTable);
      resultGroup.getIndividualPathologyTestResults().stream().filter(Objects::nonNull)
          .forEach(
              result -> result.getIndividualPathologyTestResultValue().getReferenceRangeDetails()
                  .getReferenceRanges().stream().filter(Objects::nonNull)
                  .forEach(referenceRange -> {
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
                        && !result.getIndividualPathologyTestResultReferenceRangeGuidance()
                        .isEmpty()) {
                      StrucDocTd tdVal = new StrucDocTd();
                      tdVal.setColspan("6");
                      tdVal.getContent().add("Reference Range Guidance :");
                      tdVal.getContent()
                          .add(result.getIndividualPathologyTestResultReferenceRangeGuidance());
                      add(resultGroupBody, tdVal);
                    }
                    if (null != result.getIndividualPathologyTestResultComment()
                        && !result.getIndividualPathologyTestResultComment().isEmpty()) {
                      StrucDocTd tdVal = new StrucDocTd();
                      tdVal.setColspan("6");
                      tdVal.getContent().add("Comment : ");
                      tdVal.getContent().add(result.getIndividualPathologyTestResultComment());
                      add(resultGroupBody, tdVal);
                    }
                  }));
      resultGroupsNarrative.getContent()
          .add(objectFactory.createStrucDocTextTable(resultGroupsTable));
    });
    return resultGroupsNarrative;
  }

/*  private static JAXBElement getCustomNarrativeIndividualPathologyTestResults(
      List<Result> individualPathologyTestResults) {
    if (null != individualPathologyTestResults && !individualPathologyTestResults.isEmpty()) {
      StrucDocTable individualPathTestResultsTable = new StrucDocTable();
      addCaption(
          individualPathTestResultsTable, "Result Group > Individual Pathology Test Results");
      StrucDocTbody individualPathologyTestResultsBody = addBody(individualPathTestResultsTable);
      addHeader(
          individualPathTestResultsTable, "Result Name", "Comment", "Ref Range Guidance", "Status");
      individualPathologyTestResults
          .stream()
          .filter(Objects::nonNull)
          .forEach(
              individualPathologyTestResult -> {
                add(
                    individualPathologyTestResultsBody,
                    safe(
                        individualPathologyTestResult
                            .getIndividualPathologyTestResultName()
                            .getDisplayName()),
                    safe(individualPathologyTestResult.getIndividualPathologyTestResultComment()),
                    safe(
                        individualPathologyTestResult
                            .getIndividualPathologyTestResultReferenceRangeGuidance()),
                    safe(
                        individualPathologyTestResult
                            .getIndividualPathologyTestResultStatus()
                            .getDisplayName()));
                // individualPathologyTestResult.getIndividualPathologyTestResultValue()
              });
      return objectFactory.createStrucDocTextTable(individualPathTestResultsTable);
    } else {
      return getEmptyParagraph("No data for Individual Pathology Test Results");
    }
  }*/

  static StrucDocText getCustomNarrativePathologyTestResults(
      PathologyTestResult pathologyTestResult) {
    StrucDocText pathologyTestResultsNarrative = new StrucDocText();
    if (null != pathologyTestResult) {

      //Test Specimen Details (0..*)
      pathologyTestResultsNarrative.getContent()
          .addAll(new LinkedList<Serializable>() {{
            addAll(getCustomNarrativeTestSpecimenDetails(
                pathologyTestResult.getTestSpecimenDetails())
                .getContent());
          }});

      //Report Header (1..1)
      StrucDocTable reportHeaderTable = new StrucDocTable();
      StrucDocTbody reportHeaderBody = addBody(reportHeaderTable);
      add(reportHeaderBody, "Collection Date :",
          print(pathologyTestResult.getObservationDateTime()),
          "Report Status :", print(pathologyTestResult.getOverallPathologyTestResultStatus()));
      addCaption(reportHeaderTable, "Report Header");
      add(reportHeaderBody, "Department",
          safe(pathologyTestResult.getDiagnosticService().getName()), "",
          "");
      add(reportHeaderBody, "Clinical Information",
          safe(pathologyTestResult.getClinicalInformationProvided()), "", "");
      pathologyTestResultsNarrative
          .getContent()
          .add(objectFactory.createStrucDocTextTable(reportHeaderTable));

      //Result Groups (0..*)
      pathologyTestResultsNarrative.getContent()
          .addAll(new LinkedList<Serializable>() {{
            addAll(getCustomNarrativeResultGroups(pathologyTestResult.getResultGroups())
                .getContent());
          }});

      //Comment (0..1)
      if (null != pathologyTestResult.getTestComment() && !pathologyTestResult.getTestComment()
          .isEmpty()) {
        StrucDocTable commentTable = new StrucDocTable();
        StrucDocTbody commentBody = addBody(commentTable);
        addCaption(commentTable, "Test Comment");
        add(commentBody, safe(pathologyTestResult.getTestComment()), "");
        pathologyTestResultsNarrative
            .getContent()
            .add(objectFactory.createStrucDocTextTable(commentTable));
      }

      //Conclusion (0..1)
      if (null != pathologyTestResult.getConclusion() && !pathologyTestResult.getConclusion()
          .isEmpty()) {
        StrucDocTable conclusionTable = new StrucDocTable();
        StrucDocTbody conclusionBody = addBody(conclusionTable);
        addCaption(conclusionTable, "Pathology Test Conclusion");
        add(conclusionBody, safe(pathologyTestResult.getConclusion()), "");
        pathologyTestResultsNarrative
            .getContent()
            .add(objectFactory.createStrucDocTextTable(conclusionTable));
      }

      //Test Result Representation (0..1)
      if (null != pathologyTestResult.getTestResultRepresentation()
          && null != pathologyTestResult.getTestResultRepresentation().getFileName()) {
        StrucDocTable representationTable = new StrucDocTable();
        StrucDocTbody representationTBody = addBody(representationTable);
        addCaption(representationTable, "Test Result Representation");

        JAXBElement<StrucDocRenderMultiMedia> jaxbLink =
            getMultimediaFromAttachedMedia(pathologyTestResult.getTestResultRepresentation(),
                "Test Result Representation %s");

        StrucDocTd linkTd = new StrucDocTd();
        linkTd.getContent().add(jaxbLink);
        add(representationTBody, linkTd);
        addTable(pathologyTestResultsNarrative, representationTable);
      }
    }
    return pathologyTestResultsNarrative;
  }

  static StrucDocText getEmptyStrucDocTextParagraph(String emptyMessage) {
    StrucDocText emptyStrucDocText = new StrucDocText();
    StrucDocParagraph para = new StrucDocParagraph();
    para.getContent().add(emptyMessage);
    JAXBElement<StrucDocParagraph> paraJaxbElement =
        new ObjectFactory().createStrucDocTextParagraph(para);
    emptyStrucDocText.getContent().add(paraJaxbElement);
    return emptyStrucDocText;
  }

  static StrucDocText getCustomNarrativeImagingExaminationResult(
      ImagingExaminationResult imagingExaminationResults) {

    if (null == imagingExaminationResults) {
      return NarrativeUtil.getEmptyStrucDocTextParagraph(
          "No Imaging Examination Result Data Available");
    }
    StrucDocText narrative = new StrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    StrucDocTable imagingExaminationResultTable = new StrucDocTable();
    StrucDocTbody imagingExaminationResultTBody = addBody(imagingExaminationResultTable);
    List<JAXBElement<StrucDocRenderMultiMedia>> imagingExaminationResultImages = new LinkedList<>();
    addCaption(imagingExaminationResultTable, "Imaging Examination Result");
    addHeader(
        imagingExaminationResultTable,
        "Result Name",
        "Representation",
        "Clinical Info",
        "Findings",
        "Status",
        "Image Modality",
        "Obs Date Time");
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
    imagingExaminationResultImages.stream().filter(Objects::nonNull)
        .forEach(image -> narrative.getContent().add(image));
    if (null != imagingExaminationResults.getResultGroups()
        && !imagingExaminationResults.getResultGroups().isEmpty()) {
      List<JAXBElement<StrucDocRenderMultiMedia>> resultGroupImages = new LinkedList<>();
      imagingExaminationResults.getResultGroups().stream().filter(Objects::nonNull)
          .forEach(
              imagingExaminationResultGroup -> {
                StrucDocTable resultGroupsTable = new StrucDocTable();
                StrucDocTbody resultGroupsTBody = addBody(resultGroupsTable);
                addHeader(resultGroupsTable, "Group Name",
                    "Anatomical Loc Desc"/*, "File Name(s)"*/);
                addCaption(resultGroupsTable, "Imaging Examination Result > Result Group");
                add(resultGroupsTBody,
                    safe(print(
                        imagingExaminationResultGroup.getImagingExaminationResultGroupName())),
                    safe(imagingExaminationResultGroup.getAnatomicalSite()
                        .getAnatomicalLocationDesc())
                /*safe(imagingExaminationResultGroup.getAnatomicalSite()
                    .getAnatomicalLocationImages().stream()
                    .map(AttachedMedia::getFileName)
                    .collect(Collectors.joining(", ")))*/);
                imagingExaminationResultGroup.getAnatomicalSite().getAnatomicalLocationImages()
                    .stream().filter(Objects::nonNull).forEach(resultGroupImage ->
                    resultGroupImages.add(
                        getMultimediaFromAttachedMedia(resultGroupImage, "Result Group Image %s")));
                addTable(narrative, resultGroupsTable);
                resultGroupImages.stream().filter(Objects::nonNull)
                    .forEach(image -> narrative.getContent().add(image));
                if (null != imagingExaminationResultGroup.getResults()
                    && !imagingExaminationResultGroup.getResults().isEmpty()) {
                  StrucDocTable resultsTable = new StrucDocTable();
                  StrucDocTbody resultsTBody = addBody(resultsTable);
                  addCaption(resultsTable, "Result Group > Imaging Results");
                  addHeader(resultsTable, "Comments", "Result Name", "Value", "Normal Range",
                      "Unit");
                  imagingExaminationResultGroup.getResults().stream().forEach(
                      imagingResult -> {
                        if (null != imagingResult) {
                          add(resultsTBody,
                              safe(String.join(", ", imagingResult.getResultComments())),
                              safe(
                                  print(imagingResult.getIndividualImagingExaminationResultName())),
                              safe(getResultValue(
                                  imagingResult.getIndividualImagingExaminationResultValue())),
                              safe(print(imagingResult.getIndividualImagingExaminationResultValue()
                                  .getReferenceRangeDetails().getNormalStatus())),
                              safe(getResultValueUnit(
                                  imagingResult.getIndividualImagingExaminationResultValue()))
                          );
                          if (null != imagingResult.getIndividualImagingExaminationResultValue()
                              .getReferenceRangeDetails()) {
                            StrucDocTd referenceRangeTitleTd = new StrucDocTd();
                            referenceRangeTitleTd.setColspan("5");
                            referenceRangeTitleTd.getContent().add(String.format(
                                "Result Group > Imaging Results > Reference Ranges for %s",
                                print(imagingResult.getIndividualImagingExaminationResultName())));
                            add(resultsTBody, Collections.singletonList(referenceRangeTitleTd));
                            if (null != imagingResult.getIndividualImagingExaminationResultValue()
                                .getReferenceRangeDetails()
                                && null != imagingResult
                                .getIndividualImagingExaminationResultValue()
                                .getReferenceRangeDetails().getReferenceRanges()) {
                              List<ReferenceRange> resultValueRefRanges = imagingResult
                                  .getIndividualImagingExaminationResultValue()
                                  .getReferenceRangeDetails().getReferenceRanges();
                              resultValueRefRanges.stream().forEach(referenceRange -> {
                                add(resultsTBody, " ", " ",
                                    "(" + safe(referenceRange.getReferenceRange().getLow()
                                        + " - " + referenceRange.getReferenceRange().getHigh())
                                        + ")",
                                    safe(print(referenceRange.getReferenceRangeMeaning())),
                                    safe(referenceRange.getReferenceRange().getUnits())
                                );
                              });
                            }
                          }
                        }
                      });
                  addTable(narrative, resultsTable);
                } else {
                  narrative.getContent().add("No Data for Results");
                }
              });
    } else {
      narrative.getContent().add("No Data for Result Groups");
    }
    if (null != imagingExaminationResults.getExaminationRequestDetails()
        && !imagingExaminationResults.getExaminationRequestDetails().isEmpty()) {
      StrucDocTable examReqDetailsTable = new StrucDocTable();
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
          List<JAXBElement<StrucDocRenderMultiMedia>> imageList = new LinkedList<>();
          StrucDocTable imageDetailsTable = new StrucDocTable();
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
          imageList.stream().filter(Objects::nonNull)
              .forEach(image -> narrative.getContent().add(image));
        } else {
          narrative.getContent().add("No data available for Imaging Details");
        }
      });
    } else {
      narrative.getContent().add("No data available for Examination Request Details");
    }
    return narrative;
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
    StrucDocRenderMultiMedia multiMedia = new StrucDocRenderMultiMedia();
    StrucDocCaption caption = new StrucDocCaption();
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

  static StrucDocText getCustomNarrativeImmunisations(Immunisations immunisations) {
    StrucDocText narrative = new StrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    if (null != immunisations && null != immunisations.getImmunisations()
        && !immunisations.getImmunisations().isEmpty()) {
      StrucDocTable immunisationsTable = new StrucDocTable();
      addCaption(immunisationsTable, "Immunisations");
      StrucDocTbody body = addBody(immunisationsTable);
      addHeader(immunisationsTable, "Vaccine", "Date");
      immunisations.getImmunisations().stream().filter(Objects::nonNull).forEach(
          immunisation -> add(body,
              print(immunisation.getTheraputicGood()),
              safe(print(immunisation.getMedicationActionDateTime()))));
      addTable(narrative, immunisationsTable);
    }

    return narrative;
  }

  /**
   * Create the custom narrative for requested service
   *
   * @param requestedServices List of requested services
   * @return StrucDocText Intance of StrucDocText
   */
  static StrucDocText getRequestedServiceNarrative(RequestedService requestedServices) {

    if (null == requestedServices) {
      return NarrativeUtil.getEmptyStrucDocTextParagraph("No Requested Services Data Available");
    }
    StrucDocText narrative = new StrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    StrucDocTable requestedServiceTable = new StrucDocTable();
    StrucDocTbody imagingExaminationTBody = addBody(requestedServiceTable);

    addCaption(requestedServiceTable,
        requestedServices.getRequestedServiceDescription().getDisplayName().toUpperCase());
    addHeader(requestedServiceTable, "Field", "Value");

    add(imagingExaminationTBody, safe("Requested Service Description"),
        safe(print(requestedServices.getRequestedServiceDescription())));
    add(imagingExaminationTBody, safe("Service Requested DateTime"),
        safe(print(requestedServices.getRequestedServiceDateTime())));
    if (null != requestedServices.getServiceScheduled()) {
      add(imagingExaminationTBody, safe("Service Scheduled"),
          safe(requestedServices.getServiceScheduled().toNarrativeForm()));
    }
    if (requestedServices.getServiceBookingStatus() == EventTypes.EVENT) {
      add(imagingExaminationTBody, safe("DateTime Requested"),
          safe(print(requestedServices.getRequestedDateTime())));
    } else {
      add(imagingExaminationTBody, safe("Commencement Window"),
          safe(print(requestedServices.getServiceCommencementWindow().getLow())
              + " -> " + print(requestedServices.getServiceCommencementWindow().getHigh())));
    }
    if (null != requestedServices.getParticipant().getParticipant().getOrganisation()) {
      add(imagingExaminationTBody, safe("Provider Organisation"),
          safe(requestedServices.getParticipant().getParticipant().getOrganisation()
              .getOrganisationName()));
    }
    if (null != requestedServices.getParticipant().getParticipant().getHealthCareProvider()) {
      add(imagingExaminationTBody, safe("Provider Person Name"),
          getPersonNamesNarrative(requestedServices));
    }
    add(imagingExaminationTBody, safe("Address / Contact"),
        safe(getAddressesNarrativeText(requestedServices)));
    if (null != requestedServices.getServiceBookingStatus()) {
      add(imagingExaminationTBody, safe("Booking Status"),
          safe(requestedServices.getServiceBookingStatus().getName()));
    }

    add(imagingExaminationTBody, safe("Subject of Care Instruction Description"),
        safe(requestedServices.getSubjectOfCareInstructionDesc()));
    addTable(narrative, requestedServiceTable);

    return narrative;
  }

  private static String getAddressNarrativeForm(List<Address> addresses) {
    return addresses
        .stream()
        .filter(Objects::nonNull)
        .map(
            address -> {
              String addressString = "";
              if (null != address.getAustralianAddress()) {
                AustralianAddress australianAddress = address.getAustralianAddress();
                addressString =
                    australianAddress.getAustralianAddressLevelType().getName() + " " + null
                        != australianAddress.getLevelNumber()
                        ? australianAddress.getAustralianAddressLevelType()
                        + " "
                        + australianAddress.getLevelNumber()
                        : "" + australianAddress.getLevelNumber() + null
                            != australianAddress.getUnitNumber()
                            ? australianAddress.getUnitType()
                            + " "
                            + australianAddress.getUnitNumber()
                            : ""
                                + "\n"
                                + australianAddress.getStreetNumber()
                                + " "
                                + australianAddress.getStreetName()
                                + " "
                                + australianAddress.getStreetType()
                                + " "
                                + australianAddress.getStreetSuffix().getName()
                                + "\n"
                                + australianAddress.getAddressSiteName()
                                + "\n"
                                + australianAddress.getSuburbTownLocality()
                                + "\n"
                                + null
                                != australianAddress.getLotNumber()
                                ? australianAddress.getLotNumber()
                                : ""
                                    + "\n"
                                    + "Postcode-"
                                    + australianAddress.getPostCode()
                                    + "\n"
                                    + australianAddress
                                    .getAustralianStateTerritory()
                                    .getDisplayName()
                                    + "\n"
                                    + "Australia";
              }
              return addressString;
            })
        .collect(Collectors.joining("; "));
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

  private static String getPersonNamesNarrative(RequestedService requestedService) {
    String personNames = "";
    if (null != requestedService.getParticipant()
        && null != requestedService.getParticipant().getParticipant()) {
      if (null != requestedService.getParticipant().getParticipant().getHealthCareProvider()
          && null
          != requestedService
          .getParticipant()
          .getParticipant()
          .getHealthCareProvider()
          .getPersonNames()) {
        personNames =
            requestedService
                .getParticipant()
                .getParticipant()
                .getHealthCareProvider()
                .getPersonNames()
                .stream()
                .filter(Objects::nonNull)
                .map(
                    personName ->
                        personName.getNameTitle().stream()
                            .collect(Collectors.joining(", "))
                            + " "
                            + personName
                            .getGivenName()
                            .stream()
                            .collect(Collectors.joining(", "))
                            + " "
                            + personName.getFamilyName().toUpperCase()
                            + " "
                            + personName
                            .getNameSuffix()
                            .stream()
                            .collect(Collectors.joining(", "))
                            + " Usage(s):"
                            + personName
                            .getPersonNameUsage()
                            .stream()
                            .map(PersonNameUsage::getDisplayName)
                            .collect(Collectors.joining(", ")))
                .collect(Collectors.joining(", "));
      }
    } else if (null != requestedService.getParticipant()
        && null != requestedService.getParticipant().getParticipant()
        && null != requestedService.getParticipant().getParticipant().getOrganisation()) {
      new StringJoiner(", ", "[", "]")
          .add(
              requestedService
                  .getParticipant()
                  .getParticipant()
                  .getOrganisation()
                  .getOrganisationName())
          .add("Dept Unit: ")
          .add(
              requestedService
                  .getParticipant()
                  .getParticipant()
                  .getOrganisation()
                  .getDepartmentUnit())
          .add("Org Name Usage:")
          .add(
              requestedService
                  .getParticipant()
                  .getParticipant()
                  .getOrganisation()
                  .getOrganisationName());
    }
    return personNames;
  }

  static StrucDocText getMedicationsNarrativeBlock(Medications medications) {

    if (medications.getKnownMedications() == null || medications.getKnownMedications().isEmpty()) {
      return null; // TODO check if required [narrative] : medications : null/empty check
    }

    StrucDocTable table = new StrucDocTable();
    StrucDocTbody body = addBody(table);
    addCaption(table, "Medications");
    addHeader(
        table,
        "Medication",
        "Directions",
        "Clinical Indication",
        "Change Status",
        "Change Description",
        "Change Reason",
        "Comment");

    medications
        .getKnownMedications()
        .stream()
        .filter(Objects::nonNull)
        .forEach(
            knownMedication ->
                add(
                    body,
                    print(knownMedication.getTherapeuticGoodIdentification()),
                    safe(knownMedication.getDirections()),
                    safe(knownMedication.getClinicalIndication()),
                    safe(print(knownMedication.getChangeStatus())),
                    safe(knownMedication.getChangeDesc()),
                    safe(knownMedication.getChangeOrRecommendationReason()),
                    safe(knownMedication.getMedicationInstructionComment())));

    return textWithTable(table);
  }

  static StrucDocText getCustomNarrativeDiagnosesOrInterventions(
      DiagnosesInterventions diagnosesInterventions) {
    StrucDocText narrative = new StrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);

    // Medical History Start
    StrucDocTable medicalHistoryTable = new StrucDocTable();
    addCaption(medicalHistoryTable, "Medical History");
    StrucDocTbody body = addBody(medicalHistoryTable);

    if (null != diagnosesInterventions.getProblemDiagnoses()
        && !diagnosesInterventions.getProblemDiagnoses().isEmpty()) {
      // Problem Diagnosis
      addHeader(medicalHistoryTable, "Item", "Date", "Comment");
      diagnosesInterventions.getProblemDiagnoses().stream().filter(Objects::nonNull)
          .forEach(problemDiagnosis -> add(body,
              safe(print(problemDiagnosis.getIdentification())),
              safe(print(problemDiagnosis.getDateOfOnset())),
              safe(problemDiagnosis.getComment())));
      // safe(problemDiagnosis.getDateOfRemission().toNarrativeForm())));
    }
    // Procedures
    if (null != diagnosesInterventions.getProcedures()
        && !diagnosesInterventions.getProcedures().isEmpty()) {
      diagnosesInterventions.getProcedures().stream().filter(Objects::nonNull)
          .forEach(procedure -> add(body,
              print(procedure.getProcedureName()),
              safe(print(procedure.getProcedureDateTime().getLow())
                  + " -> " + print(procedure.getProcedureDateTime().getHigh())),
              safe(procedure.getComment())));
    }
    // Uncategorized Medical History
    if (null != diagnosesInterventions.getUncatagorisedMedicalHistoryItems()
        && !diagnosesInterventions.getUncatagorisedMedicalHistoryItems().isEmpty()) {
      diagnosesInterventions.getUncatagorisedMedicalHistoryItems().stream()
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

  static StrucDocText getOtherTestResult(OtherTestResult otherTestResult) {
    StrucDocText narrative = new StrucDocText();

    StrucDocTable otherTestResultTable = new StrucDocTable();
    StrucDocTbody otherTestResultTBody = addBody(otherTestResultTable);

    addCaption(otherTestResultTable,
        String.format("Other Test Result: %s", print(otherTestResult.getReportName())));
    addHeader(otherTestResultTable, "Field", "Value");
    add(otherTestResultTBody, safe("Report Date"),
        safe(print(otherTestResult.getReportDate())));
    add(otherTestResultTBody, safe("Report Name"),
        safe(print(otherTestResult.getReportName())));
    add(otherTestResultTBody, safe("Report Status"),
        safe(print(otherTestResult.getReportStatus())));

    StrucDocParagraph paragraph = new StrucDocParagraph();
    paragraph.getStyleCode().add("xPre");
    addTable(narrative, otherTestResultTable);
    StrucDocTd tdVal = new StrucDocTd();
    tdVal.setColspan("2");

    if (null != otherTestResult.getReportContent()) {
      paragraph.getContent().add(otherTestResult.getReportContent());
      tdVal.getContent().add(objectFactory.createStrucDocFootnoteParagraph(paragraph));
    } else {

      tdVal.getContent().add(
          getMultimediaFromAttachedMedia(otherTestResult.getReportFile(), "Other Test Result"));
    }

    add(otherTestResultTBody, tdVal);
    return narrative;
  }


}

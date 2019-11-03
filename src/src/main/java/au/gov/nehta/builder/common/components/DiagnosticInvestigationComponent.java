package au.gov.nehta.builder.common.components;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.EntitlementTypeCodeSet;
import au.gov.nehta.builder.common.NarrativeUtilCommon;
import au.gov.nehta.builder.es.NarrativeUtil;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.es.AnatomicalSite;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.ExaminationRequestDetails;
import au.gov.nehta.model.clinical.es.ImageDetails;
import au.gov.nehta.model.clinical.es.ImagingExaminationResult;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultGroup;
import au.gov.nehta.model.clinical.es.ImagingResult;
import au.gov.nehta.model.clinical.es.OtherTestResult;
import au.gov.nehta.model.clinical.es.PathologyTestResult;
import au.gov.nehta.model.clinical.es.PhysicalDetails;
import au.gov.nehta.model.clinical.es.ReferenceRange;
import au.gov.nehta.model.clinical.es.RequestedService;
import au.gov.nehta.model.clinical.es.Result;
import au.gov.nehta.model.clinical.es.ResultGroup;
import au.gov.nehta.model.clinical.es.TestSpecimenDetail;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipType;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.CR;
import au.net.electronichealth.ns.cda._2_0.CV;
import au.net.electronichealth.ns.cda._2_0.ED;
import au.net.electronichealth.ns.cda._2_0.EntityClass;
import au.net.electronichealth.ns.cda._2_0.II;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssignedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component4;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component5;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationRange;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040OrganizationPartOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organizer;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Performer2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040PlayingEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ReferenceRange;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Specimen;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SpecimenRole;
import au.net.electronichealth.ns.cda._2_0.PQ;
import au.net.electronichealth.ns.cda._2_0.ParticipationPhysicalPerformer;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.TEL;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryOrganizer;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.ci.cda.extensions._3.Container;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;
import au.net.electronichealth.ns.ci.cda.extensions._3.Employment;
import au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement;
import au.net.electronichealth.ns.ci.cda.extensions._3.Participant;
import au.net.electronichealth.ns.ci.cda.extensions._3.ParticipantRole;
import au.net.electronichealth.ns.ci.cda.extensions._3.Qualifications;
import au.net.electronichealth.ns.ci.cda.extensions._3.SpecimenInContainer;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import javax.xml.bind.JAXBElement;

public class DiagnosticInvestigationComponent {

  private static ObjectFactory objectFactory = new ObjectFactory();
  private static au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory objectFactoryExt = new au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory();
  private Map<String, CD> codeMap;

  public DiagnosticInvestigationComponent(Map<String, CD> codeMap) {
    this.codeMap = codeMap;
  }

  public POCDMT000040Component3 getDiagnosticInvestigations(
      DiagnosticInvestigations diagnosticInvestigations) {

/*    DiagnosticInvestigations diagnosticInvestigations =
        clinicalModel.getContent().getDiagnosticInvestigations();*/
    if (null == diagnosticInvestigations) {
      return null;
    }
    POCDMT000040Component3 diagnosticInvestigationsComponent = objectFactory
        .createPOCDMT000040Component3();
    diagnosticInvestigationsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section diagnosticInvestigationsSection = getDiagnosticInvestigationSection(
        diagnosticInvestigations);

    diagnosticInvestigationsComponent.setSection(diagnosticInvestigationsSection);
    return diagnosticInvestigationsComponent;
  }

  public POCDMT000040Section getDiagnosticInvestigationSection(
      DiagnosticInvestigations diagnosticInvestigations) {
    POCDMT000040Section diagnosticInvestigationsSection = objectFactory.createPOCDMT000040Section();
    diagnosticInvestigationsSection.setClassCode(ActClass.DOCSECT);
    diagnosticInvestigationsSection.setMoodCode(ActMood.EVN);
    diagnosticInvestigationsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    diagnosticInvestigationsSection
        .setCode((CE) codeMap.get(ClinicalDocumentCodes.DIAGNOSTIC_INVESTIGATIONS));
    diagnosticInvestigationsSection.setTitle(CDATypeUtil.getST("Diagnostic Investigations"));
    diagnosticInvestigationsSection
        .setText(NarrativeUtilCommon.DIAGNOSTIC_INVESTIGATIONS_SECTION_TEXT);

    // Other Test Results - Undifferentiated Pathology & Radiology report(s)
    createOtherTestResults(diagnosticInvestigations, diagnosticInvestigationsSection);

    // Requested Service List
    createRequestedServices(diagnosticInvestigations, diagnosticInvestigationsSection);

    // Pathology Test Results List
    createPathologyTestResults(diagnosticInvestigations, diagnosticInvestigationsSection);

    // Imaging Examination Results List
    createImagingExaminationResults(diagnosticInvestigations, diagnosticInvestigationsSection);
    return diagnosticInvestigationsSection;
  }

  private void createRequestedServices(DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations.getRequestedServices()
        && !diagnosticInvestigations.getRequestedServices().isEmpty()) {
      diagnosticInvestigations.getRequestedServices().stream().filter(Objects::nonNull).forEach(
          requestedService -> {
            POCDMT000040Component5 requestedServicedComp = objectFactory
                .createPOCDMT000040Component5();
            POCDMT000040Section requestedServiceSection = objectFactory.createPOCDMT000040Section();
            requestedServiceSection.setTitle(CDATypeUtil.getST("Requested Service"));
            requestedServiceSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
            requestedServiceSection
                .setCode((CE) codeMap.get(ClinicalDocumentCodes.REQUESTED_SERVICE));
            requestedServiceSection.getEntry().add(getRequestedServiceEntry(requestedService));
            String performerAssignedEntityId = requestedServiceSection.getEntry().get(0).getAct()
                .getPerformer().get(0).getAssignedEntity().getId().get(0).getRoot();
            // Entitlement Coverage
            if (null != requestedService.getParticipant().getParticipant()
                .getHealthCareProvider()) {
              requestedService.getParticipant().getParticipant().getHealthCareProvider()
                  .getEntitlements().stream().filter(Objects::nonNull)
                  .forEach(entitlement -> requestedServiceSection.getCoverage2()
                      .add(getEntitlementCoverage(entitlement, performerAssignedEntityId)));
            }

            requestedServiceSection
                .setText(NarrativeUtil.getRequestedServiceNarrative(requestedService));
            requestedServicedComp.setSection(requestedServiceSection);
            diagnosticInvestigationsSection.getComponent().add(requestedServicedComp);
          }
      );
    } else {//Render section as custom-narrative only
      if (null != diagnosticInvestigations.getRequestedServicesCustomNarrative()
          && isNarrativeNonEmpty(diagnosticInvestigations.getRequestedServicesCustomNarrative())) {
        renderSectionAsCustomNarrative(diagnosticInvestigationsSection,
            "Requested Service", ClinicalDocumentCodes.REQUESTED_SERVICE,
            diagnosticInvestigations.getRequestedServicesCustomNarrative());
      }
    }
  }

  public void createImagingExaminationResults(
      DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations.getImagingExaminationResults()
        && !diagnosticInvestigations.getImagingExaminationResults().isEmpty()) {
      diagnosticInvestigations.getImagingExaminationResults().stream().filter(Objects::nonNull)
          .forEach(imagingExaminationResult -> {
                POCDMT000040Component5 imagingExaminationResultComp = objectFactory
                    .createPOCDMT000040Component5();
                POCDMT000040Section imagingExaminationResultSection = objectFactory
                    .createPOCDMT000040Section();
                imagingExaminationResultSection
                    .setTitle(CDATypeUtil.getST("Imaging Examination Result"));
                imagingExaminationResultSection
                    .setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
                imagingExaminationResultSection
                    .setCode((CE) codeMap.get(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT));
                imagingExaminationResultSection.getEntry()
                    .add(getImagingExaminationResultEntry(imagingExaminationResult));
                imagingExaminationResultSection.setText(NarrativeUtil
                    .getImagingExaminationResult(imagingExaminationResult));
                imagingExaminationResultComp.setSection(imagingExaminationResultSection);
                diagnosticInvestigationsSection.getComponent().add(imagingExaminationResultComp);
              }
          );
    } else {//Render section as custom-narrative only
      if (null != diagnosticInvestigations.getImagingExaminationResultCustomNarrative()
          && isNarrativeNonEmpty(
          diagnosticInvestigations.getImagingExaminationResultCustomNarrative())) {
        renderSectionAsCustomNarrative(diagnosticInvestigationsSection,
            "Imaging Examination Result", ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT,
            diagnosticInvestigations.getImagingExaminationResultCustomNarrative());
      }
    }
  }

  public void createPathologyTestResults(DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations.getPathologyTestResults()
        && !diagnosticInvestigations.getPathologyTestResults().isEmpty()) {
      diagnosticInvestigations.getPathologyTestResults().stream()
          .filter(Objects::nonNull)
          .forEach(pathologyTestResult -> {
            POCDMT000040Component5 pathologyTestResultComp = objectFactory
                .createPOCDMT000040Component5();
            POCDMT000040Section pathologyTestResultSection = objectFactory
                .createPOCDMT000040Section();
            pathologyTestResultSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
            pathologyTestResultSection
                .setCode((CE) codeMap.get(ClinicalDocumentCodes.PATHOLOGY_TEST_RESULT));
            pathologyTestResultSection.setTitle(CDATypeUtil.getST("Pathology Test Result"));
            //Observation Entry
            pathologyTestResultSection.getEntry()
                .add(getPathologyTestResultEntry(pathologyTestResult));
            //Observation Media Entry
            if (null != pathologyTestResult.getTestResultRepresentation()) {
              pathologyTestResultSection.getEntry()
                  .add(getPathologyTestResultMediaEntry(pathologyTestResult));
            }
            //Narrative
            pathologyTestResultSection.setText(
                NarrativeUtil.getPathologyTestResults(pathologyTestResult));
            pathologyTestResultComp.setSection(pathologyTestResultSection);
            diagnosticInvestigationsSection.getComponent().add(pathologyTestResultComp);
          }); // PathologyTestResult Ends
    } else {//Render section as custom-narrative only
      if (null != diagnosticInvestigations.getPathologyCustomNarrative()
          && isNarrativeNonEmpty(diagnosticInvestigations.getPathologyCustomNarrative())) {
        renderSectionAsCustomNarrative(diagnosticInvestigationsSection,
            "Pathology Test Result", ClinicalDocumentCodes.PATHOLOGY_TEST_RESULT,
            diagnosticInvestigations.getPathologyCustomNarrative());
      }
    }
  }

  private boolean isNarrativeNonEmpty(StrucDocText narrative) {
    return null != narrative.getContent() && !narrative.getContent().isEmpty();
  }

  private void renderSectionAsCustomNarrative(
      POCDMT000040Section diagnosticInvestigationsSection, String sectionTitle,
      String sectionCodeKey, StrucDocText narrative) {
    POCDMT000040Component5 component = objectFactory.createPOCDMT000040Component5();
    POCDMT000040Section section = objectFactory.createPOCDMT000040Section();
    section.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    section.setCode((CE) codeMap.get(sectionCodeKey));
    section.setTitle(CDATypeUtil.getST(sectionTitle));
    section.setText(narrative);
    component.setSection(section);
    diagnosticInvestigationsSection.getComponent().add(component);

  }

  private POCDMT000040Entry getPathologyTestResultMediaEntry(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040Entry pathologyTestResultMediaEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040ObservationMedia pathologyTestResultObservationMedia =
        objectFactory.createPOCDMT000040ObservationMedia();
    pathologyTestResultObservationMedia.setClassCode(ActClassObservation.OBS);
    pathologyTestResultObservationMedia.setMoodCode(ActMood.EVN);
    pathologyTestResultObservationMedia.setIDAttribute(CDATypeUtil.getUUID());
    pathologyTestResultObservationMedia.getId()
        .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathologyTestResultObservationMedia.setValue(
        getEDFromAttachedMedia(pathologyTestResult.getTestResultRepresentation()));
    pathologyTestResult
        .getTestResultRepresentation()
        .setObservationMediaReference(pathologyTestResultObservationMedia);
    pathologyTestResultMediaEntry.setObservationMedia(pathologyTestResultObservationMedia);
    return pathologyTestResultMediaEntry;
  }

  private POCDMT000040Entry getPathologyTestResultEntry(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040Entry pathologyTestResultEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation pathologyTestResultObservation = objectFactory
        .createPOCDMT000040Observation();
    pathologyTestResultObservation.setClassCode(ActClassObservation.OBS);
    pathologyTestResultObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    pathologyTestResultObservation.getId().add(CDATypeUtil.getII(
        pathologyTestResult.getTestRequestDetails()
            .getLaboratoryTestResultIdentifier().getRoot(),
        pathologyTestResult.getTestRequestDetails()
            .getLaboratoryTestResultIdentifier().getExtension()));

    pathologyTestResultObservation.setCode(
        Converter.convertToCDCode(pathologyTestResult.getTestResultName()));
    if (null != pathologyTestResult.getTestResultRepresentation()) {
      pathologyTestResultObservation.getValue()
          .add(getEDFromAttachedMedia(pathologyTestResult.getTestResultRepresentation()));
      pathologyTestResult.getTestResultRepresentation()
          .setObservationReference(pathologyTestResultObservation);
    }
    pathologyTestResultObservation.getEntryRelationship()
        .addAll(getRelationshipsForPathologyTestResult(pathologyTestResult));
    // Test Specimen Details list
    if (null != pathologyTestResult.getResultGroups()
        && !pathologyTestResult.getResultGroups().isEmpty()) {
      pathologyTestResultObservation.getEntryRelationship()
          .addAll(processResultGroups(pathologyTestResult.getResultGroups()));
    }
    if (null != pathologyTestResult.getTestSpecimenDetails()
        && !pathologyTestResult.getTestSpecimenDetails().isEmpty()) {
      pathologyTestResult.getTestSpecimenDetails().stream().filter(Objects::nonNull)
          .forEach(testSpecimenDetail -> pathologyTestResultObservation.getEntryRelationship()
              .add(getSpecimenDetailEntryRelationship(
                  testSpecimenDetail))); // TestSpecimenDetail Ends
    }
    pathologyTestResultEntry.setObservation(pathologyTestResultObservation);
    return pathologyTestResultEntry;
  }

  public static ED getEDFromAttachedMedia(AttachedMedia attachedMedia) {
    if (null == attachedMedia) {
      return null;
    }
    ED testResultRepresentation = objectFactory.createED();
    testResultRepresentation.setMediaType(attachedMedia.getMediaType());
    testResultRepresentation.setIntegrityCheck(attachedMedia.getIntegrityCheck());
    TEL ref = objectFactory.createTEL();
    ref.setValue(attachedMedia.getFileName());
    JAXBElement<TEL> reference = objectFactory.createEDReference(ref);
    testResultRepresentation.getContent().add(reference);
    return testResultRepresentation;
  }

  public void createOtherTestResults(DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations && null != diagnosticInvestigations.getOtherTestResults()
        && !diagnosticInvestigations.getOtherTestResults().isEmpty()) {
      diagnosticInvestigations.getOtherTestResults().stream().filter(Objects::nonNull).forEach(
          otherTestResult -> diagnosticInvestigationsSection.getComponent()
              .add(createOtherTestResult(otherTestResult)));
    } else {//Render section as custom-narrative only
      if (null != diagnosticInvestigations
          && null != diagnosticInvestigations.getOtherTestResultsCustomNarrative()
          && isNarrativeNonEmpty(diagnosticInvestigations.getOtherTestResultsCustomNarrative())) {
        renderSectionAsCustomNarrative(diagnosticInvestigationsSection,
            "Diagnostic Investigation", ClinicalDocumentCodes.OTHER_TEST_RESULT,
            diagnosticInvestigations.getOtherTestResultsCustomNarrative());
      }
    }
  }

  private POCDMT000040Component5 createOtherTestResult(OtherTestResult otherTestResult) {
    POCDMT000040Component5 otherTestResultComp = objectFactory
        .createPOCDMT000040Component5();
    POCDMT000040Section otherTestResultSection = objectFactory.createPOCDMT000040Section();
    otherTestResultSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    otherTestResultSection
        .setCode((CE) codeMap.get(ClinicalDocumentCodes.OTHER_TEST_RESULT));
    otherTestResultSection.setTitle(CDATypeUtil.getST("Diagnostic Investigation"));

    POCDMT000040Entry otherTestResultEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation otherTestResultObs = objectFactory
        .createPOCDMT000040Observation();
    otherTestResultObs.setClassCode(ActClassObservation.OBS);
    otherTestResultObs.setMoodCode(XActMoodDocumentObservation.EVN);
    otherTestResultObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    otherTestResultObs.setCode(Converter.convertToCDCode(otherTestResult.getReportName()));
    if (null != otherTestResult.getReportDate()) { // Report Date - if available
      otherTestResultObs
          .setEffectiveTime(Converter.convert(otherTestResult.getReportDate()));
    }
    if (null != otherTestResult.getReportFile()) { // Report attached file
      addOtherTestResultAsAttachedFile(otherTestResult, otherTestResultObs);
    } else { //Report in Text Format
      otherTestResultObs.getValue()
          .add(CDATypeUtil.getED(otherTestResult.getReportContent()));
    } // Both report formats are mutually exclusive
    addReportStatusOtherTestResult(otherTestResult, otherTestResultObs);
    otherTestResultSection.setText(NarrativeUtil.getOtherTestResult(otherTestResult));
    otherTestResultEntry.setObservation(otherTestResultObs);
    otherTestResultSection.getEntry().add(otherTestResultEntry);
    otherTestResultComp.setSection(otherTestResultSection);
    return otherTestResultComp;
  }

  private void addOtherTestResultAsAttachedFile(OtherTestResult otherTestResult,
      POCDMT000040Observation otherTestResultObs) {
    otherTestResultObs.getValue()
        .add(getEDFromAttachedMedia(otherTestResult.getReportFile()));
    // Add Entry Relationship for PDF report file
    POCDMT000040EntryRelationship reportFileEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    reportFileEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040ObservationMedia reportFileObservationMedia = objectFactory
        .createPOCDMT000040ObservationMedia();
    reportFileObservationMedia.setClassCode(ActClassObservation.OBS);
    reportFileObservationMedia.setMoodCode(ActMood.EVN);
    reportFileObservationMedia.setIDAttribute(CDATypeUtil.getUUID());
    otherTestResult.getReportFile()
        .setObservationMediaReference(reportFileObservationMedia);
    reportFileObservationMedia
        .setValue(getEDFromAttachedMedia(otherTestResult.getReportFile()));
    reportFileEntryRelationship.setObservationMedia(reportFileObservationMedia);
    otherTestResultObs.getEntryRelationship().add(reportFileEntryRelationship);
  }

  private void addReportStatusOtherTestResult(OtherTestResult otherTestResult,
      POCDMT000040Observation otherTestResultObs) {
    if (null != otherTestResult.getReportStatus()) { // Report status - if available
      POCDMT000040EntryRelationship reportStatusEntryRelationship = objectFactory
          .createPOCDMT000040EntryRelationship();
      reportStatusEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Observation reportStatusObs = objectFactory
          .createPOCDMT000040Observation();
      reportStatusObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      reportStatusObs.setClassCode(ActClassObservation.OBS);
      reportStatusObs.setMoodCode(XActMoodDocumentObservation.EVN);
      reportStatusObs.setCode(
          codeMap.get(ClinicalDocumentCodes.OTHER_TEST_RESULT_REPORT_STATUS));
      reportStatusObs.getValue().add(CDATypeUtil.getCD(otherTestResult.getReportStatus()));
      reportStatusEntryRelationship.setObservation(reportStatusObs);
      otherTestResultObs.getEntryRelationship().add(reportStatusEntryRelationship);
    }
  }

  public static Coverage2 getEntitlementCoverage(
      au.gov.nehta.model.clinical.etp.common.participation.Entitlement entitlement,
      String performerAssignedEntityId) {
    Coverage2 coverage = objectFactoryExt.createCoverage2();
    coverage.setTypeCode("COVBY");
    Entitlement entitlementCda = objectFactoryExt.createEntitlement();
    entitlementCda.setClassCode(EntityClass.COV);
    entitlementCda.setMoodCode(ActMood.EVN);
    entitlementCda.setId(CDATypeUtil.getII(entitlement.getEntitlementNumber().getRoot(),
        entitlement.getEntitlementNumber().getExtension()));
    entitlementCda.setCode(EntitlementTypeCodeSet.convert(entitlement.getEntitlementType()));
    entitlementCda
        .setEffectiveTime(Converter.convert(entitlement.getEntitlementValidityDuration()));
    // Participant start
    Participant participantCda = objectFactoryExt.createParticipant();
    participantCda.setTypeCode(ParticipationType.HLD);
    ParticipantRole participantRoleCda = objectFactoryExt.createParticipantRole();
    participantRoleCda.setClassCode(RoleClass.ASSIGNED);
    // This SHALL hold the same value as performer/assignedEntity/id
    participantRoleCda.setId(CDATypeUtil.getII(performerAssignedEntityId));
    participantCda.setParticipantRole(participantRoleCda);
    entitlementCda.getParticipant().add(participantCda);
    coverage.setEntitlement(entitlementCda);

    return coverage;
  }

  private POCDMT000040Entry getRequestedServiceEntry(RequestedService requestedService) {

    POCDMT000040Entry requestedServiceEntry = objectFactory.createPOCDMT000040Entry();
    // Requested Service Description
    POCDMT000040Act requestedServiceEntryAct = objectFactory.createPOCDMT000040Act();
    requestedServiceEntryAct.setClassCode(XActClassDocumentEntryAct.ACT);
    requestedServiceEntryAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    requestedServiceEntryAct.setCode(Converter.convertToCECode(new CodeImpl(
        requestedService.getRequestedServiceDescription().getCode(),
        requestedService.getRequestedServiceDescription().getCodeSystem(),
        requestedService.getRequestedServiceDescription().getCodeSystemName(),
        requestedService.getRequestedServiceDescription().getDisplayName())));

    if (requestedService.getServiceBookingStatus() == EventTypes.EVENT) {
      requestedServiceEntryAct.setEffectiveTime(
          Converter.convert(requestedService.getRequestedServiceDateTime()));
      requestedServiceEntryAct.setMoodCode(XDocumentActMood.EVN);
    } else if (requestedService.getServiceBookingStatus() == EventTypes.INTENT) {
      requestedServiceEntryAct.setEffectiveTime(
          Converter.convert(requestedService.getServiceCommencementWindow()));
      requestedServiceEntryAct.setMoodCode(XDocumentActMood.INT);
    }

    if (null != requestedService.getServiceComment()) {//Service Referral CDA Type
      POCDMT000040EntryRelationship serviceCommentEntryRel = objectFactory
          .createPOCDMT000040EntryRelationship();
      serviceCommentEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Act serviceCommentAct = objectFactory.createPOCDMT000040Act();
      serviceCommentAct.setClassCode(XActClassDocumentEntryAct.INFRM);
      serviceCommentAct.setMoodCode(XDocumentActMood.EVN);
      serviceCommentAct.setCode(codeMap.get(ClinicalDocumentCodes.SERVICE_COMMENT));
      serviceCommentAct.setText(CDATypeUtil.getST(requestedService.getServiceComment()));
      serviceCommentEntryRel.setAct(serviceCommentAct);
      requestedServiceEntryAct.getEntryRelationship().add(serviceCommentEntryRel);
    }

    requestedServiceEntry.setAct(requestedServiceEntryAct);

    // Subject of Care Instruction Description Begin (part of requestedServiceAct)
    POCDMT000040EntryRelationship subjectOfCareEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    subjectOfCareEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act subjectOfCareAct = objectFactory.createPOCDMT000040Act();
    subjectOfCareAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    subjectOfCareAct.setMoodCode(XDocumentActMood.EVN);
    subjectOfCareAct.setCode(codeMap.get(ClinicalDocumentCodes.SUBJECT_OF_CARE_INSTR_DESC));
    subjectOfCareAct.setText(CDATypeUtil.getED(requestedService.getSubjectOfCareInstructionDesc()));
    subjectOfCareEntryRelationship.setAct(subjectOfCareAct);
    requestedServiceEntryAct.getEntryRelationship().add(subjectOfCareEntryRelationship);

    // Service Provider
    if (null != requestedService.getParticipant()) {
      requestedServiceEntryAct.getPerformer()
          .add(getServiceProviderPerformer(requestedService.getParticipant(), false));
    }

    // Requested Service DateTime Begin
    POCDMT000040EntryRelationship requestedServiceDateTimeEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    requestedServiceDateTimeEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act requestedServiceDateTimeAct = objectFactory.createPOCDMT000040Act();
    requestedServiceDateTimeAct.setClassCode(XActClassDocumentEntryAct.ACT);
    requestedServiceDateTimeAct.setMoodCode(XDocumentActMood.EVN);
    requestedServiceDateTimeAct
        .setCode(codeMap.get(ClinicalDocumentCodes.REQUESTED_SERVICE_DATETIME));
    requestedServiceDateTimeAct.setEffectiveTime(
        Converter.convert(requestedService.getRequestedServiceDateTime()));
    requestedServiceDateTimeEntryRelationship.setAct(requestedServiceDateTimeAct);
    requestedServiceEntryAct.getEntryRelationship().add(requestedServiceDateTimeEntryRelationship);

    return requestedServiceEntry;
  }


  public static POCDMT000040Performer2 getServiceProviderPerformer(
      ParticipationServiceProvider participationServiceProvider, boolean isServiceReferral) {
    //Service Provider Start
    POCDMT000040Performer2 performer = null;

    // Mutually Exclusive (Healthcare Person or Organisation) -stop user initializing both (throw exception)
    if (null != participationServiceProvider.getParticipant().getHealthCareProvider()) {
      performer = getHealthcarePersonPerformer(participationServiceProvider, isServiceReferral);

    } else if (null != participationServiceProvider.getParticipant().getOrganisation()) {
      performer = getOrganizationPerformer(participationServiceProvider);
    }

    return performer;
  }

  public static POCDMT000040Performer2 getHealthcarePersonPerformer(
      ParticipationServiceProvider participationServiceProvider, boolean isServiceReferral) {

    ServiceProvider serviceProvider = participationServiceProvider.getParticipant();
    POCDMT000040Performer2 performer = objectFactory.createPOCDMT000040Performer2();
    POCDMT000040AssignedEntity assignedEntity = objectFactory.createPOCDMT000040AssignedEntity();
    performer.setTypeCode(ParticipationPhysicalPerformer.PRF);
    assignedEntity.setCode(Converter.convertToCECode(participationServiceProvider.getRole()));

    II assignedEntityEntitlementUUID = CDATypeUtil.getII(UUID.randomUUID().toString());
    assignedEntity.getId().add(assignedEntityEntitlementUUID);

    //Assigned Person
    POCDMT000040Person assignedPerson = objectFactory.createPOCDMT000040Person();

    if (null != serviceProvider.getEntityIdentifiers()) {
      assignedPerson.getAsEntityIdentifier()
          .addAll(Converter.convertEntityIdentifiers(serviceProvider.getEntityIdentifiers()));
    }
    //Assigned Person Name
    assignedPerson.getName()
        .addAll(Converter.convertNames(serviceProvider.getHealthCareProvider().getPersonNames()));
    if (null != serviceProvider.getHealthCareProvider().getDateOfBirth() && !isServiceReferral) {
      assignedPerson.setBirthTime(Converter
          .getTS(serviceProvider.getHealthCareProvider().getDateOfBirth().getDateTime(), true));
    }
    if (null != serviceProvider.getHealthCareProvider().getGender() && !isServiceReferral) {
      assignedPerson.setAdministrativeGenderCode(
          Converter.convert(serviceProvider.getHealthCareProvider().getGender().getSex()));
    }
    //extension :  Employer Organisation for assigned Person
    Employment assignedPersonEmployment = getEmploymentDetails(serviceProvider);
    assignedPerson.setAsEmployment(assignedPersonEmployment);

    //Address Detail
    List<Address> addresses = serviceProvider.getAddresses();
    assignedEntity.getAddr().addAll(AddressConverter.convertAustralianAddress(addresses));

    //Communication Detail
    List<ElectronicCommunicationDetail> electronicCommunicationDetails =
        serviceProvider.getElectronicCommunicationDetails();
    assignedEntity.getTelecom()
        .addAll(Converter.convertElectronicCommunicationDetail(electronicCommunicationDetails));

    // Qualifications
    Qualifications qualifications = getQualifications(serviceProvider);
    assignedPerson.setAsQualifications(qualifications);

    assignedEntity.setAssignedPerson(assignedPerson);
    performer.setAssignedEntity(assignedEntity);
    return performer;
  }

  public static Qualifications getQualifications(ServiceProvider serviceProvider) {
    Qualifications qualifications = objectFactoryExt.createQualifications();
    qualifications.setClassCode(EntityClass.QUAL);
    CE qualificationsCode = objectFactory.createCE();
    qualificationsCode.setOriginalText(CDATypeUtil.getED(serviceProvider
        .getHealthCareProvider().getQualifications()));
    qualifications.setCode(qualificationsCode);
    return qualifications;
  }

  public static Employment getEmploymentDetails(ServiceProvider serviceProvider) {
    Employment assignedPersonEmployment = objectFactoryExt.createEmployment();
    EmploymentOrganization employmentOrganization = serviceProvider.getHealthCareProvider()
        .getEmploymentOrganisation();
    assignedPersonEmployment.setClassCode(EntityClass.EMP);
    assignedPersonEmployment
        .setJobClassCode(Converter.convertToCECode(employmentOrganization.getEmploymentType()));
    assignedPersonEmployment
        .setJobCode(Converter.convertToCECode(employmentOrganization.getOccupation()));
    assignedPersonEmployment.setCode(Converter.convertToCECode(employmentOrganization
        .getPositionInOrganization()));
    POCDMT000040Organization employerOrganisation = objectFactory.createPOCDMT000040Organization();
    employerOrganisation.getName().add(Converter.getOrganizationNameAndUse(employmentOrganization));
    POCDMT000040OrganizationPartOf asOrganisationPartOf = objectFactory
        .createPOCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganisation = objectFactory.createPOCDMT000040Organization();
    if (null != employmentOrganization.getElectronicCommunicationDetails()) {
      wholeOrganisation.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
          employmentOrganization.getElectronicCommunicationDetails()));
    }
    if (null != employmentOrganization.getAddresses()) {
      wholeOrganisation.getAddr()
          .addAll(AddressConverter.convertAustralianAddress(employmentOrganization.getAddresses()));
    }
    wholeOrganisation.getName()
        .add(Converter.getOrganizationNameAndUse(employmentOrganization.getName()));
    List<AsEntityIdentifier> woIdentifiers = employmentOrganization.getIdentifiers();
    woIdentifiers.stream().filter(Objects::nonNull).forEach(
        asEntityIdentifier -> wholeOrganisation.getAsEntityIdentifier()
            .add(Converter.convert(asEntityIdentifier)));
    asOrganisationPartOf.setWholeOrganization(wholeOrganisation);
    employerOrganisation.setAsOrganizationPartOf(asOrganisationPartOf);
    assignedPersonEmployment.setEmployerOrganization(employerOrganisation);
    return assignedPersonEmployment;
  }

  public static POCDMT000040Performer2 getOrganizationPerformer(
      ParticipationServiceProvider participationServiceProvider) {

    ServiceProvider serviceProvider = participationServiceProvider.getParticipant();
    POCDMT000040Performer2 performer = objectFactory.createPOCDMT000040Performer2();
    performer.setTypeCode(ParticipationPhysicalPerformer.PRF);
    performer.setTime(Converter.convert(participationServiceProvider.getParticipationPeriod()));
    POCDMT000040AssignedEntity assignedEntity = objectFactory.createPOCDMT000040AssignedEntity();
    assignedEntity.setCode(Converter.convertToCECode(participationServiceProvider.getRole()));
    assignedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));

    //Represented Organisation
    POCDMT000040Organization representedOrganization = getOrganization(serviceProvider);

    assignedEntity.setRepresentedOrganization(representedOrganization);

    //Address Detail
    List<Address> addresses = serviceProvider.getAddresses();
    assignedEntity.getAddr().addAll(AddressConverter.convertAustralianAddress(addresses));

    //Communication Detail
    List<ElectronicCommunicationDetail> electronicCommunicationDetails =
        serviceProvider.getElectronicCommunicationDetails();
    assignedEntity.getTelecom()
        .addAll(Converter.convertElectronicCommunicationDetail(electronicCommunicationDetails));

    performer.setAssignedEntity(assignedEntity);
    return performer;
  }

  public static POCDMT000040Organization getOrganization(ServiceProvider serviceProvider) {
    POCDMT000040Organization representedOrganization = objectFactory
        .createPOCDMT000040Organization();
    POCDMT000040OrganizationPartOf asOrganisationPartOf = objectFactory
        .createPOCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganisation = objectFactory.createPOCDMT000040Organization();
    //List of Entity Identifiers for whole organisation
    if (null != serviceProvider.getEntityIdentifiers()) {
      serviceProvider.getEntityIdentifiers().stream().filter(Objects::nonNull)
          .forEach(asEntityIdentifier -> wholeOrganisation.getAsEntityIdentifier()
              .add(Converter.convert(asEntityIdentifier)));
    }
    //Whole Organisation Name
    wholeOrganisation.getName().add(Converter.getOrganizationNameAndUse(serviceProvider
        .getOrganisation().getOrganisationName()));
    asOrganisationPartOf.setWholeOrganization(wholeOrganisation);
    representedOrganization.setAsOrganizationPartOf(asOrganisationPartOf);
    return representedOrganization;
  }

  private POCDMT000040Entry getImagingExaminationResultEntry(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040Entry imagingExaminationResultEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation imagingExaminationResultObservation = objectFactory
        .createPOCDMT000040Observation();
    imagingExaminationResultObservation.setClassCode(ActClassObservation.OBS);
    imagingExaminationResultObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    imagingExaminationResultObservation.getId()
        .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    imagingExaminationResultObservation.setCode(Converter.convertToCDCode(imagingExaminationResult
        .getImagingExaminationResultName()));
    imagingExaminationResultObservation.getValue().add(Converter.convert(imagingExaminationResult
        .getExaminationResultRepresentation()));
    imagingExaminationResultObservation.getMethodCode()
        .add(Converter.convertToCECode(imagingExaminationResult
            .getImagingModality()));
    // Anatomical Site list
    if (null != imagingExaminationResult.getAnatomicalSites()
        && !imagingExaminationResult.getAnatomicalSites().isEmpty()) {
      imagingExaminationResult.getAnatomicalSites().stream().filter(Objects::nonNull)
          .forEach(anatomicalSite -> processAnatomicalSite(imagingExaminationResultObservation,
              anatomicalSite, XActRelationshipEntryRelationship.REFR));
    }
    // Imaging Examination Result Status
    imagingExaminationResultObservation.getEntryRelationship()
        .add(getResultStatusRelForImgExamResult(imagingExaminationResult));
    // Clinical Information Provided
    imagingExaminationResultObservation.getEntryRelationship()
        .add(getClinicalInfoProvidedForImgExamResult(imagingExaminationResult));
    // Findings
    imagingExaminationResultObservation.getEntryRelationship()
        .add(getFindingsForImgExamResult(imagingExaminationResult));

    // Imaging Examination Result Group
    if (null != imagingExaminationResult.getResultGroups()
        && !imagingExaminationResult.getResultGroups().isEmpty()) {
      imagingExaminationResultObservation.getEntryRelationship()
          .addAll(processImagingExaminationResultGroupEntryRelationships(
              imagingExaminationResult.getResultGroups()));
    }

    // Examination Result Presentation
    imagingExaminationResultObservation
        .setText(CDATypeUtil.getED(imagingExaminationResult.getExaminationResultRepresentation()));

    //Examination Request Details
    imagingExaminationResult.getExaminationRequestDetails().stream()
        .filter(Objects::nonNull).forEach(
        examinationRequestDetails -> imagingExaminationResultObservation.getEntryRelationship()
            .add(getExaminationRequestDetails(examinationRequestDetails)));

    // Observation DateTime
    POCDMT000040EntryRelationship odtEntryRelationShip =
        objectFactory.createPOCDMT000040EntryRelationship();
    odtEntryRelationShip.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation odtObservation = objectFactory.createPOCDMT000040Observation();
    odtObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    odtObservation.setClassCode(ActClassObservation.OBS);
    odtObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    odtObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT_DATETIME));
    odtObservation.setEffectiveTime(
        Converter.convert(imagingExaminationResult.getObservationDateTime()));
    odtEntryRelationShip.setObservation(odtObservation);
    imagingExaminationResultObservation.getEntryRelationship().add(odtEntryRelationShip);

    imagingExaminationResultEntry.setObservation(imagingExaminationResultObservation);

    return imagingExaminationResultEntry;
  }

  private POCDMT000040EntryRelationship getFindingsForImgExamResult(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040EntryRelationship fEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    fEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation fObservation = objectFactory.createPOCDMT000040Observation();
    fObservation.setClassCode(ActClassObservation.OBS);
    fObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    fObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    fObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT_FINDINGS));
    fObservation.setText(CDATypeUtil.getST(imagingExaminationResult.getFindings()));
    fEntryRelationship.setObservation(fObservation);
    return fEntryRelationship;
  }

  private POCDMT000040EntryRelationship getClinicalInfoProvidedForImgExamResult(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040EntryRelationship cipEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    cipEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act cipAct = objectFactory.createPOCDMT000040Act();
    cipAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    cipAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    cipAct.setMoodCode(XDocumentActMood.EVN);
    cipAct.setCode(codeMap.get(ClinicalDocumentCodes.CLINICAL_INFORMATION_PROVIDED));
    cipAct.setText(CDATypeUtil.getST(imagingExaminationResult.getClinicalInformationProvided()));
    cipEntryRelationship.setAct(cipAct);
    return cipEntryRelationship;
  }

  private POCDMT000040EntryRelationship getResultStatusRelForImgExamResult(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040EntryRelationship ierEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    ierEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation ierObservation = objectFactory.createPOCDMT000040Observation();
    ierObservation.setClassCode(ActClassObservation.OBS);
    ierObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    ierObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    ierObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.IMAGING_EXMINATION_RESULT_STATUS));
    ierObservation.getValue().add(Converter.convertToCDCode(imagingExaminationResult
        .getImagingExaminationResultStatus()));
    ierEntryRelationship.setObservation(ierObservation);
    return ierEntryRelationship;
  }

  private POCDMT000040EntryRelationship getExaminationRequestDetails(
      ExaminationRequestDetails examinationRequestDetails) {
    // Examination Request Details Begin
    POCDMT000040EntryRelationship examReqDetailsEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    examReqDetailsEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    examReqDetailsEntryRelationship.setInversionInd(true);
    POCDMT000040Act examReqDetailsAct = objectFactory.createPOCDMT000040Act();
    examReqDetailsAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    examReqDetailsAct.setClassCode(XActClassDocumentEntryAct.ACT);
    examReqDetailsAct.setMoodCode(XDocumentActMood.EVN);
    examReqDetailsAct
        .setCode(codeMap.get(ClinicalDocumentCodes.EXAMINATION_REQUEST_DETAILS));
    examReqDetailsEntryRelationship.setAct(examReqDetailsAct);

    //Examination Request Details -> Examination Request Name (List)
    examinationRequestDetails.getExaminationRequestedNames().forEach(requestedName -> {
      POCDMT000040EntryRelationship examReqNameEntryRelationship = objectFactory
          .createPOCDMT000040EntryRelationship();
      examReqNameEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
      POCDMT000040Observation examReqNameObservation = objectFactory
          .createPOCDMT000040Observation();
      examReqNameObservation.setClassCode(ActClassObservation.OBS);
      examReqNameObservation.setMoodCode(XActMoodDocumentObservation.EVN);
      examReqNameObservation
          .setCode(codeMap.get(ClinicalDocumentCodes.EXAMINATION_REQUESTED_NAME));
      examReqNameEntryRelationship.setObservation(examReqNameObservation);
      examReqNameObservation.getValue().add(CDATypeUtil.getST(requestedName));
      examReqNameObservation.setText(CDATypeUtil.getST(requestedName));
      examReqDetailsEntryRelationship.getAct().getEntryRelationship()
          .add(examReqNameEntryRelationship);
    });

    // Examination Request Details -> Report Identifier Begin
    POCDMT000040EntryRelationship reportIdentifierRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    reportIdentifierRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation reportIdentifierObservation = objectFactory
        .createPOCDMT000040Observation();
    reportIdentifierRelationship.setObservation(reportIdentifierObservation);
    reportIdentifierObservation.setClassCode(ActClassObservation.OBS);
    reportIdentifierObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    reportIdentifierObservation.getId()
        .add(CDATypeUtil.getII(examinationRequestDetails.getReportIdentifier().getRoot()));
    reportIdentifierObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.EXAMINATION_REPORT_IDENTIFIER));
    examReqDetailsAct.getEntryRelationship().add(reportIdentifierRelationship);

    //  DICOM Study Identifier Begin (examination performed)
    POCDMT000040EntryRelationship examinationPerformedEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    examinationPerformedEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    //examinationPerformedEntryRelationship.setInversionInd(true);
    POCDMT000040Act dsiAct = objectFactory.createPOCDMT000040Act();
    dsiAct.setClassCode(XActClassDocumentEntryAct.ACT);
    dsiAct.setMoodCode(XDocumentActMood.EVN);
    dsiAct.setCode(codeMap.get(ClinicalDocumentCodes.DICOM_STUDY_IDENTIFIER));
    dsiAct.getId()
        .add(CDATypeUtil.getII(examinationRequestDetails.getSeriesIdentifier().getRoot(),
            examinationRequestDetails.getSeriesIdentifier().getExtension()));
    examinationPerformedEntryRelationship.setAct(dsiAct);
    examReqDetailsAct.getEntryRelationship().add(examinationPerformedEntryRelationship);

    // Image Details Begin
    examinationRequestDetails.getImageDetails().stream().filter(Objects::nonNull)
        .forEach(imageDetail -> dsiAct.getEntryRelationship()
            .add(createImageDetailEntryRelationship(imageDetail)));

    return examReqDetailsEntryRelationship;
  }

  private POCDMT000040EntryRelationship createImageDetailEntryRelationship(
      ImageDetails imageDetail) {
    POCDMT000040EntryRelationship imageDetailEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    imageDetailEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    //imageDetailEntryRelationship.setInversionInd(true);
    POCDMT000040Observation imageDetailObservation = objectFactory.createPOCDMT000040Observation();
    imageDetailObservation.setClassCode(ActClassObservation.OBS);
    imageDetailObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    imageDetailObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.EXMANATION_IMAGE_DETAILS));
    imageDetailObservation.getId().add(CDATypeUtil.getII(imageDetail.getImageIdentifier().getRoot(),
        imageDetail.getImageIdentifier().getExtension()));
    imageDetailObservation.getValue()
        .add(Converter.convertToCDCode(imageDetail.getImageViewName()));

    //DICOM Identifier
    POCDMT000040EntryRelationship dcomEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    dcomEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Act dcomAct = objectFactory.createPOCDMT000040Act();
    dcomAct.setClassCode(XActClassDocumentEntryAct.ACT);
    dcomAct.setMoodCode(XDocumentActMood.EVN);
    dcomAct.getId().add(CDATypeUtil.getII(imageDetail.getSeriesIdentifier().getRoot(),
        imageDetail.getSeriesIdentifier().getExtension()));
    dcomAct.setCode(codeMap.get(ClinicalDocumentCodes.DICOM_SERIES_IDENTIFIER));
    dcomEntryRelationship.setAct(dcomAct);
    imageDetailObservation.getEntryRelationship().add(dcomEntryRelationship);

    // Subject Position Begin
    POCDMT000040EntryRelationship spEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    spEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation spObservation = objectFactory.createPOCDMT000040Observation();
    spObservation.setClassCode(ActClassObservation.OBS);
    spObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    spObservation.setCode(codeMap.get(ClinicalDocumentCodes.SUBJECT_POSITION));
    spObservation.getValue().add(CDATypeUtil.getST(imageDetail.getSubjectPosition()));
    spEntryRelationship.setObservation(spObservation);

    imageDetailObservation.getEntryRelationship().add(spEntryRelationship);
    imageDetailObservation.setEffectiveTime(Converter.convert(imageDetail.getImageDateTime()));
    //Image Observation Media
    if (null != imageDetail.getImage()) {
      POCDMT000040EntryRelationship imageEntryRelationship = objectFactory
          .createPOCDMT000040EntryRelationship();
      imageEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SPRT);
      POCDMT000040ObservationMedia imageObservationMedia = objectFactory
          .createPOCDMT000040ObservationMedia();
      imageObservationMedia.setClassCode(ActClassObservation.OBS);
      imageObservationMedia.setMoodCode(ActMood.EVN);
      imageObservationMedia.setIDAttribute(CDATypeUtil.getUUID());
      imageObservationMedia.setValue(getEDFromAttachedMedia(imageDetail.getImage()));
      imageObservationMedia.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      imageDetail.getImage().setObservationMediaReference(imageObservationMedia);
      imageEntryRelationship.setObservationMedia(imageObservationMedia);
      imageDetailObservation.getEntryRelationship().add(imageEntryRelationship);
    }

    imageDetailEntryRelationship.setObservation(imageDetailObservation);
    return imageDetailEntryRelationship;
  }

  private List<POCDMT000040EntryRelationship>
  getRelationshipsForPathologyTestResult(PathologyTestResult pathologyTestResult) {
    List<POCDMT000040EntryRelationship> pathologyTestResultEntryRels = new LinkedList<>();
    // Diagnostic Service Relationship
    pathologyTestResultEntryRels.add(getDiagnosticServiceEntryRelationship(pathologyTestResult));
    // Overall Pathology Test Result Status
    pathologyTestResultEntryRels.add(
        addOverallPathologyTestResultStatusRelationship(pathologyTestResult));
    // Clinical Information Provided Relationship
    pathologyTestResultEntryRels.add(addClinicalInfoProvidedRelationship(pathologyTestResult));
    // Pathological Diagnosis
    if (null != pathologyTestResult.getPathologicalDiagnoses()
        && !pathologyTestResult.getPathologicalDiagnoses().isEmpty()) {
      pathologyTestResultEntryRels.add(addPathologicalDiagnosisRelationship(pathologyTestResult));
    }
    // Pathological Test Conclusion
    pathologyTestResultEntryRels.add(
        addPathologicalTestConclusionRelationship(pathologyTestResult));
    // Test Comment
    pathologyTestResultEntryRels.add(addPathologicalTestComment(pathologyTestResult));
    // Test Request Details
    pathologyTestResultEntryRels.add(addPathologicalTestRequestDetails(pathologyTestResult));
    // Observation DateTime
    pathologyTestResultEntryRels.add(
        addPathologyTestResultObservationDateTime(pathologyTestResult));
    return pathologyTestResultEntryRels;
  }

  private POCDMT000040EntryRelationship getSpecimenDetailEntryRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship testSpecimenDetailEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    testSpecimenDetailEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    POCDMT000040Observation testSpecimenDetailObservation = objectFactory
        .createPOCDMT000040Observation();
    testSpecimenDetailObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    testSpecimenDetailObservation.setClassCode(ActClassObservation.OBS);
    testSpecimenDetailObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    testSpecimenDetailObservation.setCode(codeMap.get(ClinicalDocumentCodes.SPECIMEN));
    testSpecimenDetailObservation.setEffectiveTime(
        Converter.convert(testSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime()));
    if (null != testSpecimenDetail.getCollectionProcedure()) {
      testSpecimenDetailObservation.getMethodCode()
          .add(Converter.convertToCECode(testSpecimenDetail.getCollectionProcedure()));
    }
    // Anatomical Site list
    if (null != testSpecimenDetail.getAnatomicalSites()
        && !testSpecimenDetail.getAnatomicalSites().isEmpty()) {
      processAnatomicalSites(
          testSpecimenDetail.getAnatomicalSites(), testSpecimenDetailObservation);
    }
    POCDMT000040Specimen specimen = objectFactory.createPOCDMT000040Specimen();
    POCDMT000040SpecimenRole specimenRole = objectFactory.createPOCDMT000040SpecimenRole();
    if (null != testSpecimenDetail.getIdentifiers()) {
      specimenRole.getId().add(CDATypeUtil.getII(
          testSpecimenDetail.getIdentifiers().getSpecimenIdentifier().getRoot(),
          testSpecimenDetail.getIdentifiers().getSpecimenIdentifier().getExtension()));
    }
    POCDMT000040PlayingEntity specimenPlayingEntity = objectFactory
        .createPOCDMT000040PlayingEntity();
    specimenPlayingEntity.setCode(Converter.convertToCECode(
        testSpecimenDetail.getSpecimenTissueType()));
    // Physical Details
    if (null != testSpecimenDetail.getPhysicalDetails()
        && !testSpecimenDetail.getPhysicalDetails().isEmpty()) {
      processPhysicalDetailsList(
          testSpecimenDetail, testSpecimenDetailObservation, specimenPlayingEntity);
    }
    testSpecimenDetailObservation.getEntryRelationship()
        .addAll(getRelationshipsForSpecimenDetail(testSpecimenDetail));
    specimenRole.setSpecimenPlayingEntity(specimenPlayingEntity);
    specimen.setSpecimenRole(specimenRole);
    testSpecimenDetailObservation.getSpecimen().add(specimen);
    testSpecimenDetailEntryRelationship.setObservation(testSpecimenDetailObservation);
    return testSpecimenDetailEntryRelationship;
  }

  private List<POCDMT000040EntryRelationship> getRelationshipsForSpecimenDetail(
      TestSpecimenDetail testSpecimenDetail) {
    List<POCDMT000040EntryRelationship> testSpecimenDetailRels = new LinkedList<>();
    // Collection Handling -> Sampling Preconditions - Relationship
    if (null != testSpecimenDetail.getCollectionAndHandling()
        && null != testSpecimenDetail.getCollectionAndHandling().getSamplingPreconditions()) {
      testSpecimenDetailRels.add(getSamplingPreconditionsRelationship(testSpecimenDetail));
    }
    // Handling and Processing -> Collection Setting - Relationship
    if (null != testSpecimenDetail.getHandlingAndProcessing()) {
      if (null != testSpecimenDetail.getHandlingAndProcessing().getCollectionSetting()) {
        testSpecimenDetailRels.add(getCollectionSettingRelationship(testSpecimenDetail));
      }
      // Handling and Processing -> Receipt Date & Time - Relationship
      if (null != testSpecimenDetail.getHandlingAndProcessing().getReceiptDateTime()) {
        testSpecimenDetailRels.add(getReceiptDateTimeRelationship(testSpecimenDetail));
      }
    }
    // Parent Specimen Identifier - Relationship
    if (null != testSpecimenDetail.getIdentifiers()
        && null != testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier()) {
      testSpecimenDetailRels.add(getParentSpecimenIdentifierRelationship(testSpecimenDetail));
    }
    return testSpecimenDetailRels;
  }

  private POCDMT000040EntryRelationship addPathologyTestResultObservationDateTime(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestResObservationDateTimeRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    pathTestResObservationDateTimeRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation pathTestResObservationDateTimeObs = objectFactory
        .createPOCDMT000040Observation();
    pathTestResObservationDateTimeObs.setClassCode(ActClassObservation.OBS);
    pathTestResObservationDateTimeObs.setMoodCode(XActMoodDocumentObservation.EVN);
    pathTestResObservationDateTimeObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathTestResObservationDateTimeObs
        .setCode(codeMap.get(ClinicalDocumentCodes.PATHOLOGY_TEST_RESULT_DATETIME));
    pathTestResObservationDateTimeObs.setEffectiveTime(
        Converter.convert(pathologyTestResult.getObservationDateTime()));
    pathTestResObservationDateTimeRelationship.setObservation(pathTestResObservationDateTimeObs);
    return pathTestResObservationDateTimeRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalTestRequestDetails(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestReqDetailsRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    pathTestReqDetailsRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    pathTestReqDetailsRelationship.setInversionInd(true);
    POCDMT000040Act pathTestReqDetailsAct = objectFactory.createPOCDMT000040Act();
    pathTestReqDetailsAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathTestReqDetailsAct.setClassCode(XActClassDocumentEntryAct.ACT);
    pathTestReqDetailsAct.setMoodCode(XDocumentActMood.EVN);
    pathTestReqDetailsAct.setCode(codeMap.get(ClinicalDocumentCodes.TEST_REQ_DETAILS));
    pathologyTestResult.getTestRequestDetails().getTestRequestedNames().stream()
        .filter(Objects::nonNull).forEach(coded -> {
      POCDMT000040EntryRelationship testReqNameEntryRel =
          objectFactory.createPOCDMT000040EntryRelationship();
      testReqNameEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Observation testReqNameObservation = objectFactory
          .createPOCDMT000040Observation();
      testReqNameObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      testReqNameObservation.setClassCode(ActClassObservation.OBS);
      testReqNameObservation.setMoodCode(XActMoodDocumentObservation.RQO);
      testReqNameObservation.setCode(codeMap.get(ClinicalDocumentCodes.TEST_REQ_NAME));
      testReqNameObservation.getValue().add(Converter.convertToCDCode(coded));
      testReqNameEntryRel.setObservation(testReqNameObservation);
      pathTestReqDetailsAct.getEntryRelationship().add(testReqNameEntryRel);
    });
    pathTestReqDetailsRelationship.setAct(pathTestReqDetailsAct);
    return pathTestReqDetailsRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalTestComment(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestCommentRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    pathTestCommentRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act pathTestCommentAct = objectFactory.createPOCDMT000040Act();
    pathTestCommentAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathTestCommentAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    pathTestCommentAct.setMoodCode(XDocumentActMood.EVN);
    pathTestCommentAct.setCode(codeMap.get(ClinicalDocumentCodes.PATH_TEST_COMMENT));
    pathTestCommentAct.setText(CDATypeUtil.getST(pathologyTestResult.getTestComment()));
    pathTestCommentRelationship.setAct(pathTestCommentAct);
    return pathTestCommentRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalTestConclusionRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestConclusionRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    pathTestConclusionRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation pathTestConclusionObservation = objectFactory
        .createPOCDMT000040Observation();
    pathTestConclusionObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathTestConclusionObservation.setClassCode(ActClassObservation.OBS);
    pathTestConclusionObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    pathTestConclusionObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.LAB_FINDINGS_INTERPRETATION));
    pathTestConclusionObservation.getValue()
        .add(CDATypeUtil.getST(pathologyTestResult.getConclusion()));
    pathTestConclusionRelationship.setObservation(pathTestConclusionObservation);
    return pathTestConclusionRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalDiagnosisRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathDiagnosisRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    pathDiagnosisRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation pathDiagnosisObservation = objectFactory
        .createPOCDMT000040Observation();
    pathDiagnosisObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathDiagnosisObservation.setClassCode(ActClassObservation.OBS);
    pathDiagnosisObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    pathDiagnosisObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.PATHOLOGICAL_DIAGNOSIS));
    pathologyTestResult.getPathologicalDiagnoses().stream().filter(Objects::nonNull)
        .forEach(
            coded -> pathDiagnosisObservation.getValue().add(Converter.convertToCDCode(coded)));
    pathDiagnosisRelationship.setObservation(pathDiagnosisObservation);
    return pathDiagnosisRelationship;
  }

  private void processPhysicalDetailsList(TestSpecimenDetail testSpecimenDetail,
      POCDMT000040Observation testSpecimenDetailObservation,
      POCDMT000040PlayingEntity specimenPlayingEntity) {
    testSpecimenDetail.getPhysicalDetails().stream().filter(Objects::nonNull).forEach(
        physicalDetails -> {
          specimenPlayingEntity.getQuantity()
              .add(getPhysicalQuantityFromPhysicalDetails(physicalDetails));
          specimenPlayingEntity.setDesc(CDATypeUtil.getST(physicalDetails.getDescription()));
          specimenPlayingEntity.setAsSpecimenInContainer(
              getSpecimenInContainer(testSpecimenDetail));
          if (null != physicalDetails.getImage()) {
            POCDMT000040EntryRelationship physicalDetailsImgEntryRelationship =
                objectFactory.createPOCDMT000040EntryRelationship();
            physicalDetailsImgEntryRelationship.setTypeCode(
                XActRelationshipEntryRelationship.SPRT);
            POCDMT000040ObservationMedia physicalDetailsImageObservationMedia =
                objectFactory.createPOCDMT000040ObservationMedia();
            physicalDetailsImageObservationMedia.setIDAttribute(CDATypeUtil.getUUID());
            physicalDetails.getImage()
                .setObservationMediaReference(physicalDetailsImageObservationMedia);
            physicalDetailsImageObservationMedia.setClassCode(ActClassObservation.OBS);
            physicalDetailsImageObservationMedia.setMoodCode(ActMood.EVN);
            physicalDetailsImageObservationMedia.getId()
                .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
            physicalDetailsImageObservationMedia.setValue(
                getEDFromAttachedMedia(physicalDetails.getImage()));
            physicalDetailsImgEntryRelationship.setObservationMedia(
                physicalDetailsImageObservationMedia);
            testSpecimenDetailObservation.getEntryRelationship()
                .add(physicalDetailsImgEntryRelationship);
          }
        }); // PhysicalDetails Ends
  }

  private PQ getPhysicalQuantityFromPhysicalDetails(PhysicalDetails physicalDetails) {
    PQ physicalQuantity = objectFactory.createPQ();
    physicalQuantity.setUnit(physicalDetails.getWeight().getUnit());
    physicalQuantity.setValue(physicalDetails.getWeight().getValue());
    return physicalQuantity;
  }

  private SpecimenInContainer getSpecimenInContainer(TestSpecimenDetail testSpecimenDetail) {
    SpecimenInContainer containerIdentifier = objectFactoryExt.createSpecimenInContainer();
    Container container = objectFactoryExt.createContainer();
    container.setId(CDATypeUtil.getII(
        testSpecimenDetail.getIdentifiers().getContainerIdentifier().getRoot(),
        testSpecimenDetail.getIdentifiers().getContainerIdentifier().getExtension()));
    containerIdentifier.setClassCode(EntityClass.CONT);
    containerIdentifier.setContainer(container);
    return containerIdentifier;
  }

  private List<POCDMT000040EntryRelationship> processResultGroups(
      List<ResultGroup> resultGroups) {
    List<POCDMT000040EntryRelationship> resultGroupEntryRelationships = new LinkedList<>();
    resultGroups.stream().filter(Objects::nonNull).forEach(resultGroup -> {
      POCDMT000040EntryRelationship resultGroupEntryRelationship =
          objectFactory.createPOCDMT000040EntryRelationship();
      resultGroupEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Organizer organizer = objectFactory.createPOCDMT000040Organizer();
      organizer.setClassCode(XActClassDocumentEntryOrganizer.BATTERY);
      organizer.setMoodCode(ActMood.EVN);
      organizer.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      organizer.setStatusCode(CDATypeUtil.getCS("completed"));
      organizer.setCode(
          Converter.convertToCDCode(resultGroup.getPathologyTestResultGroupName()));
      organizer.getComponent().addAll(processIndividualPathologyTestResults(resultGroup));
      if (null != resultGroup.getResultGroupSpecimenDetail()) {
        organizer.getComponent().add(processResultGroupSpecimenDetail(
            resultGroup.getResultGroupSpecimenDetail()));
      }
      resultGroupEntryRelationship.setOrganizer(organizer);
      resultGroupEntryRelationships.add(resultGroupEntryRelationship);
    });
    return resultGroupEntryRelationships;
  }

  private List<POCDMT000040EntryRelationship> processImagingExaminationResultGroupEntryRelationships(
      List<ImagingExaminationResultGroup> resultGroups) {

    List<POCDMT000040EntryRelationship> resultGroupEntryRelationships = new ArrayList<>();

    // Result Group Begin
    resultGroups.stream().filter(Objects::nonNull).forEach(resultGroup -> {
      POCDMT000040EntryRelationship resultGroupEntryRelationship = objectFactory
          .createPOCDMT000040EntryRelationship();
      resultGroupEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Organizer resultGroupOrganizer = objectFactory.createPOCDMT000040Organizer();
      resultGroupOrganizer.setClassCode(XActClassDocumentEntryOrganizer.BATTERY);
      resultGroupOrganizer.setMoodCode(ActMood.EVN);
      resultGroupOrganizer.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      resultGroupOrganizer.setStatusCode(CDATypeUtil.getCS("completed"));
      resultGroupOrganizer.setCode(Converter.convertToCDCode(resultGroup
          .getImagingExaminationResultGroupName()));

      // Individual Imaging Examination Results
      if (null != resultGroup.getResults() && !resultGroup.getResults().isEmpty()) {
        resultGroupOrganizer.getComponent()
            .addAll(processIndividualImagingExaminationResults(resultGroup.getResults(),
                resultGroup.getAnatomicalSite()));
      }

      resultGroupEntryRelationship.setOrganizer(resultGroupOrganizer);
      resultGroupEntryRelationships.add(resultGroupEntryRelationship);
    });

    return resultGroupEntryRelationships;
  }

  private List<POCDMT000040Component4> processIndividualImagingExaminationResults(
      List<ImagingResult> individualExaminationResults,
      AnatomicalSite anatomicalSiteFromResultGroup) {
    List<POCDMT000040Component4> individualImagingExaminationResultList = new LinkedList<>();

    // Individual Examination Result Begin
    POCDMT000040Component4 individualImageExaminationResultComponent = objectFactory
        .createPOCDMT000040Component4();
    individualExaminationResults.stream().filter(Objects::nonNull).forEach(
        individualResult -> {
          POCDMT000040Observation indImagingExaminationResultObservation = objectFactory
              .createPOCDMT000040Observation();
          indImagingExaminationResultObservation.setClassCode(ActClassObservation.OBS);
          indImagingExaminationResultObservation.setMoodCode(XActMoodDocumentObservation.EVN);
          indImagingExaminationResultObservation.getId()
              .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
          indImagingExaminationResultObservation.setCode(Converter.convertToCDCode(individualResult
              .getIndividualImagingExaminationResultName()));
          indImagingExaminationResultObservation.getValue().add(Converter.convert(individualResult
              .getIndividualImagingExaminationResultValue()
              .getQuantityResultValue()));

          // Reference Ranges
          indImagingExaminationResultObservation.getReferenceRange()
              .addAll(processReferenceRanges(individualResult));

          // Result Comments
          if (null != individualResult.getResultComments()
              && !individualResult.getResultComments().isEmpty()) {
            indImagingExaminationResultObservation.getEntryRelationship()
                .addAll(processResultComments(individualResult.getResultComments()));
          }

          // Anatomical Site list (0..1 As per CDA, at Result Group level)
          if (null != anatomicalSiteFromResultGroup) {
            processAnatomicalSite(indImagingExaminationResultObservation,
                anatomicalSiteFromResultGroup, XActRelationshipEntryRelationship.REFR);
          }

          individualImageExaminationResultComponent
              .setObservation(indImagingExaminationResultObservation);
          individualImagingExaminationResultList.add(individualImageExaminationResultComponent);
        });

    return individualImagingExaminationResultList;
  }

  private List<POCDMT000040EntryRelationship> processResultComments(
      List<String> resultComments) {
    List<POCDMT000040EntryRelationship> referenceRanges = new LinkedList<>();
    resultComments.stream().filter(Objects::nonNull)
        .forEach(comment -> {
          POCDMT000040EntryRelationship rcEntryRelationship =
              objectFactory.createPOCDMT000040EntryRelationship();
          rcEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
          POCDMT000040Act rcAct = objectFactory.createPOCDMT000040Act();
          rcAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
          rcAct.setClassCode(XActClassDocumentEntryAct.INFRM);
          rcAct.setMoodCode(XDocumentActMood.EVN);
          rcAct.setCode(codeMap.get(ClinicalDocumentCodes.INDIVIDIUAL_RESULT_COMMENT_CODE));
          rcAct.setText(CDATypeUtil.getST(comment));
          rcEntryRelationship.setAct(rcAct);
          referenceRanges.add(rcEntryRelationship);
        });

    return referenceRanges;
  }

  private List<POCDMT000040ReferenceRange> processReferenceRanges(
      ImagingResult individualResult) {

    List<POCDMT000040ReferenceRange> referenceRanges = new LinkedList<>();

    individualResult.getIndividualImagingExaminationResultValue().getReferenceRangeDetails()
        .getReferenceRanges().stream().filter(Objects::nonNull)
        .forEach(referenceRange -> {
          POCDMT000040ReferenceRange referenceRangeCda = objectFactory
              .createPOCDMT000040ReferenceRange();
          referenceRangeCda.setTypeCode(ActRelationshipType.REFV);
          POCDMT000040ObservationRange observationRange = objectFactory
              .createPOCDMT000040ObservationRange();
          observationRange.setClassCode(ActClassObservation.OBS);
          observationRange.setMoodCode(ActMood.EVN_CRT);
          observationRange.setCode(
              Converter.convertToCDCode(referenceRange.getReferenceRangeMeaning()));
          observationRange.setValue(Converter.convert(referenceRange));
          referenceRangeCda.setObservationRange(observationRange);

          referenceRanges.add(referenceRangeCda);
        });

    return referenceRanges;
  }

  private POCDMT000040Component4 processResultGroupSpecimenDetail(
      TestSpecimenDetail resultGroupSpecimenDetail) {
    POCDMT000040Component4 resultGroupSpecDetailComponent = objectFactory
        .createPOCDMT000040Component4();
    POCDMT000040Observation specDetailObservation = objectFactory.createPOCDMT000040Observation();
    specDetailObservation.setClassCode(ActClassObservation.OBS);
    specDetailObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    specDetailObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    specDetailObservation.setEffectiveTime(Converter.convert(
        resultGroupSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime()));
    specDetailObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.RESULT_GROUP_SPEC_DETAIL));
    specDetailObservation.getMethodCode()
        .add(Converter.convertToCECode(resultGroupSpecimenDetail.getCollectionProcedure()));
    if (null != resultGroupSpecimenDetail.getAnatomicalSites()) {
      processAnatomicalSites(resultGroupSpecimenDetail.getAnatomicalSites(), specDetailObservation);
    }
    POCDMT000040Specimen specimen = objectFactory.createPOCDMT000040Specimen();
    POCDMT000040SpecimenRole specimenRole = objectFactory.createPOCDMT000040SpecimenRole();
    specimenRole.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    POCDMT000040PlayingEntity specimenPlayingEntity = objectFactory
        .createPOCDMT000040PlayingEntity();
    specimenPlayingEntity.setCode(
        Converter.convertToCECode(resultGroupSpecimenDetail.getSpecimenTissueType()));
    specimenPlayingEntity.setAsSpecimenInContainer(
        getSpecimenInContainer(resultGroupSpecimenDetail));
    if (null != resultGroupSpecimenDetail.getPhysicalDetails()
        && !resultGroupSpecimenDetail.getPhysicalDetails().isEmpty()) {
      processPhysicalDetailsList(
          resultGroupSpecimenDetail, specDetailObservation, specimenPlayingEntity);
    }
    specDetailObservation.getEntryRelationship()
        .add(getCollectionSettingRelationship(resultGroupSpecimenDetail));
    specDetailObservation.getEntryRelationship()
        .add(getReceiptDateTimeRelationship(resultGroupSpecimenDetail));
    specDetailObservation.getEntryRelationship()
        .add(getParentSpecimenIdentifierRelationship(resultGroupSpecimenDetail));
    specimenRole.setSpecimenPlayingEntity(specimenPlayingEntity);
    specimen.setSpecimenRole(specimenRole);
    specDetailObservation.getSpecimen().add(specimen);
    resultGroupSpecDetailComponent.setObservation(specDetailObservation);
    return resultGroupSpecDetailComponent;
  }

  private List<POCDMT000040Component4> processIndividualPathologyTestResults(
      ResultGroup resultGroup) {
    List<POCDMT000040Component4> individualPathologyTestResults = new ArrayList<>();
    if (null != resultGroup.getIndividualPathologyTestResults()
        && !resultGroup.getIndividualPathologyTestResults().isEmpty()) {
      resultGroup.getIndividualPathologyTestResults().stream().filter(Objects::nonNull)
          .forEach(result -> {
            POCDMT000040Component4 individualPathologyTestResultComponent = objectFactory
                .createPOCDMT000040Component4();
            POCDMT000040Observation observation = objectFactory.createPOCDMT000040Observation();
            observation.setClassCode(ActClassObservation.OBS);
            observation.setMoodCode(XActMoodDocumentObservation.EVN);
            observation.getInterpretationCode().add(Converter.convertToCECode(
                result.getIndividualPathologyTestResultValue().getReferenceRangeDetails()
                    .getNormalStatus()));
            observation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
            observation.setCode(
                Converter.convertToCDCode(result.getIndividualPathologyTestResultName()));
            observation.getValue().add(Converter.convert(result
                .getIndividualPathologyTestResultValue().getQuantityResultValue()));
            if (null != result.getIndividualPathologyTestResultValue().getReferenceRangeDetails()
                .getReferenceRanges()) {
              observation.getReferenceRange().addAll(getReferenceRanges(
                  result.getIndividualPathologyTestResultValue().getReferenceRangeDetails()
                      .getReferenceRanges()));
            }
            observation.getEntryRelationship()
                .add(getIndividualPathologyTestResultCommentRelationship(result));
            observation.getEntryRelationship()
                .add(getIndividualPathologyTestResultRefRangeGuidanceEntryRelationship(result));
            observation.getEntryRelationship()
                .add(getIndividualPathologyTestResultStatusEntryRelationship(result));
            POCDMT000040ReferenceRange referenceRangeDetails = objectFactory
                .createPOCDMT000040ReferenceRange();
            referenceRangeDetails.setTypeCode(ActRelationshipType.REFV);
            POCDMT000040ObservationRange observationRange = objectFactory
                .createPOCDMT000040ObservationRange();
            observationRange.setClassCode(ActClassObservation.OBS);
            observationRange.setMoodCode(ActMood.EVN_CRT);
            individualPathologyTestResultComponent.setObservation(observation);
            individualPathologyTestResults.add(individualPathologyTestResultComponent);
          });
    }
    return individualPathologyTestResults;
  }

  private List<POCDMT000040ReferenceRange> getReferenceRanges(
      List<ReferenceRange> referenceRanges) {
    List<POCDMT000040ReferenceRange> referenceRangeList = new LinkedList<>();
    referenceRanges.stream().filter(Objects::nonNull).forEach(referenceRangeObj -> {
      POCDMT000040ReferenceRange referenceRange = objectFactory.createPOCDMT000040ReferenceRange();
      referenceRange.setTypeCode(ActRelationshipType.REFV);
      POCDMT000040ObservationRange observationRange = objectFactory
          .createPOCDMT000040ObservationRange();
      observationRange.setMoodCode(ActMood.EVN_CRT);
      observationRange
          .setCode(Converter.convertToCDCode(referenceRangeObj.getReferenceRangeMeaning()));
      observationRange.setValue(Converter.convert(referenceRangeObj));
      referenceRange.setObservationRange(observationRange);
      referenceRangeList.add(referenceRange);
    });
    return referenceRangeList;
  }

  private POCDMT000040EntryRelationship getIndividualPathologyTestResultStatusEntryRelationship(
      Result result) {
    POCDMT000040EntryRelationship individualTestResultStatusEntryRel =
        objectFactory.createPOCDMT000040EntryRelationship();
    individualTestResultStatusEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation resultStatusObservation = objectFactory.createPOCDMT000040Observation();
    resultStatusObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    resultStatusObservation.setClassCode(ActClassObservation.OBS);
    resultStatusObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    resultStatusObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_STATUS));
    resultStatusObservation.getValue()
        .add(Converter.convertToCDCode(result.getIndividualPathologyTestResultStatus()));
    individualTestResultStatusEntryRel.setObservation(resultStatusObservation);
    return individualTestResultStatusEntryRel;
  }

  private POCDMT000040EntryRelationship
  getIndividualPathologyTestResultRefRangeGuidanceEntryRelationship(Result result) {
    POCDMT000040EntryRelationship individualTestResultRefRangeGuidanceEntryRel =
        objectFactory.createPOCDMT000040EntryRelationship();
    individualTestResultRefRangeGuidanceEntryRel.setTypeCode(
        XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act refRangeGuidanceAct = objectFactory.createPOCDMT000040Act();
    refRangeGuidanceAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    refRangeGuidanceAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    refRangeGuidanceAct.setMoodCode(XDocumentActMood.EVN);
    refRangeGuidanceAct.setCode(
        codeMap.get(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS));
    refRangeGuidanceAct.setText(
        CDATypeUtil.getST(null != result.getIndividualPathologyTestResultReferenceRangeGuidance()
            ? result.getIndividualPathologyTestResultReferenceRangeGuidance() : "NA"));
    individualTestResultRefRangeGuidanceEntryRel.setAct(refRangeGuidanceAct);
    return individualTestResultRefRangeGuidanceEntryRel;
  }

  private POCDMT000040EntryRelationship getIndividualPathologyTestResultCommentRelationship(
      Result result) {
    POCDMT000040EntryRelationship individualTestResultCommentEntryRel =
        objectFactory.createPOCDMT000040EntryRelationship();
    individualTestResultCommentEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act individualResultCommentAct = objectFactory.createPOCDMT000040Act();
    individualResultCommentAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    individualResultCommentAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    individualResultCommentAct.setMoodCode(XDocumentActMood.EVN);
    individualResultCommentAct
        .setCode(codeMap.get(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_COMMENT));
    individualResultCommentAct.setText(
        CDATypeUtil.getST(null != result.getIndividualPathologyTestResultComment()
            ? result.getIndividualPathologyTestResultComment()
            : "NA"));
    individualTestResultCommentEntryRel.setAct(individualResultCommentAct);
    return individualTestResultCommentEntryRel;
  }

  private POCDMT000040EntryRelationship addClinicalInfoProvidedRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship clinicalInfoProvidedRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    clinicalInfoProvidedRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act clinicalInfoAct = objectFactory.createPOCDMT000040Act();
    clinicalInfoAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    clinicalInfoAct.setMoodCode(XDocumentActMood.EVN);
    clinicalInfoAct.setCode(codeMap.get(ClinicalDocumentCodes.CLINICAL_INFO));
    clinicalInfoAct.setText(
        CDATypeUtil.getST(pathologyTestResult.getClinicalInformationProvided()));
    clinicalInfoProvidedRelationship.setAct(clinicalInfoAct);
    return clinicalInfoProvidedRelationship;
  }

  private POCDMT000040EntryRelationship addOverallPathologyTestResultStatusRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship overallPathologyTestResultStatusRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    overallPathologyTestResultStatusRelationship.setTypeCode(
        XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation overallPathTestResultStatusObs = objectFactory
        .createPOCDMT000040Observation();
    overallPathTestResultStatusObs.setClassCode(ActClassObservation.OBS);
    overallPathTestResultStatusObs.setMoodCode(XActMoodDocumentObservation.EVN);
    overallPathTestResultStatusObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    overallPathTestResultStatusObs.setCode(codeMap.get(ClinicalDocumentCodes.REPORT_STATUS));
    overallPathTestResultStatusObs
        .getValue()
        .add(CDATypeUtil.getCD(pathologyTestResult.getOverallPathologyTestResultStatus()));
    overallPathologyTestResultStatusRelationship.setObservation(overallPathTestResultStatusObs);
    return overallPathologyTestResultStatusRelationship;
  }

  private void processAnatomicalSites(
      List<AnatomicalSite> anatomicalSites, POCDMT000040Observation observation) {
    anatomicalSites.stream().filter(Objects::nonNull).forEach(
        anatomicalSite -> processAnatomicalSite(observation, anatomicalSite,
            XActRelationshipEntryRelationship.SPRT));
  }

  private POCDMT000040EntryRelationship getParentSpecimenIdentifierRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship parentSpecIdEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    parentSpecIdEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation parentSpecIdObservation = objectFactory.createPOCDMT000040Observation();
    parentSpecIdObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    parentSpecIdObservation.setClassCode(ActClassObservation.OBS);
    parentSpecIdObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    parentSpecIdObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.PARENT_SPECIMEN_IDENTIFIER));
    POCDMT000040Specimen parentSpecIdSpecimen = objectFactory.createPOCDMT000040Specimen();
    POCDMT000040SpecimenRole parentSpecIdSpecimenRole = objectFactory
        .createPOCDMT000040SpecimenRole();
    parentSpecIdSpecimenRole.getId().add(CDATypeUtil.getII(
        testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier().getRoot(),
        testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier().getExtension()));
    parentSpecIdSpecimen.setSpecimenRole(parentSpecIdSpecimenRole);
    parentSpecIdObservation.getSpecimen().add(parentSpecIdSpecimen);
    parentSpecIdEntryRelationship.setObservation(parentSpecIdObservation);
    return parentSpecIdEntryRelationship;
  }


  private POCDMT000040EntryRelationship getSamplingPreconditionsRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship samplingPreconditionsEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    samplingPreconditionsEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation samplingPrecondObservation = objectFactory
        .createPOCDMT000040Observation();
    samplingPrecondObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    samplingPrecondObservation.setClassCode(ActClassObservation.OBS);
    samplingPrecondObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    samplingPrecondObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.SAMPLING_PRECONDITIONS));
    samplingPrecondObservation.getValue().add(CDATypeUtil.getCD(
        testSpecimenDetail.getCollectionAndHandling().getSamplingPreconditions()));
    samplingPreconditionsEntryRelationship.setObservation(samplingPrecondObservation);
    return samplingPreconditionsEntryRelationship;
  }

  private POCDMT000040EntryRelationship getReceiptDateTimeRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship dateTimeReceivedEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    dateTimeReceivedEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation dateTimeReceivedObservation = objectFactory
        .createPOCDMT000040Observation();
    dateTimeReceivedObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    dateTimeReceivedObservation.setClassCode(ActClassObservation.OBS);
    dateTimeReceivedObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    dateTimeReceivedObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.DATETIME_RECEIVED));
    dateTimeReceivedObservation.getValue().add(CDATypeUtil.getTS(
        testSpecimenDetail.getHandlingAndProcessing().getReceiptDateTime().getDateTime()));
    dateTimeReceivedEntryRelationship.setObservation(dateTimeReceivedObservation);
    return dateTimeReceivedEntryRelationship;
  }

  private POCDMT000040EntryRelationship getCollectionSettingRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship collectionSettingsEntryRelationship =
        objectFactory.createPOCDMT000040EntryRelationship();
    collectionSettingsEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation collectionSettingsObservation = objectFactory
        .createPOCDMT000040Observation();
    collectionSettingsObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    collectionSettingsObservation.setClassCode(ActClassObservation.OBS);
    collectionSettingsObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    collectionSettingsObservation
        .setCode(codeMap.get(ClinicalDocumentCodes.COLLECTION_SETTINGS));
    collectionSettingsObservation.getValue().add(CDATypeUtil.getST(
        testSpecimenDetail.getHandlingAndProcessing().getCollectionSetting()));
    collectionSettingsEntryRelationship.setObservation(collectionSettingsObservation);
    return collectionSettingsEntryRelationship;
  }

  private POCDMT000040EntryRelationship getAnatomicalLocImageEntryRelationship(
      AttachedMedia anatomicalLocationImage,
      XActRelationshipEntryRelationship xActRelationshipEntryRelationship) {
    POCDMT000040EntryRelationship anatomicalLocImgEntryRel = objectFactory
        .createPOCDMT000040EntryRelationship();
    anatomicalLocImgEntryRel.setTypeCode(xActRelationshipEntryRelationship);
    POCDMT000040ObservationMedia anatomicalLocImgObsMedia = objectFactory
        .createPOCDMT000040ObservationMedia();
    anatomicalLocImgObsMedia.setIDAttribute(CDATypeUtil.getUUID());
    anatomicalLocImgObsMedia.setClassCode(ActClassObservation.OBS);
    anatomicalLocImgObsMedia.setMoodCode(ActMood.EVN);
    anatomicalLocImgObsMedia.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    anatomicalLocationImage.setObservationMediaReference(anatomicalLocImgObsMedia);
    anatomicalLocImgObsMedia.setValue(getEDFromAttachedMedia(anatomicalLocationImage));
    anatomicalLocImgEntryRel.setObservationMedia(anatomicalLocImgObsMedia);
    return anatomicalLocImgEntryRel;
  }

  private CD getTargetSiteCode(AnatomicalSite anatomicalSite) {
    CD targetSiteCode = objectFactory.createCD();
    if (null != anatomicalSite.getSpecificLocation()) {
      // Target Site Code as Spec Loc
      CR targetSiteCodeQualifier = objectFactory.createCR();
      targetSiteCodeQualifier.setName((CV) codeMap.get(ClinicalDocumentCodes.LATERALITY));
      targetSiteCodeQualifier.setValue(
          Converter.convertToCVCode(anatomicalSite.getSpecificLocation().getSide()));
      targetSiteCode.getQualifier().add(targetSiteCodeQualifier);
    }
    targetSiteCode.setOriginalText(CDATypeUtil.getED(anatomicalSite.getAnatomicalLocationDesc()));
    return targetSiteCode;
  }

  private POCDMT000040EntryRelationship getDiagnosticServiceEntryRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship diagnosticServiceEntryRel = objectFactory
        .createPOCDMT000040EntryRelationship();
    diagnosticServiceEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation diagnosticServiceEntryObs = objectFactory
        .createPOCDMT000040Observation();
    diagnosticServiceEntryObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    diagnosticServiceEntryObs.setClassCode(ActClassObservation.OBS);
    diagnosticServiceEntryObs.setMoodCode(XActMoodDocumentObservation.EVN);
    diagnosticServiceEntryObs.setCode(codeMap.get(ClinicalDocumentCodes.PATHOLOGY_SERVICE));
    diagnosticServiceEntryObs.getValue().add(Converter.convertToCDCode(new CodeImpl(
        pathologyTestResult.getDiagnosticService().getCode(),
        pathologyTestResult.getDiagnosticService().getCodeSystem(),
        pathologyTestResult.getDiagnosticService().getCodeSystemName(),
        pathologyTestResult.getDiagnosticService().getName())));
    diagnosticServiceEntryRel.setObservation(diagnosticServiceEntryObs);
    return diagnosticServiceEntryRel;
  }

  private void processAnatomicalSite(POCDMT000040Observation observation,
      AnatomicalSite anatomicalSite,
      XActRelationshipEntryRelationship xActRelationshipEntryRelationship) {
    observation.getTargetSiteCode().add(getTargetSiteCode(anatomicalSite));
    if (null != anatomicalSite.getAnatomicalLocationImages()
        && !anatomicalSite.getAnatomicalLocationImages().isEmpty()) {
      anatomicalSite.getAnatomicalLocationImages().stream().filter(Objects::nonNull)
          .forEach(anatomicalLocationImage ->
              observation.getEntryRelationship().add(getAnatomicalLocImageEntryRelationship(
                  anatomicalLocationImage, xActRelationshipEntryRelationship)));
    }
  }
}
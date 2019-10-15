package au.gov.nehta.builder.psml;

import static au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent.getEDFromAttachedMedia;
import static au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent.getEmploymentDetails;

import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.components.DocumentAuthorComponent;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.cda.psml.PharmacistSharedMedicinesListCDAModel;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.clinical.psml.PharmacistSharedMedicinesList;
import au.gov.nehta.model.clinical.psml.Section;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.II;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssociatedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EncompassingEncounter;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040OrganizationPartOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.cda._2_0.RoleClassAssociative;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocRenderMultiMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.ci.cda.extensions._3.PersonalRelationship;
import java.util.Objects;
import java.util.UUID;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.w3c.dom.Document;

public class PharmacistSharedMedicinesListCreator extends ClinicalDocumentCreator {

  private static ObjectFactory objectFactory = new ObjectFactory();

  private PharmacistSharedMedicinesListCDAModel cdaModel;
  private PharmacistSharedMedicinesList clinicalModel;
  private static au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory objectFactoryExt = new au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory();
  private POCDMT000040ClinicalDocument clinicalDocument;

  /**
   * add the NeHTA Generic Stylesheet as an xml processing instruction
   */
  public void addStyleSheet(Document doc) {
    addStylesheet("DH_Generic_CDA_Stylesheet-1.6.0.xsl", doc);
  }

  public PharmacistSharedMedicinesListCreator(PharmacistSharedMedicinesListCDAModel cdaModel,
      PharmacistSharedMedicinesList clinicalModel) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;

    // for schematron checking
    //this.resource = SchematronResources.PATHOLOGY_REPORT_3B.resource();
  }

  public Document create()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    clinicalDocument = getClinicalDocumentWithHeaders(
    );

    // Encompassing Encounter
    clinicalDocument.setComponentOf(getEncompassingEncounter());
    //Encompassing Encounter > Facility
    if (null != clinicalModel.getContext().getFacility()) {
      clinicalDocument.getComponentOf().getEncompassingEncounter().setLocation(
          HeaderUtil.getEncompassingEncounterFacility(clinicalModel.getContext().getFacility()));
    }

    //Document Author
    clinicalDocument.getAuthor().add(new DocumentAuthorComponent().getAuthor(clinicalModel
        .getContext().getDocumentAuthor(), cdaModel.getLegalAuthenticator()));

    //Information Recipient List (0..*)
    cdaModel.getInformationRecipients().stream().filter(Objects::nonNull)
        .forEach(informationRecipient -> clinicalDocument.getInformationRecipient()
            .add(HeaderUtil.createInformationRecipient(informationRecipient))
        );

    // Construct Legal Authenticator
    if (cdaModel.getLegalAuthenticator() != null) {
      clinicalDocument.setLegalAuthenticator(
          HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
    }

    // Construct Participant
    if (cdaModel.getParticipant() != null) {
      clinicalDocument.getParticipant()
          .add(createParticipant(cdaModel.getParticipant()));
    }

    // Construct Custodian
    if (cdaModel.getCustodian() != null) {
      clinicalDocument.setCustodian(
          HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
              .getRepresentedCustodianOrganization()));
    } else {
      throw new RuntimeException(
          "Missing mandatory detail: Pharmacist Shared Medicines List > Custodian");
    }
    // Construct Subject of Care (Record Target)

    if (null != clinicalModel.getContext().getSubjectOfCare()) {
      clinicalDocument.getRecordTarget().add(HeaderUtil.createRecordTarget(
          clinicalModel.getContext().getSubjectOfCare()));
    } else {
      throw new RuntimeException(
          "Missing mandatory detail: Pharmacist Shared Medicines List > Subject of care");
    }

    clinicalDocument.setComponent(getCDABody());
    Document doc = getDocumentFilteredOfNull(
        CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument));
    // If strict checking is enabled, check this document.
    if (isStrict()) {
      check(doc);
    }
    return doc;
  }

  private POCDMT000040Component2 getCDABody() {
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
    structuredBody.getComponent().add(getPSMLSection());
    component.setStructuredBody(structuredBody);
    return component;
  }

  private POCDMT000040Component3 getPSMLSection() {
    POCDMT000040Component3 psmlComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section psmlSection = objectFactory.createPOCDMT000040Section();
    psmlSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    psmlSection.setCode(SectionEntryCodeSet.PHARMACIST_SHARED_MEDICINES_LIST);
    psmlSection.setTitle(
        CDATypeUtil.getST(SectionEntryCodeSet.PHARMACIST_SHARED_MEDICINES_LIST.getDisplayName()));
    //Get Encapsulated Data entries
    Section sectionObj = clinicalModel.getContent().getSection();
    II templateId = objectFactory.createII();
    templateId.setRoot(sectionObj.getTemplateId().getRoot());
    psmlSection.getTemplateId().add(templateId);
    sectionObj.getEncapsulatedDataItems().stream().filter(Objects::nonNull).forEach(item ->
        psmlSection.getEntry().add(getEncapsulatedDataEntry(item)));
    psmlSection.setText(getSectionNarrative());
    psmlComponent.setSection(psmlSection);
    return psmlComponent;
  }

  private StrucDocText getSectionNarrative() {
    StrucDocText narrative = objectFactory.createStrucDocText();
    clinicalModel.getContent().getSection().getEncapsulatedDataItems().stream()
        .filter(Objects::nonNull).forEach(attachedMedia -> {
      if (null != attachedMedia.getFileName()) {
        narrative.getContent().add(
            getMultimediaFromAttachedMedia(attachedMedia));
      }
      //TODO Martin Attached Media Narrative
    });
    return narrative;
  }

  private POCDMT000040Entry getEncapsulatedDataEntry(AttachedMedia item) {
    POCDMT000040Entry encapsulatedDataEntry = objectFactory.createPOCDMT000040Entry();
    II templateId = objectFactory.createII();
    templateId.setRoot(item.getTemplateId().getRoot());
    encapsulatedDataEntry.getTemplateId().add(templateId);
    POCDMT000040ObservationMedia edObservationMedia =
        objectFactory.createPOCDMT000040ObservationMedia();
    edObservationMedia.setClassCode(ActClassObservation.OBS);
    edObservationMedia.setMoodCode(ActMood.EVN);
    edObservationMedia.setIDAttribute(CDATypeUtil.getUUID());
    /*edObservationMedia.getId()
        .add(CDATypeUtil.getII(UUID.randomUUID().toString()));*/
    edObservationMedia.setValue(getEDFromAttachedMedia(item));
    item.setObservationMediaReference(edObservationMedia);
    encapsulatedDataEntry.setObservationMedia(edObservationMedia);
    return encapsulatedDataEntry;
  }

  private POCDMT000040Component1 getEncompassingEncounter() {
    POCDMT000040Component1 componentOf = objectFactory.createPOCDMT000040Component1();
    POCDMT000040EncompassingEncounter encompassingEncounter =
        objectFactory.createPOCDMT000040EncompassingEncounter();
    encompassingEncounter.setEffectiveTime(Converter
        .convert(clinicalModel.getContext().getFacility().getParticipationPeriod()));
    componentOf.setEncompassingEncounter(encompassingEncounter);
    return componentOf;
  }

  private POCDMT000040ClinicalDocument getClinicalDocumentWithHeaders() {
    // Construct clinical document with headers
    POCDMT000040ClinicalDocument clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    clinicalDocument.setCode(SectionEntryCodeSet.PHARMACIST_SHARED_MEDICINES_LIST);
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDocument().getCompletionCode()));
    return clinicalDocument;
  }

  private static JAXBElement<StrucDocRenderMultiMedia> getMultimediaFromAttachedMedia(
      AttachedMedia attachedMedia) {
    StrucDocRenderMultiMedia multiMedia = objectFactory.createStrucDocRenderMultiMedia();
    StrucDocCaption caption = objectFactory.createStrucDocCaption();
    caption.getContent()
        .add(String.format("%s", null != attachedMedia && null != attachedMedia.getFileName()
            ? attachedMedia.getFileName() : ""));
    multiMedia.setCaption(caption);
    /* multiMedia.setID(attachedMedia.getObservationMediaReference().getIDAttribute());*/
    if (null != attachedMedia) {
      multiMedia.getReferencedObject().add(attachedMedia.getObservationMediaReference());
    }
    return objectFactory.createStrucDocTextRenderMultiMedia(multiMedia);
  }

  private POCDMT000040Participant1 createParticipant(
      ParticipationServiceProvider patientNominatedContact) {
    POCDMT000040Participant1 participant = objectFactory.createPOCDMT000040Participant1();
    //Location of participation is currently not mapped (under "Known issues" in spec)
    participant.setTypeCode(ParticipationType.PART);
    ServiceProvider nominatedServiceProvider = patientNominatedContact.getParticipant();
    POCDMT000040AssociatedEntity associatedEntity = getAssociatedEntityForParticipantServiceProvider(
        patientNominatedContact);
    if (null != nominatedServiceProvider.getHealthCareProvider()) {
      POCDMT000040Person nominatedPerson = objectFactory.createPOCDMT000040Person();
      associatedEntity.setAssociatedPerson(nominatedPerson);
      handleAsPersonOrHealthcareProvider(patientNominatedContact, nominatedPerson,
          associatedEntity);
    } else {//Organization
      handleAsOrganization(nominatedServiceProvider, associatedEntity);
    }
    participant.setAssociatedEntity(associatedEntity);
    return participant;
  }

  private POCDMT000040AssociatedEntity getAssociatedEntityForParticipantServiceProvider(
      ParticipationServiceProvider patientNominatedContact) {
    ServiceProvider nominatedServiceProvider = patientNominatedContact.getParticipant();
    POCDMT000040AssociatedEntity associatedEntity = objectFactory
        .createPOCDMT000040AssociatedEntity();
    associatedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    associatedEntity.setClassCode(RoleClassAssociative.PROV);
    associatedEntity.setCode(Converter.convertToCECode(patientNominatedContact.getRole()));
    if (null != nominatedServiceProvider.getAddresses()) {
      associatedEntity.getAddr().addAll(AddressConverter
          .convertAustralianAddress(nominatedServiceProvider.getAddresses()));
    }
    if (null != nominatedServiceProvider.getElectronicCommunicationDetails()) {
      associatedEntity.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
          nominatedServiceProvider.getElectronicCommunicationDetails()));
    }
    return associatedEntity;
  }

  private void handleAsPersonOrHealthcareProvider(
      ParticipationServiceProvider participationServiceProvider,
      POCDMT000040Person associatedPerson, POCDMT000040AssociatedEntity associatedEntity) {
    ServiceProvider serviceProvider = participationServiceProvider.getParticipant();
    PersonHealthcareProvider healthcareProvider = serviceProvider.getHealthCareProvider();
    if (null != healthcareProvider.getPersonNames()
        && !healthcareProvider.getPersonNames().isEmpty()) {
      healthcareProvider.getPersonNames().stream().filter(Objects::nonNull).forEach(
          personName -> associatedPerson.getName().add(Converter.getPersonName(personName)));
    } else {
      throw new RuntimeException(
          "Missing attribute: Nominated Contact > Participant > Associated Person > Person Name");
    }
    if (null != serviceProvider.getAddresses() && !serviceProvider.getAddresses().isEmpty()) {
      associatedEntity.getAddr()
          .addAll(AddressConverter.convertAustralianAddress(serviceProvider.getAddresses()));
    }
    if (null != serviceProvider.getElectronicCommunicationDetails()
        && !serviceProvider.getElectronicCommunicationDetails().isEmpty()) {
      associatedEntity.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
          serviceProvider.getElectronicCommunicationDetails()));
    }
    if (null != healthcareProvider.getEmploymentOrganisation()) {
      if (null != healthcareProvider.getEmploymentOrganisation().getEmploymentType()) {
        associatedPerson
            .setAsEmployment(getEmploymentDetails(participationServiceProvider.getParticipant()));
      }
    }
    processRelationshipToSubjectOfCare(associatedPerson, healthcareProvider);
  }

  private void processRelationshipToSubjectOfCare(POCDMT000040Person nominatedPerson,
      PersonHealthcareProvider healthcareProvider) {
    //Applicable to Primary Caregiver
    if (null != healthcareProvider.getRelationshipToSubjectOfCare()) {
      PersonalRelationship relationshipToSubjectOfCareCDA = objectFactoryExt
          .createPersonalRelationship();
      relationshipToSubjectOfCareCDA.setClassCode(RoleClass.PRS);
      relationshipToSubjectOfCareCDA.setCode(Converter.convertToCDCode(new CodeImpl() {{
        setCode(healthcareProvider.getRelationshipToSubjectOfCare().getCode());
        setDisplayName(healthcareProvider.getRelationshipToSubjectOfCare().getName());
      }}));
      relationshipToSubjectOfCareCDA
          .setId(clinicalDocument.getRecordTarget().get(0).getPatientRole().getId().get(0));
      nominatedPerson.getPersonalRelationship().add(relationshipToSubjectOfCareCDA);
    }
  }

  private void handleAsOrganization(ServiceProvider serviceProvider,
      POCDMT000040AssociatedEntity associatedEntity) {
    if (null == serviceProvider.getOrganisation()) {
      throw new RuntimeException("Data does not exist for nominated contact > organization");
    }
    POCDMT000040Organization scopingOrg = objectFactory.createPOCDMT000040Organization();
    POCDMT000040OrganizationPartOf organizationPartOf = objectFactory
        .createPOCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganization = objectFactory.createPOCDMT000040Organization();
    if (null != serviceProvider.getEntityIdentifiers()
        && !serviceProvider.getEntityIdentifiers().isEmpty()) {
      wholeOrganization.getAsEntityIdentifier().addAll(
          Converter.convertEntityIdentifiers(serviceProvider.getEntityIdentifiers()));
    }
    if (null != serviceProvider.getOrganisation().getDepartmentUnit()) {
      scopingOrg.getName().add(Converter.getOrganizationNameAndUse(
          serviceProvider.getOrganisation().getDepartmentUnit()));
    }
    if (null != serviceProvider.getOrganisation().getOrganisationName()) {
      wholeOrganization.getName()
          .add(Converter.getOrganizationNameAndUse(serviceProvider.getOrganisation()));
    }
    organizationPartOf.setWholeOrganization(wholeOrganization);
    scopingOrg.setAsOrganizationPartOf(organizationPartOf);
    associatedEntity.setScopingOrganization(scopingOrg);
  }

}

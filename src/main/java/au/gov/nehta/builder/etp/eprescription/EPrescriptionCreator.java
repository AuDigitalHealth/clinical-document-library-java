package au.gov.nehta.builder.etp.eprescription;

import au.gov.nehta.builder.common.*;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.common.prescription.Observations;
import au.gov.nehta.model.cda.etp.EPrescriptionCdaModel;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescription;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionNoteDetail;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.*;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.util.List;

public class EPrescriptionCreator extends ClinicalDocumentCreator {
    // Constants
    private static final String PRESCRIPTION_ITEM_SECTION_TITLE = "Prescription Item";
    private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";
    private static final String OBSERVATIONS_SECTION_TITLE = "Observations";

    private EPrescriptionCdaModel cdaModel;
    private EPrescription clinicalModel;

    public EPrescriptionCreator(EPrescriptionCdaModel cdaModel, EPrescription clinicalModel) {
        this.cdaModel = cdaModel;
        this.clinicalModel = clinicalModel;

        this.resource = SchematronResources.E_PRESCRIPTION_3B.resource();
    }

    /**
     * Create the prescription DOM document with a default stylesheet of
     * NEHTA_Generic_CDA_Stylesheet.xsl
     *
     * @return Document prescription DOM document
     * @throws ParserConfigurationException
     * @throws JAXBException
     * @throws SchematronValidationException
     */
    //not yet released
    private Document create() throws ParserConfigurationException, JAXBException, SchematronValidationException {

        return create("NEHTA_Generic_CDA_Stylesheet.xsl");
    }

    //not yet released
    private Document create(String stylesheetName) throws ParserConfigurationException, JAXBException, SchematronValidationException {
        // Construct clinical document with headers
        POCDMT000040ClinicalDocument clinicalDocument = HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument());
        clinicalDocument.setCode(SectionEntryCodeSet.PRESCRIPTION);

        // Construct Legal Authenticator
        clinicalDocument.setLegalAuthenticator(HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));

        // Construct Custodian
        clinicalDocument.setCustodian(HeaderUtil.createCustodian(this.cdaModel.getCustodian().getAssignedCustodian().getRepresentedCustodianOrganization()));

        // Construct Encompassing Encounter (including Prescriber Organisation)
        PrescriberOrganisationParticipant org = this.clinicalModel.getContext().getPrescriberOrganisation().getParticipant();
        clinicalDocument.setComponentOf(HeaderUtil.createEncompassingEncounter(this.clinicalModel.getContext().getPrescriberOrganisation().getRole(),
                ClinicalModelConverter.getPrescriberOrganization(org), org.getHealthCareFacilityID()));

        // Construct Author (Prescriber)
        final POCDMT000040Author clinicalDocumentAuthor = getAuthor();
        clinicalDocument.getAuthor().add(clinicalDocumentAuthor);

        // Construct Record Target
        clinicalDocument.getRecordTarget().add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));

        clinicalDocument.setComponent(getStructuredBody(clinicalDocumentAuthor));
        Document doc = CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument);
        addStylesheet(stylesheetName, doc);

        // If strict checking is enabled, check this document. (Requires Schematron library.)
//        if (isStrict()) {
//            check(doc);
//        }

        return doc;
    }

    private POCDMT000040Author getAuthor() {
        PrescriberParticipation prescriberParticipation = this.clinicalModel.getContext().getPrescriber();
        DefaultParticipant prescriberParticipant = this.clinicalModel.getContext().getPrescriber().getParticipant();
        POCDMT000040Person prescriberParticipantPerson = ClinicalModelConverter.getPrescriberPerson(prescriberParticipant);

        return HeaderUtil.createAuthorWithTime(
                prescriberParticipant.getParticipantID(),
                prescriberParticipation.getRole(),
                prescriberParticipant.getAddresses(),
                prescriberParticipant.getElectronicCommunicationDetail(),
                prescriberParticipantPerson,
                this.cdaModel.getAuthorTime()
        );
    }

    private POCDMT000040Component2 getStructuredBody(POCDMT000040Author clinicalDocumentAuthor) {
        POCDMT000040Component2 structuredBodyComponent = new POCDMT000040Component2();
        POCDMT000040StructuredBody structuredBody = new POCDMT000040StructuredBody();

        // Prescription Item
        structuredBody.getComponent().add(getPrescriptionItemSection(clinicalDocumentAuthor));

        // Administrative Observations
        structuredBody.getComponent().add(getAdministrativeObservationsSection());

        // Observations
        if (clinicalModel.getContent().getObservations() != null
                && (clinicalModel.getContent().getObservations().getBodyWeight() != null || clinicalModel.getContent().getObservations().getBodyHeight() != null)) {

            structuredBody.getComponent().add(getObservationsSection());
        }

        if (clinicalModel.getContent().getLogo() != null) {
            structuredBody.getComponent().add(getLogo());
        }

        structuredBodyComponent.setStructuredBody(structuredBody);


        // logo

        return structuredBodyComponent;
    }


    private POCDMT000040Component3 getPrescriptionItemSection(POCDMT000040Author clinicalDocumentAuthor) {
        POCDMT000040Component3 prescriptionItemSectionComponent = new POCDMT000040Component3();
        POCDMT000040Section prescriptionItemSection = new POCDMT000040Section();

        List<Entitlement> subjectOfCareEntitlement = this.clinicalModel.getContext().getSubjectOfCare().getEntitlements();
        DefaultParticipant participant = this.clinicalModel.getContext().getPrescriber().getParticipant();
        List<Entitlement> prescriberEntitlement = participant.getEntitlement();

        PrescriptionItem prescriptionItem = this.clinicalModel.getContent().getPrescriptionItem();
        PrescriptionNoteDetail prescriptionNoteDetail = this.clinicalModel.getContent().getPrescriptionNoteDetail();

        if (subjectOfCareEntitlement != null) {
            List<Coverage2> subjectOfCareEntitlements = ClinicalModelConverter.getSubjectOfCareEntitlements(this.clinicalModel.getContext().getSubjectOfCare());
            prescriptionItemSection.getCoverage2().addAll(subjectOfCareEntitlements);
        }

        if (prescriberEntitlement != null) {
            List<Coverage2> prescriberEntitlements = ClinicalModelConverter.getParticpantEntitlements(participant.getEntitlement(),
                    participant.getParticipantID());
            prescriptionItemSection.getCoverage2().addAll(prescriberEntitlements);
        }

        POCDMT000040Entry substanceAdministrationEntry = EntryCreator.getSubstanceAdministrationEntry(prescriptionItem);
        //override the status code
        CS statusCode = new CS();
        statusCode.setCode("active");
        substanceAdministrationEntry.getSubstanceAdministration().setStatusCode(statusCode);


        POCDMT000040Entry expiryEntry = EntryCreator.getExpiryEntry(prescriptionItem);

        prescriptionItemSection.getEntry().add(substanceAdministrationEntry);
        prescriptionItemSection.getEntry().add(expiryEntry);

        prescriptionItemSection.getAuthor().add(StructuredBodyUtil.getSectionAuthor(clinicalDocumentAuthor, this.clinicalModel.getContent().getPrescriptionItem().getDateTimePrescriptionWritten()));

        if (clinicalModel.getContent().getPrescriptionNoteDetail() != null) {
            POCDMT000040Entry noteEntry = EntryCreator.getNoteEntry(prescriptionNoteDetail.getNote(), SectionEntryCodeSet.PRESCRIPTION_NOTE_DETAIL);
            prescriptionItemSection.getEntry().add(noteEntry);
        }

        StrucDocText prescriptionItemSectionNarrativeBlock = EPrescriptionCreatorUtil.getPrescriptionItemSectionNarrativeBlock(prescriptionItem, prescriptionNoteDetail,
                subjectOfCareEntitlement, prescriberEntitlement);
        prescriptionItemSection.setText(prescriptionItemSectionNarrativeBlock);

        prescriptionItemSection.setCode(SectionEntryCodeSet.PRESCRIPTION_ITEM);
        prescriptionItemSection.setTitle(CDATypeUtil.getST(PRESCRIPTION_ITEM_SECTION_TITLE));
        prescriptionItemSectionComponent.setSection(prescriptionItemSection);


        // Add section components to Structured Body
        return prescriptionItemSectionComponent;
    }

    private POCDMT000040Component3 getObservationsSection() {
        POCDMT000040Component3 observationsSectionComponent = new POCDMT000040Component3();
        POCDMT000040Section observationsSection = new POCDMT000040Section();

        Observations scsModelObservations = clinicalModel.getContent().getObservations();
        observationsSection.setCode(SectionEntryCodeSet.OBSERVATIONS);
        observationsSection.setTitle(CDATypeUtil.getST(OBSERVATIONS_SECTION_TITLE));

        if (scsModelObservations.getBodyWeight() != null) {
            POCDMT000040Entry bodyWeightEntry = EntryCreator.getWeightEntry(scsModelObservations.getBodyWeight());
            observationsSection.getEntry().add(bodyWeightEntry);
        }

        if (scsModelObservations.getBodyHeight() != null) {
            POCDMT000040Entry bodyHeightEntry = EntryCreator.getHeightEntry(scsModelObservations.getBodyHeight());
            observationsSection.getEntry().add(bodyHeightEntry);
        }

        final StrucDocText observationsSectionNarrativeBlock = EPrescriptionCreatorUtil.getObservationsSectionNarrativeBlock(scsModelObservations);
        observationsSection.setText(observationsSectionNarrativeBlock);
        observationsSectionComponent.setSection(observationsSection);
        return observationsSectionComponent;
    }

    private POCDMT000040Component3 getLogo() {
        POCDMT000040Component3 LogoSectionComponent = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();

        POCDMT000040Entry logoentry = EntryCreator.getLogoEntry(clinicalModel.getContent().getLogo());
        section.getEntry().add(logoentry);
        LogoSectionComponent.setSection(section);

        return LogoSectionComponent;
    }

    private POCDMT000040Component3 getAdministrativeObservationsSection() {
        POCDMT000040Component3 administrativeObservationsSectionComponent = new POCDMT000040Component3();

        SubjectOfCareDemographicData subjectOfCareDemographicData = this.clinicalModel.getContext().getSubjectOfCare().getPerson().getDemographicData();

        POCDMT000040Section administrativeObservationsSection = new POCDMT000040Section();
        administrativeObservationsSection.setCode(SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS);
        administrativeObservationsSection.setTitle(CDATypeUtil.getST(ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE));

        // Administrative Observations entries
        if (subjectOfCareDemographicData != null) {


            Boolean isSubjectOfCareDateOfBirthCalculatedFromAge = subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthIsCalculatedFromAge();
            if (isSubjectOfCareDateOfBirthCalculatedFromAge != null) {
                POCDMT000040Entry calcAgeEntry = EntryCreator.createSubjectOfCareCalcAgeEntry(isSubjectOfCareDateOfBirthCalculatedFromAge);
                administrativeObservationsSection.getEntry().add(calcAgeEntry);
            }

            DateAccuracy subjectOfCareDateOfBirthAccuracyIndicator = subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthAccuracyIndicator();
            if (subjectOfCareDateOfBirthAccuracyIndicator != null) {
                POCDMT000040Entry dateOfBirthAccuracyEntry = EntryCreator.createSubjectOfCareDateOfBirthAccuracyEntry(subjectOfCareDateOfBirthAccuracyIndicator);
                administrativeObservationsSection.getEntry().add(dateOfBirthAccuracyEntry);
            }


            POCDMT000040Entry ageEntry = EntryCreator.createSubjectOfCareAgeEntry(Integer.toString(subjectOfCareDemographicData.getAgeInYears()));
            administrativeObservationsSection.getEntry().add(ageEntry);

            if (subjectOfCareDemographicData.isAgeAccurate() != null) {
                POCDMT000040Entry ageAccuracyEntry = EntryCreator.createSubjectOfCareAgeAccuracyEntry(subjectOfCareDemographicData.isAgeAccurate());
                administrativeObservationsSection.getEntry().add(ageAccuracyEntry);
            }

            Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
            if (subjectOfCareBirthPlurality != null) {
                POCDMT000040Entry birthPluralityEntry = EntryCreator.createSubjectOfCareBirthPluralityEntry(subjectOfCareBirthPlurality);
                administrativeObservationsSection.getEntry().add(birthPluralityEntry);
            }

            // Administrative Observations narrative block
            final StrucDocText administrativeObservationsSectionNarrativeBlock = StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock(subjectOfCareDemographicData);
            administrativeObservationsSection.setText(administrativeObservationsSectionNarrativeBlock);
            administrativeObservationsSectionComponent.setSection(administrativeObservationsSection);

        }


        return administrativeObservationsSectionComponent;
    }
}

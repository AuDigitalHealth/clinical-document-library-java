package au.gov.nehta.builder.npdr.prescriptionrecord;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.StructuredBodyUtil;
import au.gov.nehta.builder.npdr.NPDREntryCreator;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.npdr.PCEHRPrescriptionItem;
import au.gov.nehta.model.cda.npdr.PrescriptionCdaModel;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescription;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionNoteDetail;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.*;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.util.List;

public class PrescriptionCreator extends ClinicalDocumentCreator {

    // Constants
    private static final String PRESCRIPTION_ITEM_SECTION_TITLE = "Prescription Item";
    private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";

    private PrescriptionCdaModel cdaModel;
    private EPrescription clinicalModel;


    public PrescriptionCreator(PrescriptionCdaModel cdaModel, EPrescription clinicalModel) {
        this.cdaModel = cdaModel;
        this.clinicalModel = clinicalModel;
        resource = SchematronResources.PCEHR_PRESCRIPTION_3B.resource();

        if (clinicalModel.getContent().hasObservations()) {
            throw new IllegalArgumentException("PCEHR Prescription must not contain height and weight observation");
        }
    }


    /**
     * add the NeHTA Generic Stylesheet as an xml processing instruction
     */
    public void addStyleSheet(Document doc) {
        addStylesheet("NEHTA_Generic_CDA_Stylesheet.xsl", doc);
    }

    /**
     * Create the Clinical Document
     *
     * @throws ParserConfigurationException
     * @throws JAXBException
     * @throws SchematronValidationException
     */
    public Document create() throws ParserConfigurationException, JAXBException, SchematronValidationException {

        // Construct clinical document with headers
        POCDMT000040ClinicalDocument clinicalDocument = HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument());
        clinicalDocument.setCode(SectionEntryCodeSet.NPDR_PRESCRIPTION_ITEM);

        // Construct Legal Authenticator
        clinicalDocument.setLegalAuthenticator(HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));


        // Construct Related Document
        clinicalDocument.getRelatedDocument().addAll(HeaderUtil.createRelatedDocuments(cdaModel.getRelatedDocuments()));

        // Construct Custodian
        clinicalDocument.setCustodian(HeaderUtil.createCustodian(this.cdaModel.getCustodian().getAssignedCustodian().getRepresentedCustodianOrganization()));

        // Construct Encompassing Encounter (including Prescriber Organisation)
        PrescriberOrganisationParticipant org = this.clinicalModel.getContext().getPrescriberOrganisation().getParticipant();
        clinicalDocument.setComponentOf(HeaderUtil.createEncompassingEncounter(this.clinicalModel.getContext().getPrescriberOrganisation().getRole(),
                ClinicalModelConverter.getPrescriberOrganization(org),
                org.getHealthCareFacilityID()));

        // Construct Author (Prescriber)
        final POCDMT000040Author clinicalDocumentAuthor = getAuthor();
        clinicalDocument.getAuthor().add(clinicalDocumentAuthor);

        // Construct Record Target
        clinicalDocument.getRecordTarget().add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));

        clinicalDocument.setComponent(getStructuredBody(clinicalDocumentAuthor));
        Document doc = CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument);

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

        return HeaderUtil.createAuthorWithCurrentTime(
                prescriberParticipant.getParticipantID(),
                prescriberParticipation.getRole(),
                prescriberParticipant.getAddresses(),
                prescriberParticipant.getElectronicCommunicationDetail(),
                prescriberParticipantPerson
        );
    }

    private POCDMT000040Component2 getStructuredBody(POCDMT000040Author clinicalDocumentAuthor) {
        POCDMT000040Component2 structuredBodyComponent = new POCDMT000040Component2();
        POCDMT000040StructuredBody structuredBody = new POCDMT000040StructuredBody();

        // Prescription Item
        structuredBody.getComponent().add(getPrescriptionItemSection(clinicalDocumentAuthor));

        // Administrative Observations
        structuredBody.getComponent().add(getAdministrativeObservationsSection());


        structuredBodyComponent.setStructuredBody(structuredBody);


        return structuredBodyComponent;
    }


    private POCDMT000040Component3 getPrescriptionItemSection(POCDMT000040Author clinicalDocumentAuthor) {
        POCDMT000040Component3 prescriptionItemSectionComponent = new POCDMT000040Component3();
        POCDMT000040Section prescriptionItemSection = new POCDMT000040Section();

        List<Entitlement> subjectOfCareEntitlement = this.clinicalModel.getContext().getSubjectOfCare().getEntitlements();
        DefaultParticipant participant = this.clinicalModel.getContext().getPrescriber().getParticipant();
        List<Entitlement> prescriberEntitlement = participant.getEntitlement();

        PCEHRPrescriptionItem prescriptionItem = (PCEHRPrescriptionItem) this.clinicalModel.getContent().getPrescriptionItem();
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

        POCDMT000040Entry substanceAdministrationEntry = NPDREntryCreator.getSubstanceAdministrationEntry(prescriptionItem);
        POCDMT000040Entry expiryEntry = NPDREntryCreator.getExpiryEntry(prescriptionItem);

        prescriptionItemSection.getEntry().add(substanceAdministrationEntry);
        prescriptionItemSection.getEntry().add(expiryEntry);


        if (clinicalModel.getContent().getPrescriptionNoteDetail() != null) {
            POCDMT000040Entry noteEntry = NPDREntryCreator.getNoteEntry(prescriptionNoteDetail.getNote(), SectionEntryCodeSet.PRESCRIPTION_NOTE_DETAIL);
            prescriptionItemSection.getEntry().add(noteEntry);
        }

        StrucDocText prescriptionItemSectionNarrativeBlock = PrescriptionCreatorUtil.getPrescriptionItemSectionNarrativeBlock(prescriptionItem, prescriptionNoteDetail,
                subjectOfCareEntitlement, prescriberEntitlement);
        prescriptionItemSection.setText(prescriptionItemSectionNarrativeBlock);

        prescriptionItemSection.setCode(SectionEntryCodeSet.PRESCRIPTION_ITEM);
        prescriptionItemSection.setTitle(CDATypeUtil.getST(PRESCRIPTION_ITEM_SECTION_TITLE));
        prescriptionItemSectionComponent.setSection(prescriptionItemSection);


        // Add section components to Structured Body
        return prescriptionItemSectionComponent;
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
                POCDMT000040Entry calcAgeEntry = NPDREntryCreator.createSubjectOfCareCalcAgeEntry(isSubjectOfCareDateOfBirthCalculatedFromAge);
                administrativeObservationsSection.getEntry().add(calcAgeEntry);
            }

            DateAccuracy subjectOfCareDateOfBirthAccuracyIndicator = subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthAccuracyIndicator();
            if (subjectOfCareDateOfBirthAccuracyIndicator != null) {
                POCDMT000040Entry dateOfBirthAccuracyEntry = NPDREntryCreator.createSubjectOfCareDateOfBirthAccuracyEntry(subjectOfCareDateOfBirthAccuracyIndicator);
                administrativeObservationsSection.getEntry().add(dateOfBirthAccuracyEntry);
            }


            POCDMT000040Entry ageEntry = NPDREntryCreator.createSubjectOfCareAgeEntry(Integer.toString(subjectOfCareDemographicData.getAgeInYears()));
            administrativeObservationsSection.getEntry().add(ageEntry);

            if (subjectOfCareDemographicData.isAgeAccurate() != null) {
                POCDMT000040Entry ageAccuracyEntry = NPDREntryCreator.createSubjectOfCareAgeAccuracyEntry(subjectOfCareDemographicData.isAgeAccurate());
                administrativeObservationsSection.getEntry().add(ageAccuracyEntry);
            }

            Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
            if (subjectOfCareBirthPlurality != null) {
                POCDMT000040Entry birthPluralityEntry = NPDREntryCreator.createSubjectOfCareBirthPluralityEntry(subjectOfCareBirthPlurality);
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

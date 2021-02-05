package au.gov.nehta.builder.diagnostic.image;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.EntryCreator;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.StructuredBodyUtil;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.diagnostic.DiagnosticImagingReportCdaModel;
import au.gov.nehta.model.clinical.common.ExtendedDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageReportContent;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageReportContext;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageResultReport;
import au.gov.nehta.model.clinical.diagnostic.imaging.ImagingExaminationResult;
import au.gov.nehta.model.clinical.diagnostic.pathology.AuthorParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.gov.nehta.model.clinical.etp.common.item.Logo;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassRoot;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipFulfills;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Author;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component5;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040InFulfillmentOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Order;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;

import java.util.List;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

public class DiagnosticImageReportCreator extends ClinicalDocumentCreator {

    private static final String IMAGE_EXAM_RESULT = "Imaging Examination Result";

    private static final String DIAGNOSTIC_IMAGE_TITLE = "Diagnostic Imaging";

    private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";

    private DiagnosticImagingReportCdaModel cdaModel;
    private DiagnosticImageResultReport clinicalModel;

    public DiagnosticImageReportCreator(DiagnosticImagingReportCdaModel cdaModel,
                                        DiagnosticImageResultReport clinicalModel) {
        this.cdaModel = cdaModel;
        this.clinicalModel = clinicalModel;

        // for schematron checking
        this.resource = SchematronResources.DIAGNOSTIC_IMAGE_REPORT_3B.resource();
    }

    /**
     * Add the NeHTA Generic Stylesheet as an xml processing instruction.
     */
    public void addStyleSheet(Document doc) {
        addStylesheet("NEHTA_Generic_CDA_Stylesheet.xsl", doc);
    }

    /**
     * Create the Clinical Document.
     */
    public Document create()
            throws ParserConfigurationException, JAXBException, SchematronValidationException {

        // Construct clinical document with headers
        POCDMT000040ClinicalDocument clinicalDocument = HeaderUtil
                .createClinicalDocument(cdaModel.getBaseClinicalDocument());
        clinicalDocument.setCode(SectionEntryCodeSet.DIAGNOSTIC_IMAGING_REPORT);
        clinicalDocument.setCompletionCode(
                Converter.convertToCECode(cdaModel.getDIClinicalDoucment().getCompletionCode()));

        // Construct Legal Authenticator
        if (cdaModel.getLegalAuthenticator() != null) {
            clinicalDocument.setLegalAuthenticator(
                    HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
        }

        // Construct Custodian
        clinicalDocument.setCustodian(HeaderUtil.createCustodian(
                this.cdaModel.getCustodian().getAssignedCustodian().getRepresentedCustodianOrganization()));

        // Construct the Requester (EntitledParticipant)
        clinicalDocument.getParticipant()
                .add(HeaderUtil.createParticipant(this.clinicalModel.getContext().getRequester()));

        // Construct Author (Prescriber)
        POCDMT000040Author clinicalDocumentAuthor = getDocumentAuthor();
        clinicalDocument.getAuthor().add(clinicalDocumentAuthor);

        // Order details
        clinicalDocument.getInFulfillmentOf().add(getInFulFillment());

        // Construct Record Target
        clinicalDocument.getRecordTarget()
                .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));

        clinicalDocument.setComponent(getStructuredBody());
        Document doc = CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument);

        // If strict checking is enabled, check this document. (Requires Schematron library.)
//        if (isStrict()) {
//            check(doc);
//        }

        return doc;
    }

    private POCDMT000040InFulfillmentOf getInFulFillment() {

        DiagnosticImageReportContext context = this.clinicalModel.getContext();
        if (context == null || context.getOrderDetails() == null) {
            return null;
        }

        POCDMT000040InFulfillmentOf fulfillment = new POCDMT000040InFulfillmentOf();
        fulfillment.setTypeCode(ActRelationshipFulfills.FLFS);
        POCDMT000040Order order = new POCDMT000040Order();

        //order.setCode(Converter.convertToCECode(context.getOrderDetails().getOrder()));
        order.setClassCode(ActClassRoot.ACT);
        order.setMoodCode(ActMood.RQO);
        if (context.getOrderDetails().getId() != null) {
            order.getId().add(Converter.getII(context.getOrderDetails().getId()));
        }

        if (context.getOrderDetails().getAccessionNumber() != null) {
            order.getId().add(Converter.getII(context.getOrderDetails().getAccessionNumber()));
        }

        fulfillment.setOrder(order);

        return fulfillment;
    }

    private POCDMT000040Author getDocumentAuthor() {

        DocumentParticipant authorParticipation = this.clinicalModel.getContext().getAuthor();
        AuthorParticipant authorParticipant = this.clinicalModel.getContext().getAuthor()
                .getParticipant();
        POCDMT000040Author author = null;

        POCDMT000040Person authorParticipantPerson = ClinicalModelConverter
                .getAuthorPerson(authorParticipant);
        author = HeaderUtil.createAuthorWithTime(authorParticipant.getAssignedAuthorId(),
                authorParticipation.getRole(), authorParticipant.getAddresses(),
                authorParticipant.getElectronicCommunicationDetail(), authorParticipantPerson,
                this.cdaModel.getAuthorTime());

        return author;
    }

    private POCDMT000040Author getReportingDiagnostician(DocumentParticipant documentAuthor) {

        POCDMT000040Author author = null;

        if (documentAuthor != null && documentAuthor.getParticipant() != null) {

            POCDMT000040Person authorParticipantPerson = ClinicalModelConverter
                    .getAuthorPerson(documentAuthor.getParticipant());
            author = HeaderUtil
                    .createAuthorWithTime(documentAuthor.getParticipant().getAssignedAuthorId(),
                            documentAuthor.getRole(), documentAuthor.getParticipant().getAddresses(),
                            documentAuthor
                                    .getParticipant().getElectronicCommunicationDetail(), authorParticipantPerson,
                            this.cdaModel.getAuthorTime());

        }
        return author;
    }

    private POCDMT000040Component2 getStructuredBody() {

        POCDMT000040Component2 structuredBodyComponent = new POCDMT000040Component2();

        POCDMT000040StructuredBody structuredBody = new POCDMT000040StructuredBody();

        structuredBody.getComponent().add(getDiagnosticImageSection());

        // Administrative Observations
        structuredBody.getComponent().add(getAdministrativeObservationsSection());

        Logo logo = clinicalModel.getContext().getLogo();
        if (logo != null) {
            structuredBody.getComponent().add(EntryCreator.getLogo(logo));
        }

        structuredBodyComponent.setStructuredBody(structuredBody);
        return structuredBodyComponent;
    }

    private POCDMT000040Component3 getDiagnosticImageSection() {

        POCDMT000040Component3 component = new POCDMT000040Component3();
        component.setTypeCode(ActRelationshipHasComponent.COMP);
        POCDMT000040Section diagnosticImageSection = new POCDMT000040Section();

        AuthorParticipant reportingRadiologist = clinicalModel.getContent().getReportingRadiologist()
                .getParticipant();
        List<Entitlement> reportingRadiologistEnt = reportingRadiologist.getEntitlement();

        if (reportingRadiologistEnt != null) {
            List<Coverage2> reqEntitlements =
                    ClinicalModelConverter.getParticpantEntitlements(
                            reportingRadiologist.getEntitlement(), reportingRadiologist.getAssignedAuthorId());
            diagnosticImageSection.getCoverage2().addAll(reqEntitlements);
        }

        DiagnosticImageReportContent content = this.clinicalModel.getContent();
        List<ImagingExaminationResult> imageResults = content.getImagingExaminationResults();

        for (ImagingExaminationResult result : imageResults) {
            // pathology test result
            POCDMT000040Component5 pathologyTestResult = new POCDMT000040Component5();
            POCDMT000040Section imgSection = new POCDMT000040Section();
            imgSection.setClassCode(ActClass.DOCSECT);
            imgSection.setMoodCode(ActMood.EVN);
            imgSection.setTitle(CDATypeUtil.getST(IMAGE_EXAM_RESULT));

            imgSection.setId(Converter.getII(result.getId()));
            imgSection.setText(
                    DiagnosticImageReportCreatorUtil.getImageExaminationResultNarrativeBlock(result));
            imgSection.setCode(SectionEntryCodeSet.IMAGE_EXAMINATION_RESULT_SECTION);

            // Pathology Test result
            POCDMT000040Entry testResult = EntryCreator.getImagingExamResult(result);
            imgSection.getEntry().add(testResult);

            pathologyTestResult.setSection(imgSection);
            diagnosticImageSection.getComponent().add(pathologyTestResult);
        }

        diagnosticImageSection.setCode(SectionEntryCodeSet.DIAGNOSTIC_IMAGING_SECTION);
        diagnosticImageSection.setTitle(CDATypeUtil.getST(DIAGNOSTIC_IMAGE_TITLE));
        diagnosticImageSection.setText(
                DiagnosticImageReportCreatorUtil.diagnosticImageSection(clinicalModel.getContent()));
        diagnosticImageSection.setClassCode(ActClass.DOCSECT);
        diagnosticImageSection.setMoodCode(ActMood.EVN);

        // Reporting pathologist
        diagnosticImageSection.getAuthor()
                .add(getReportingDiagnostician(content.getReportingRadiologist()));

        diagnosticImageSection.setId(Converter.getII(content.getId()));
        POCDMT000040Entry relatedDocument = EntryCreator
                .getDiagnosticImageDocumentEntry(content.getRelatedDocument());
        diagnosticImageSection.getEntry().add(relatedDocument);

        component.setSection(diagnosticImageSection);

        // Add section components to Structured Body
        return component;
    }

    private POCDMT000040Component3 getAdministrativeObservationsSection() {

        POCDMT000040Component3 administrativeObservationsSectionComponent = new POCDMT000040Component3();

        SubjectOfCareDemographicData subjectOfCareDemographicData = this.clinicalModel.getContext()
                .getSubjectOfCare().getPerson().getDemographicData();

        POCDMT000040Section administrativeObservationsSection = new POCDMT000040Section();
        administrativeObservationsSection.setCode(SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS);
        administrativeObservationsSection
                .setTitle(CDATypeUtil.getST(ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE));

        // Administrative Observations entries
        if (subjectOfCareDemographicData != null) {

            Boolean isSubjectOfCareDateOfBirthCalculatedFromAge = subjectOfCareDemographicData
                    .getDateOfBirthDetail().getDateOfBirthIsCalculatedFromAge();
            if (isSubjectOfCareDateOfBirthCalculatedFromAge != null) {
                POCDMT000040Entry calcAgeEntry = EntryCreator
                        .createSubjectOfCareCalcAgeEntry(isSubjectOfCareDateOfBirthCalculatedFromAge);
                administrativeObservationsSection.getEntry().add(calcAgeEntry);
            }

            DateAccuracy subjectOfCareDateOfBirthAccuracyIndicator = subjectOfCareDemographicData
                    .getDateOfBirthDetail().getDateOfBirthAccuracyIndicator();
            if (subjectOfCareDateOfBirthAccuracyIndicator != null) {
                POCDMT000040Entry dateOfBirthAccuracyEntry = EntryCreator
                        .createSubjectOfCareDateOfBirthAccuracyEntry(subjectOfCareDateOfBirthAccuracyIndicator);
                administrativeObservationsSection.getEntry().add(dateOfBirthAccuracyEntry);
            }

            if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
                ExtendedDemographicData ext = (ExtendedDemographicData) subjectOfCareDemographicData;
                DateOfDeath dateOfDeath = ext.getDateOfDeath();
                if (dateOfDeath != null) {
                    if (dateOfDeath.getDateOfDeathAccuracyIndicator() != null) {
                        POCDMT000040Entry dodAccuracyEntry = EntryCreator
                                .createDeathDateAccuracyEntry(dateOfDeath.getDateOfDeathAccuracyIndicator());
                        administrativeObservationsSection.getEntry().add(dodAccuracyEntry);
                    }

                    if (dateOfDeath.getDeathNotificationSource() != null) {
                        POCDMT000040Entry dodSource = EntryCreator
                                .createDeathSourceCodeEntry(dateOfDeath.getDeathNotificationSource());
                        administrativeObservationsSection.getEntry().add(dodSource);
                    }
                }

                if (ext.getMothersOriginalFamilyName() != null) {
                    POCDMT000040Entry dodSource = EntryCreator
                            .createMothersMaidenNameEntry(ext.getMothersOriginalFamilyName());
                    administrativeObservationsSection.getEntry().add(dodSource);
                }
            }

            POCDMT000040Entry ageEntry = EntryCreator.createSubjectOfCareAgeEntry(
                    Integer.toString(subjectOfCareDemographicData.getAgeInYears()));
            administrativeObservationsSection.getEntry().add(ageEntry);

            if (subjectOfCareDemographicData.isAgeAccurate() != null) {
                POCDMT000040Entry ageAccuracyEntry = EntryCreator
                        .createSubjectOfCareAgeAccuracyEntry(subjectOfCareDemographicData.isAgeAccurate());
                administrativeObservationsSection.getEntry().add(ageAccuracyEntry);
            }

            Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
            if (subjectOfCareBirthPlurality != null) {
                POCDMT000040Entry birthPluralityEntry = EntryCreator
                        .createSubjectOfCareBirthPluralityEntry(subjectOfCareBirthPlurality);
                administrativeObservationsSection.getEntry().add(birthPluralityEntry);
            }

            // Administrative Observations narrative block
            StrucDocText administrativeObservationsSectionNarrativeBlock = null;
            if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
                administrativeObservationsSectionNarrativeBlock = StructuredBodyUtil
                        .getAdministrativeObservationsNarrativeBlock(
                                (ExtendedDemographicData) subjectOfCareDemographicData);
            } else {
                administrativeObservationsSectionNarrativeBlock = StructuredBodyUtil
                        .getAdministrativeObservationsNarrativeBlock(subjectOfCareDemographicData);
            }

            administrativeObservationsSection.setText(administrativeObservationsSectionNarrativeBlock);
            administrativeObservationsSectionComponent.setSection(administrativeObservationsSection);

        }

        SubjectOfCareParticipant subjectOfCare = clinicalModel.getContext().getSubjectOfCare();
        List<Entitlement> subjectOfCareEntitlement = subjectOfCare.getEntitlements();
        if (subjectOfCareEntitlement != null) {
            List<Coverage2> subjectOfCareEntitlements = ClinicalModelConverter
                    .getSubjectOfCareEntitlements(subjectOfCare);
            administrativeObservationsSection.getCoverage2().addAll(subjectOfCareEntitlements);
        }

        return administrativeObservationsSectionComponent;
    }
}

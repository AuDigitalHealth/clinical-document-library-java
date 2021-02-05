package au.gov.nehta.builder.shs;

import au.gov.nehta.builder.common.*;
import au.gov.nehta.builder.util.*;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.shs.SharedHealthSummaryCDAModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;
import au.gov.nehta.model.clinical.common.types.AdverseReaction;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisation;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.shs.MedicalHistory;
import au.gov.nehta.model.clinical.shs.*;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.*;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.time.ZonedDateTime;
import java.util.List;

/**
 * Create a Shared Health Summary CDA Document optionally checking with schematrons if .isStrict()
 * returns true
 */
public class SharedHealthSummaryCreator extends ClinicalDocumentCreator {

    private static final String IMMUNISATIONS = "Immunisations";
    private static final String MEDICAL_HISTORY = "Medical History";
    private static final String MEDICATIONS = "Medications";
    private static final String ADVERSE_REACTIONS = "Adverse Reactions";

    private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";

    private SharedHealthSummaryCDAModel cdaModel;
    private SharedHealthSummary clinicalModel;

    public SharedHealthSummaryCreator(
            SharedHealthSummaryCDAModel cdaModel, SharedHealthSummary clinicalModel) {
        this.cdaModel = cdaModel;
        this.clinicalModel = clinicalModel;

        // for schematron checking
        this.resource = SchematronResources.PATHOLOGY_REPORT_3B.resource();
    }

    /**
     * add the NeHTA Generic Stylesheet as an xml processing instruction
     */
    public void addStyleSheet(Document doc) {
        addStylesheet("NEHTA_Generic_CDA_Stylesheet.xsl", doc);
    }

    /**
     * Create the Clinical Document
     */
    public Document create()
            throws ParserConfigurationException, JAXBException, SchematronValidationException {
        // Construct clinical document with headers
        POCDMT000040ClinicalDocument clinicalDocument =
                HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument());
        clinicalDocument.setCode(SectionEntryCodeSet.SHARED_HEALTH_SUMMARY);
        clinicalDocument.setCompletionCode(
                Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));

        // Construct Legal Authenticator
        if (cdaModel.getLegalAuthenticator() != null) {
            clinicalDocument.setLegalAuthenticator(
                    HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
        }

        // Construct Custodian
        if (cdaModel.getCustodian() != null) {
            clinicalDocument.setCustodian(
                    HeaderUtil.createCustodian(
                            cdaModel
                                    .getCustodian()
                                    .getAssignedCustodian()
                                    .getRepresentedCustodianOrganization()));
        }

        // Construct Author (Prescriber)
        clinicalDocument.getAuthor().add(getDocumentAuthor());

        // Construct Record Target
        clinicalDocument
                .getRecordTarget()
                .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));

        clinicalDocument.setComponent(getCDABody());

        // clinicalDocument.setComponent( getStructuredBody( ) );
        Document doc = CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument);

        // If strict checking is enabled, check this document. (Requires Schematron library.)
//        if (isStrict()) {
//            check(doc);
//        }

        return doc;
    }

    private POCDMT000040Component2 getCDABody() {
        POCDMT000040Component2 com = new POCDMT000040Component2();
        POCDMT000040StructuredBody body = new POCDMT000040StructuredBody();
        body.getComponent().add(getAdverseReactions());
        body.getComponent().add(getMedications());
        body.getComponent().add(getMedicalHistory());
        body.getComponent().add(getImmunisations());
        body.getComponent().add(getAdministrativeObservationsSection());
        com.setStructuredBody(body);

        return com;
    }

    private POCDMT000040Component3 getImmunisations() {
        Immunisations immunisations = clinicalModel.getContent().getImmunisations();
        if (immunisations == null) {
            return null;
        }

        POCDMT000040Component3 comp = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();
        section.setTitle(CDATypeUtil.getST(IMMUNISATIONS));
        section.setCode(Converter.convertToCECode(new NCTISDataComponent("101.16638", IMMUNISATIONS)));
        section.setText(getImmunisationsNarrative());

        if (immunisations.getAdministeredImmunisations() != null) {
            for (Immunisation i : immunisations.getAdministeredImmunisations()) {
                section.getEntry().add(EntryCreator.getImmunisationEntry(i));
            }
        }

        if (immunisations.getExclusionStatement() != null) {
            section
                    .getEntry()
                    .add(EntryCreator.getExclusionStatementEntry("103.16302.120.1.5", immunisations));
        }

        comp.setSection(section);
        return comp;
    }

    private POCDMT000040Component3 getMedicalHistory() {
        MedicalHistory history = clinicalModel.getContent().getMedicalHistory();
        if (history == null) {
            return null;
        }

        POCDMT000040Component3 comp = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();

        section.setCode(
                Converter.convertToCECode(new NCTISDataComponent("101.16117", MEDICAL_HISTORY)));
        section.setTitle(CDATypeUtil.getST(MEDICAL_HISTORY));
        section.setText(getMedicalHistoryNarrative());

        addProblemDiagnosisEntries(section, history.getProblemDiagnosis());
        addProcedureEntries(section, history.getProcedures());
        addOtherHistoryEntries(section, history.getOtherHistoryItems());

        comp.setSection(section);
        return comp;
    }

    private void addOtherHistoryEntries(
            POCDMT000040Section section, List<UncatagorisedMedicalHistoryItem> otherHistoryItems) {
        if (otherHistoryItems == null) {
            return;
        }

        for (UncatagorisedMedicalHistoryItem item : otherHistoryItems) {
            section.getEntry().add(EntryCreator.getOtherMedicalHistoryItemEntry(item));
        }
    }

    private void addProcedureEntries(POCDMT000040Section section, Procedures procedures) {
        if (procedures == null) {
            return;
        }

        if (procedures.getProcedures() != null && procedures.getProcedures().size() > 0) {

            for (Procedure p : procedures.getProcedures()) {
                section.getEntry().add(EntryCreator.getProceduresEntry(p));
            }
        }

        if (procedures.getExclusionStatement() != null) {
            section
                    .getEntry()
                    .add(EntryCreator.getExclusionStatementEntry("103.16302.120.1.4", procedures));
        }
    }

    private void addProblemDiagnosisEntries(
            POCDMT000040Section section, ProblemDiagnoses problemDiagnosis) {
        if (problemDiagnosis == null) {
            return;
        }

        if (problemDiagnosis.getDiagnoses() != null && problemDiagnosis.getDiagnoses().size() > 0) {

            for (ProblemDiagnosis pd : problemDiagnosis.getDiagnoses()) {
                section.getEntry().add(EntryCreator.getProblemDiagnosisEntry(pd));
            }
        }

        if (problemDiagnosis.getExclusionStatement() != null) {
            section
                    .getEntry()
                    .add(EntryCreator.getExclusionStatementEntry("103.16302.120.1.3", problemDiagnosis));
        }
    }

    private POCDMT000040Component3 getAdverseReactions() {
        AdverseReactions adverseReactions = clinicalModel.getContent().getAdverseReactions();
        if (adverseReactions == null) {
            return null;
        }

        POCDMT000040Component3 reactions = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();
        section.setCode(
                Converter.convertToCECode(new NCTISDataComponent("101.20113", ADVERSE_REACTIONS)));
        section.setTitle(CDATypeUtil.getST(ADVERSE_REACTIONS));
        section.setText(getReactionNarrative());
        section.setId(Converter.getII(adverseReactions.getID()));
        reactions.setSection(section);

        if (adverseReactions.getAdverseReactions() != null) {
            for (AdverseReaction ar : adverseReactions.getAdverseReactions()) {
                section.getEntry().add(EntryCreator.getAdverseReactionEntry(ar));
            }
        }

        if (adverseReactions.getExclusionStatement() != null) {
            section
                    .getEntry()
                    .add(EntryCreator.getExclusionStatementEntry("103.16302.120.1.1", adverseReactions));
        }

        return reactions;
    }

    private POCDMT000040Component3 getMedications() {
        Medications meds = clinicalModel.getContent().getMedications();
        if (meds == null) {
            return null;
        }

        POCDMT000040Component3 comp = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();
        section.setCode(
                Converter.convertToCECode(new NCTISDataComponent("101.16146", "Medication Orders")));
        section.setTitle(CDATypeUtil.getST(MEDICATIONS));
        section.setText(getMedicationsNarrative());

        comp.setSection(section);

        if (meds.getKnownMedications() != null) {
            for (KnownMedication m : meds.getKnownMedications()) {
                section.getEntry().add(EntryCreator.getMedicationsEntry(m));
            }
        }

        if (meds.getExclusionStatement() != null) {
            section.getEntry().add(EntryCreator.getExclusionStatementEntry("103.16302.120.1.2", meds));
        }

        return comp;
    }

    private StrucDocText getMedicationsNarrative() {
        return SharedhealthSummaryUtil.getMedicationsNarrativeBlock(
                clinicalModel.getContent().getMedications());
    }

    private StrucDocText getMedicalHistoryNarrative() {
        return SharedhealthSummaryUtil.getMedicalHistoryNarrativeBlock(
                clinicalModel.getContent().getMedicalHistory());
    }

    private StrucDocText getReactionNarrative() {
        return SharedhealthSummaryUtil.getAdverseReactionsNarrativeBlock(
                clinicalModel.getContent().getAdverseReactions());
    }

    private StrucDocText getImmunisationsNarrative() {
        return SharedhealthSummaryUtil.getImmunisationsNarrativeBlock(
                clinicalModel.getContent().getImmunisations());
    }

    private POCDMT000040Author getDocumentAuthor() {
        POCDMT000040Author author = new POCDMT000040Author();

        SharedHealthSummaryAuthor documentAuthor = clinicalModel.getContext().getDocumentAuthor();

        ZonedDateTime authorTime = documentAuthor.getParticipationPeriod();
        if (authorTime == null) {
            authorTime = cdaModel.getLegalAuthenticator().getAuthenticationTime();
        }

        author.setTime(Converter.getTS(authorTime));

        POCDMT000040AssignedAuthor assignedAuthor = new POCDMT000040AssignedAuthor();
        assignedAuthor.getId().add(CDATypeUtil.getII(documentAuthor.getID()));
        assignedAuthor.setCode(Converter.convertToCECode(documentAuthor.getRole()));
        POCDMT000040Person person = new POCDMT000040Person();

        List<AsEntityIdentifier> ids = documentAuthor.getEntityIdentifiers();
        person.getAsEntityIdentifier().addAll(Converter.convertEntityIdentifiers(ids));

        List<AddressContext> addresses = documentAuthor.getAddresses();
        if (addresses != null && addresses.size() > 0) {
            assignedAuthor.getAddr().addAll(AddressConverter.convert(addresses));
        }
        assignedAuthor
                .getTelecom()
                .addAll(Converter.convert(documentAuthor.getElectronicCommunicationDetails()));
        person.getName().addAll(Converter.convertNames(documentAuthor.getPersonNames()));

        ExtendedEmploymentOrganisation employmentDetail = documentAuthor.getEmploymentDetail();
        person.setAsEmployment(
                ClinicalModelConverter.getExtendedEmploymentOrganisation(employmentDetail));

        assignedAuthor.setAssignedPerson(person);
        author.setAssignedAuthor(assignedAuthor);

        return author;
    }

    private POCDMT000040Component3 getAdministrativeObservationsSection() {
        POCDMT000040Component3 administrativeObservationsSectionComponent =
                new POCDMT000040Component3();

        SubjectOfCareDemographicData subjectOfCareDemographicData =
                this.clinicalModel.getContext().getSubjectOfCare().getPerson().getDemographicData();
        SharedHealthSummaryAuthor author = this.clinicalModel.getContext().getDocumentAuthor();
        POCDMT000040Section administrativeObservationsSection = new POCDMT000040Section();
        administrativeObservationsSection.setCode(SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS);
        administrativeObservationsSection.setTitle(
                CDATypeUtil.getST(ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE));

        SubjectOfCareParticipant soc = clinicalModel.getContext().getSubjectOfCare();
        List<Entitlement> subjectOfCareEntitlement = soc.getEntitlements();
        if (subjectOfCareEntitlement != null) {
            List<Coverage2> subjectOfCareEntitlements =
                    ClinicalModelConverter.getSubjectOfCareEntitlements(soc);
            administrativeObservationsSection.getCoverage2().addAll(subjectOfCareEntitlements);
        }

        List<? extends Entitlement> authorEntitlement = author.getEntitlements();
        if (authorEntitlement != null) {
            List<Coverage2> authorEntitlements =
                    ClinicalModelConverter.getParticpantEntitlements(authorEntitlement, author.getID());
            administrativeObservationsSection.getCoverage2().addAll(authorEntitlements);
        }

        // Administrative Observations entries
        if (subjectOfCareDemographicData != null) {

            Boolean isSubjectOfCareDateOfBirthCalculatedFromAge =
                    subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthIsCalculatedFromAge();
            if (isSubjectOfCareDateOfBirthCalculatedFromAge != null) {
                POCDMT000040Entry calcAgeEntry =
                        EntryCreator.createSubjectOfCareCalcAgeEntry(
                                isSubjectOfCareDateOfBirthCalculatedFromAge);
                administrativeObservationsSection.getEntry().add(calcAgeEntry);
            }

            DateAccuracy subjectOfCareDateOfBirthAccuracyIndicator =
                    subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthAccuracyIndicator();
            if (subjectOfCareDateOfBirthAccuracyIndicator != null) {
                POCDMT000040Entry dateOfBirthAccuracyEntry =
                        EntryCreator.createSubjectOfCareDateOfBirthAccuracyEntry(
                                subjectOfCareDateOfBirthAccuracyIndicator);
                administrativeObservationsSection.getEntry().add(dateOfBirthAccuracyEntry);
            }

            if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
                ExtendedDemographicData ext = (ExtendedDemographicData) subjectOfCareDemographicData;
                DateOfDeath dateOfDeath = ext.getDateOfDeath();
                if (dateOfDeath != null) {
                    if (dateOfDeath.getDateOfDeathAccuracyIndicator() != null) {
                        POCDMT000040Entry dodAccuracyEntry =
                                EntryCreator.createDeathDateAccuracyEntry(
                                        dateOfDeath.getDateOfDeathAccuracyIndicator());
                        administrativeObservationsSection.getEntry().add(dodAccuracyEntry);
                    }

                    if (dateOfDeath.getDeathNotificationSource() != null) {
                        POCDMT000040Entry dodSource =
                                EntryCreator.createDeathSourceCodeEntry(dateOfDeath.getDeathNotificationSource());
                        administrativeObservationsSection.getEntry().add(dodSource);
                    }
                }

                if (ext.getMothersOriginalFamilyName() != null) {
                    POCDMT000040Entry dodSource =
                            EntryCreator.createMothersMaidenNameEntry(ext.getMothersOriginalFamilyName());
                    administrativeObservationsSection.getEntry().add(dodSource);
                }
            }

            POCDMT000040Entry ageEntry =
                    EntryCreator.createSubjectOfCareAgeEntry(
                            Integer.toString(subjectOfCareDemographicData.getAgeInYears()));
            administrativeObservationsSection.getEntry().add(ageEntry);

            if (subjectOfCareDemographicData.isAgeAccurate() != null) {
                POCDMT000040Entry ageAccuracyEntry =
                        EntryCreator.createSubjectOfCareAgeAccuracyEntry(
                                subjectOfCareDemographicData.isAgeAccurate());
                administrativeObservationsSection.getEntry().add(ageAccuracyEntry);
            }

            Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
            if (subjectOfCareBirthPlurality != null) {
                POCDMT000040Entry birthPluralityEntry =
                        EntryCreator.createSubjectOfCareBirthPluralityEntry(subjectOfCareBirthPlurality);
                administrativeObservationsSection.getEntry().add(birthPluralityEntry);
            }

            // Administrative Observations narrative block
            StrucDocText administrativeObservationsSectionNarrativeBlock = null;
            if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
                administrativeObservationsSectionNarrativeBlock =
                        StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock(
                                (ExtendedDemographicData) subjectOfCareDemographicData);
            } else {
                administrativeObservationsSectionNarrativeBlock =
                        StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock(
                                subjectOfCareDemographicData);
            }

            administrativeObservationsSection.setText(administrativeObservationsSectionNarrativeBlock);
            administrativeObservationsSectionComponent.setSection(administrativeObservationsSection);
        }

        return administrativeObservationsSectionComponent;
    }
}

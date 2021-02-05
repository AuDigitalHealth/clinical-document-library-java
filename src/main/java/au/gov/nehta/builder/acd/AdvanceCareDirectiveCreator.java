package au.gov.nehta.builder.acd;

import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.components.AdministrativeObservationsComponent;
import au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent;
import au.gov.nehta.builder.common.components.DocumentAuthorComponent;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.cda.acd.AdvanceCareDirectiveCDAModel;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.clinical.acd.AdvanceCareDirective;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.*;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.time.ZonedDateTime;
import java.util.Objects;

import static au.gov.nehta.builder.DocumentCreatorUtil.*;
import static au.gov.nehta.builder.common.Constants.GENERIC_CDA_STYLESHEET;

public class AdvanceCareDirectiveCreator extends ClinicalDocumentCreator {

    private static final CD ACD_CUSTODIAN_ENTRY_CODE = Converter.convertToCDCode(
            new NCTISDataComponent("102.16690", "ACD Custodian Entry"));
    private static final CE ACD_CUSTODIAN_ENTRIES = Converter.convertToCECode(
            new NCTISDataComponent("101.16694", "ACD Custodian Entries"));
    private AdvanceCareDirectiveCDAModel cdaModel;
    private AdvanceCareDirective clinicalModel;
    private static ObjectFactory objectFactory = new ObjectFactory();

    public AdvanceCareDirectiveCreator(AdvanceCareDirectiveCDAModel cdaModel,
                                       AdvanceCareDirective clinicalModel) {

        this.cdaModel = cdaModel;
        this.clinicalModel = clinicalModel;

        // For schematron checking
        //    this.resource = SchematronResources.PATHOLOGY_REPORT_3B.resource();
    }

    /**
     * Add the NeHTA Generic Stylesheet as an xml processing instruction.
     */
    public void addStyleSheet(Document doc) {
        addStylesheet(GENERIC_CDA_STYLESHEET, doc);
    }

    /**
     * Create the Clinical Document
     */
    public Document create()
            throws ParserConfigurationException, JAXBException, SchematronValidationException {

        // Construct clinical document with headers
        POCDMT000040ClinicalDocument clinicalDocument =
                HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), ZonedDateTime.now());
        clinicalDocument.setCode(SectionEntryCodeSet.ADVANCE_CARE_DIRECTIVE);
        clinicalDocument.setCompletionCode(
                Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));
        // Set by caller
        // clinicalDocument.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
        clinicalDocument
                .setConfidentialityCode(CDATypeUtil.getNullCECode());
        // Legal Authenticator
        if (null != cdaModel.getLegalAuthenticator()) {
            clinicalDocument.setLegalAuthenticator(
                    HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
        }

        // Record Target
        clinicalDocument.getRecordTarget()
                .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));
        clinicalDocument.getAuthor().add(new DocumentAuthorComponent().getAuthor(clinicalModel
                .getContext().getDocumentAuthor(), cdaModel.getLegalAuthenticator()));

        // Construct Custodian
        if (cdaModel.getCustodian() != null) {
            clinicalDocument.setCustodian(
                    HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
                            .getRepresentedCustodianOrganization()));
        } else {
            throw new RuntimeException("Missing mandatory detail: AdvanceCareDirective > Custodian");
        }

        clinicalDocument.setComponent(getCDABody());
        Document doc = getDocumentFilteredOfNull(
                CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument));

        // If strict checking is enabled, check this document. (Requires Schematron library.)
//        if (isStrict()) {
//            check(doc);
//        }
        return doc;
    }

    private POCDMT000040Component2 getCDABody() {

        POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
        POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();

        if (null != clinicalModel.getContent().getACDCustodians()
                && !clinicalModel.getContent().getACDCustodians().isEmpty()) {

            POCDMT000040Component3 custodianComponent = objectFactory.createPOCDMT000040Component3();
            POCDMT000040Section custodianSection = objectFactory.createPOCDMT000040Section();
            custodianSection.setCode(ACD_CUSTODIAN_ENTRIES);
            custodianSection.setTitle(CDATypeUtil.getST(ACD_CUSTODIAN_ENTRIES.getDisplayName()));
            custodianSection.setText(getCustodiansNarrative());
            custodianComponent.setSection(custodianSection);
            structuredBody.getComponent().add(custodianComponent);
            clinicalModel.getContent().getACDCustodians().stream().filter(Objects::nonNull)
                    .forEach(
                            acdCustodian -> custodianSection.getEntry().add(getCustodianEntry(acdCustodian)));
        } else {
            throw new RuntimeException("Missing mandatory content : ACD Custodian Entry");
        }

        structuredBody.getComponent().add(new AdministrativeObservationsComponent()
                .getComponent(clinicalModel.getContext().getSubjectOfCare(),
                        clinicalModel.getContext().getDocumentAuthor()));
        component.setStructuredBody(structuredBody);
        return component;
    }

    private StrucDocText getCustodiansNarrative() {

        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable custodianTable = objectFactory.createStrucDocTable();
        StrucDocTbody custodianTBody = addBody(custodianTable);
        addCaption(custodianTable, "Advance Care Directive Custodians");
        clinicalModel.getContent().getACDCustodians().stream().filter(Objects::nonNull).forEach(
                participationServiceProvider -> {
                    add(custodianTBody, getBoldTextTd("Custodian:"));
                    add(custodianTBody, NarrativeUtil
                            .getParticipationServiceProviderTdNarrative(participationServiceProvider));
                });
        addTable(narrative, custodianTable);
        return narrative;
    }

    private POCDMT000040Entry getCustodianEntry(ParticipationServiceProvider acdCustodian) {

        POCDMT000040Entry custodianEntry = objectFactory.createPOCDMT000040Entry();
        custodianEntry.setTypeCode(XActRelationshipEntry.COMP);
        POCDMT000040Act custodianAct = objectFactory.createPOCDMT000040Act();
        custodianAct.setClassCode(XActClassDocumentEntryAct.INFRM);
        custodianAct.setMoodCode(XDocumentActMood.EVN);
        custodianAct.setCode(ACD_CUSTODIAN_ENTRY_CODE);
        custodianAct.getPerformer()
                .add(DiagnosticInvestigationComponent.getServiceProviderPerformer(acdCustodian, false));
        custodianEntry.setAct(custodianAct);
        return custodianEntry;
    }
}

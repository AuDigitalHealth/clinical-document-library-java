package au.gov.nehta.builder.goc;

import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.components.AdministrativeObservationsComponent;
import au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent;
import au.gov.nehta.builder.common.components.DocumentAuthorComponent;
import au.gov.nehta.builder.util.*;
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.cda.acp.AdvanceCarePlanningCDAModel;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.acp.AdvanceCareInformationSection;
import au.gov.nehta.model.clinical.acp.AdvanceCarePlanning;
import au.gov.nehta.model.clinical.acp.RelatedDocument;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.*;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.stream.Collectors;

import static au.gov.nehta.builder.DocumentCreatorUtil.*;
import static au.gov.nehta.builder.common.Constants.GENERIC_CDA_STYLESHEET;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.br;

public class GoalsOfCareCreator extends ClinicalDocumentCreator {

    private static final CE ADVANCE_CARE_INFO_SECTION_CODE = Converter.convertToCECode(
            new NCTISDataComponent("101.16973", "Advance Care Information Section"));
    private static final CD RELATED_DOCUMENT = Converter
            .convertToCDCode(new NCTISDataComponent("102.16971", "Related Document"));
    private static final CD GOALS_OF_CARE_DOC = Converter.convertToCDCode(
            new NCTISDataComponent("100.32016", "Goals of Care Document"));
    private static ObjectFactory objectFactory = new ObjectFactory();
    private final AdvanceCarePlanningCDAModel cdaModel;
    private final AdvanceCarePlanning clinicalModel;

    public GoalsOfCareCreator(AdvanceCarePlanningCDAModel cdaModel,
                              AdvanceCarePlanning clinicalModel) {
        this.cdaModel = cdaModel;
        this.clinicalModel = clinicalModel;
    }

    /**
     * add the NeHTA Generic Stylesheet as an xml processing instruction
     */
    public void addStyleSheet(Document doc) {
        addStylesheet(GENERIC_CDA_STYLESHEET, doc);
    }

    /**
     * Create the Clinical Document
     */
    public Document create()
            throws ParserConfigurationException, JAXBException, SchematronValidationException {
        POCDMT000040ClinicalDocument clinicalDocument =
                HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), ZonedDateTime.now());
        clinicalDocument
                .setTitle(CDATypeUtil.getST(this.clinicalModel.getContext().getDocumentTitle()));
        clinicalDocument.setCode(SectionEntryCodeSet.GOALS_OF_CARE);
        clinicalDocument.setCompletionCode(
                Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));
        //Set by caller
        //clinicalDocument.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
        //Legal Authenticator
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
            throw new RuntimeException("Missing mandatory detail: AdvanceCarePlanning > Custodian");
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
        if (null != this.clinicalModel.getContent().getAdvanceCareInformationSection()) {
            POCDMT000040Component3 advanceCareInfoComp = objectFactory.createPOCDMT000040Component3();
            POCDMT000040Section advanceCareInfoSection = objectFactory.createPOCDMT000040Section();
            advanceCareInfoSection.setTitle(CDATypeUtil.getST("Goals of Care Section"));
            advanceCareInfoSection.setText(getGoalOfCareNarrative());
            advanceCareInfoSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
            advanceCareInfoSection.setCode(ADVANCE_CARE_INFO_SECTION_CODE);
            if (null != this.clinicalModel.getContent().getAdvanceCareInformationSection()
                    .getRelatedDocument()) {
                RelatedDocument relatedDocument = this.clinicalModel.getContent()
                        .getAdvanceCareInformationSection().getRelatedDocument();
                POCDMT000040Entry relatedDocEntry = objectFactory.createPOCDMT000040Entry();
                POCDMT000040Act relatedDocAct = objectFactory.createPOCDMT000040Act();
                relatedDocAct.setClassCode(XActClassDocumentEntryAct.ACT);
                relatedDocAct.setMoodCode(XDocumentActMood.EVN);
                relatedDocAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
                relatedDocAct.setCode(RELATED_DOCUMENT);
                POCDMT000040Reference linkNatureRef = objectFactory.createPOCDMT000040Reference();
                linkNatureRef.setTypeCode(XActRelationshipExternalReference.REFR);
                BL separableInd = objectFactory.createBL();
                separableInd.setValue(true);
                linkNatureRef.setSeperatableInd(separableInd);
                if (null != relatedDocument.getDocumentTarget()) {
                    POCDMT000040ExternalDocument externalDocument = objectFactory
                            .createPOCDMT000040ExternalDocument();
                    externalDocument.setClassCode(ActClassDocument.DOC);
                    externalDocument.setMoodCode(ActMood.EVN);
                    externalDocument.setText(DiagnosticInvestigationComponent
                            .getEDFromAttachedMedia(relatedDocument.getDocumentTarget()));
                    linkNatureRef.setExternalDocument(externalDocument);
                    if (null != relatedDocument.getDocumentDetails()) {
                        externalDocument.setCode(GOALS_OF_CARE_DOC);
                        if (null != relatedDocument.getDocumentDetails().getDocumentAuthor()) {
                            relatedDocAct.getAuthor()
                                    .add(getDocumentAuthor(relatedDocument.getDocumentDetails().getDocumentAuthor()));
                        } else {
                            throw new RuntimeException(
                                    "Mandatory content missing :  AdvanceCarePlanning > Advance Care Info Section >"
                                            + " Related Document > Document Details > Document Author");
                        }
                    } else {
                        throw new RuntimeException(
                                "Mandatory content missing :  AdvanceCarePlanning > Advance Care Info Section > "
                                        + "Related Document > Document Details");
                    }
                } else {
                    throw new RuntimeException(
                            "Mandatory content missing :  AdvanceCarePlanning > Advance Care Info Section > "
                                    + "Related Document > Document Target");
                }
                relatedDocAct.getReference().add(linkNatureRef);
                relatedDocEntry.setAct(relatedDocAct);
                advanceCareInfoSection.getEntry().add(relatedDocEntry);
            } else {
                throw new RuntimeException(
                        "Mandatory content missing :  AdvanceCarePlanning > Advance Care Info Section > "
                                + "Related Document");
            }
            advanceCareInfoComp.setSection(advanceCareInfoSection);
            structuredBody.getComponent().add(advanceCareInfoComp);
        } else {
            throw new RuntimeException(
                    "Mandatory content missing : AdvanceCarePlanning > Advance Care Info Section");
        }
        structuredBody.getComponent().add(new AdministrativeObservationsComponent()
                .getComponent(clinicalModel.getContext().getSubjectOfCare(),
                        clinicalModel.getContext().getDocumentAuthor()));
        component.setStructuredBody(structuredBody);
        return component;
    }

    private POCDMT000040Author getDocumentAuthor(DocumentAuthor documentAuthor) {
        POCDMT000040Author author = objectFactory.createPOCDMT000040Author();
        POCDMT000040AssignedAuthor assignedAuthor = objectFactory.createPOCDMT000040AssignedAuthor();
        assignedAuthor.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        author.setTime(Converter.convert(documentAuthor.getParticipationPeriod()));
        assignedAuthor.setCode(Converter.convertToCECode(documentAuthor.getRole()));
        POCDMT000040Person participant = objectFactory.createPOCDMT000040Person();
        if (null != documentAuthor.getEntityIdentifiers()) {
            participant.getAsEntityIdentifier()
                    .addAll(Converter.convertEntityIdentifiers(documentAuthor.getEntityIdentifiers()));
        }
        if (null != documentAuthor.getAddresses()) {
            assignedAuthor.getAddr().addAll(AddressConverter.convert(documentAuthor.getAddresses()));
        }
        if (null != documentAuthor.getElectronicCommunicationDetails()) {
            assignedAuthor.getTelecom().addAll(
                    Converter.convert(documentAuthor.getElectronicCommunicationDetails().stream().filter(
                            Objects::nonNull).collect(Collectors.toList())));
        } else {
            throw new RuntimeException(
                    "Mandatory content missing :  AdvanceCarePlanning > Advance Care Info Section >"
                            + " Related Document > Document Details > Document Author > Electronic "
                            + "Communication Detail");
        }
        if (null != documentAuthor.getPersonNames()) {
            participant.getName().addAll(Converter.convertNames(documentAuthor.getPersonNames()));
        } else {
            throw new RuntimeException(
                    "Mandatory content missing :  AdvanceCarePlanning > Advance Care Info Section >"
                            + " Related Document > Document Details > Document Author > Person Name(s)");
        }
        assignedAuthor.setAssignedPerson(participant);
        author.setAssignedAuthor(assignedAuthor);
        return author;
    }


    private static StrucDocTable getRelatedDocument(RelatedDocument relatedDocument) {
        StrucDocTable relatedDocsTable = objectFactory.createStrucDocTable();
        StrucDocTbody relatedDocsTBody = addBody(relatedDocsTable);
        addCaption(relatedDocsTable, "Related Documents");
        addHeader(relatedDocsTable, "Type", "File Name", "Media Type");

        StrucDocTd docTargetTd = objectFactory.createStrucDocTd();
        //creating content > linkHtml
        docTargetTd.getContent().add(link(relatedDocument.getDocumentTarget().getFileName(),
                relatedDocument.getDocumentDetails().getDocumentTitle(),
                relatedDocument.getDocumentDetails().getDocumentIdentifier().getRoot()));
        StrucDocTd docTypeTd = objectFactory.createStrucDocTd();
        docTypeTd.getContent()
                .add(safe(print(relatedDocument.getDocumentDetails().getDocumentType())));
        StrucDocTd mediaTypeTd = objectFactory.createStrucDocTd();
        mediaTypeTd.getContent().add(safe(relatedDocument.getDocumentTarget().getMediaType()));
        add(relatedDocsTBody, docTypeTd, docTargetTd, mediaTypeTd);
        return relatedDocsTable;
    }


    private String getEntityIdentifiers(DocumentAuthor documentAuthor) {
        return documentAuthor.getEntityIdentifiers().stream().filter(Objects::nonNull)
                .map(asEntityIdentifier ->
                        String.format(
                                "Auth Name: %s, Geographic Area Name: %s, Geographic Area: %s, "
                                        + "Geographic Area Class Code: %s",
                                asEntityIdentifier.getAssigningAuthorityName(),
                                null != asEntityIdentifier.getAssigningGeographicAreaName() ?
                                        asEntityIdentifier.getAssigningGeographicAreaName() : "N/A",
                                null != asEntityIdentifier.getAssigningGeographicArea() ?
                                        asEntityIdentifier.getAssigningGeographicArea() : "N/A",
                                null != asEntityIdentifier.getAssigningGeographicAreaClassCode())
                ).collect(Collectors.joining());
    }

    private String getPersonNames(DocumentAuthor documentAuthor) {
        return documentAuthor.getPersonNames().stream().filter(Objects::nonNull).map(personName ->
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

    private static StrucDocTd getElectronicCommunicationDetailTd(
            List<Telecom> electronicCommunicationDetail) {
        StrucDocTd result = objectFactory.createStrucDocTd();
        electronicCommunicationDetail.stream().filter(Objects::nonNull).forEach(telecom -> {
            String usage = "";
            if (telecom.getTelecomUse() != null) {
                usage = " (" + telecom.getTelecomUse().getDisplayName() + ")";
            }
            result.getContent().add(
                    telecom.getTelecomMedium().getDisplayName() + ":" + telecom.getTelecomValue() + usage);
            br(result);
        });
        return result;
    }

    private StrucDocText getGoalOfCareNarrative() {
        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable infoTable = objectFactory.createStrucDocTable();
        addCaption(infoTable, "Information for reader");
        StrucDocTbody infoBody = objectFactory.createStrucDocTbody();
        add(infoBody, getItalicTextTd("Healthcare providers may have professional state and "
                + "territory-specific legal obligations when reading Goals of Care documents stored on an individual's My Health Record."));
        infoTable.getTbody().add(infoBody);
        addTable(narrative, infoTable);

        AdvanceCareInformationSection advanceCareInformationSection = this.clinicalModel.getContent()
                .getAdvanceCareInformationSection();
        if (null != advanceCareInformationSection.getRelatedDocument()) {
            RelatedDocument relatedDocument = advanceCareInformationSection.getRelatedDocument();
            if (null != relatedDocument.getDocumentDetails()) {
                if (null != relatedDocument.getDocumentDetails().getDocumentAuthor()) {
                    DocumentAuthor documentAuthor = relatedDocument.getDocumentDetails().getDocumentAuthor();
                    StrucDocTable docAuthorTable = objectFactory.createStrucDocTable();
                    StrucDocTbody docAuthorTBody = addBody(docAuthorTable);
                    addCaption(docAuthorTable,
                            "Advance Care Information > Document Details > Document Author");
                    addHeader(docAuthorTable, "Field", "Value");
                    if (null != documentAuthor.getEntityIdentifiers()) {
                        add(docAuthorTBody, getBoldTextTd("Entity Identifier(s)"),
                                getNormalTextTd(getEntityIdentifiers(documentAuthor)));

                    }
                    if (null != documentAuthor.getPersonNames()) {
                        add(docAuthorTBody, getBoldTextTd("Person Name(s)"),
                                getNormalTextTd(getPersonNames(documentAuthor)));

                    }
                    if (null != documentAuthor.getAddresses()) {
                        documentAuthor.getAddresses().stream()
                                .forEach(addressContext -> add(docAuthorTBody, getBoldTextTd("Address(es)"),
                                        NarrativeUtil.getAddressCell(addressContext)));

                    }
                    if (null != documentAuthor.getElectronicCommunicationDetails()) {
                        add(docAuthorTBody, getBoldTextTd("Electronic Communication Details"),
                                getElectronicCommunicationDetailTd(
                                        documentAuthor.getElectronicCommunicationDetails()));
                    }
                    addTable(narrative, getRelatedDocument(relatedDocument));
                    addTable(narrative, docAuthorTable);
                }
            }
        }
        return narrative;
    }
}

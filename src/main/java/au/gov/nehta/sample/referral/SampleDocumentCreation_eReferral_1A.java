package referral;

import au.gov.nehta.builder.ereferral.*;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.diagnostic.pathology.EmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.*;

/**
 * This Sample code shows use of the CDA Library to create an e-Referral document
 * conformant to level 1A.
 */
public class SampleDocumentCreation_eReferral_1A {
    public static void main(String[] args) throws ParserConfigurationException, JAXBException, SchematronValidationException {
        String documentID = UUID.randomUUID().toString();

        // ***************************
        // ***** Subject Of Care *****
        // ***************************

        IHI subjectIHI = new IHI("8003600300001283");

        String subjectFamilyName = "Harding";
        ZonedDateTime dob = LocalDate.of(1982, 11, 28).atStartOfDay(ZoneId.systemDefault());

        AustralianAddress patientAddress = new AustralianAddressImpl();
        patientAddress.addUnstructuredAddressLine("10 browning st");
        patientAddress.setCity("West End");
        patientAddress.setState(AustralianStateTerritory.QUEENSLAND
                .getAbbreviation());
        patientAddress.setPostcode("4101");
        AddressContext subjectOfCareAddress = new AddressContextImpl(patientAddress, AddressPurpose.RESIDENTIAL_PERMANENT);

        PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
        subjectPersonName.addGivenName("Frank");
        subjectPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
        subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
        subjectPersonName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);

        DateAccuracy dobAccuracy = new DateAccuracyImpl(
                /* Day Accuracy*/ true,
                /* Month Accuracy*/ true,
                /* Year Accuracy*/true);

        DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
        subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
        subjectDOB.setDateOfBirthIsCalculatedFromAge(true);

        SubjectOfCareDemographicData demoData = new SubjectOfCareDemographicDataImpl(Sex.MALE, subjectDOB);

        demoData.setBirthPlurality(5);
        demoData.setBirthOrder(2);
        int age = 31;
        demoData.setAgeInYears(age);
        demoData.setAgeAccurate(true);
        demoData.setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

        SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectPersonName, demoData);
        MedicareCardIdentifier medicareCard = new MedicareCardIdentifier("4324567871");
        SubjectOfCareParticipant subject = new SubjectOfCareParticipantImpl(Arrays.asList(subjectIHI, medicareCard), subjectOfCareAddress, subjectOfCarePerson);

        Telecom subjectTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0712345678", TelecomUse.PERSONAL);
        Telecom subjectEmail = new TelecomImpl(TelecomMedium.EMAIL, "frank.harding@electronichealth.net.au", TelecomUse.PERSONAL);

        List<Telecom> subjectOfCareElectronicCommunicationDetails = new ArrayList<>();
        subjectOfCareElectronicCommunicationDetails.add(subjectTelephone);
        subjectOfCareElectronicCommunicationDetails.add(subjectEmail);

        subject.setElectronicCommunicationDetails(subjectOfCareElectronicCommunicationDetails);

        // ************************
        // ******** Author ********
        // ************************
        HPII authorHPII = new HPII("8003610000001145");

        PersonName authorName = new PersonNameImpl("Practitioner");
        authorName.addGivenName("Gerry");
        authorName.addGivenName("Medical");
        authorName.addNameTitle(NameTitle.MISTER.getDescriptor());
        authorName.addNameTitle(NameTitle.PROFESSOR.getDescriptor());
        authorName.addNameSuffix(NameSuffix.MEMBER_OF_PARLIAMENT.getDescriptor());
        authorName.addNameSuffix(NameSuffix.FIRST.getDescriptor());

        ProviderPerson authorPerson = new ProviderPersonImpl(authorName);

        AustralianAddress address = new AustralianAddressImpl();
        address.addUnstructuredAddressLine("Level 1, 10 Browning street");
        address.setCity("West End");
        address.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        address.setPostcode("4101");
        ProviderAddress authorOrganisationAddress = new ProviderAddressImpl(false, address, AddressPurpose.BUSINESS);

        Telecom authorEmail = new TelecomImpl(TelecomMedium.EMAIL, "info@some-gp.com.au", TelecomUse.BUSINESS);
        Telecom authorFax = new TelecomImpl(TelecomMedium.FAX, "0212345678", TelecomUse.BUSINESS);
        Telecom authorTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0212345679", TelecomUse.BUSINESS);

        List<Telecom> electronicCommunicationDetailList = Arrays.asList(authorEmail, authorFax, authorTelephone);

        EmploymentOrganisationImpl gpJob = new EmploymentOrganisationImpl(Collections.singletonList(new HPIO("8003621231167886")), "Sam's Specialist Clinic");
        gpJob.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
        gpJob.setEmploymentType(CodeImpl.fromOriginalText("Permanent/Full Time"));
        gpJob.setDepartmentUnit("Clinic");
        gpJob.setPositionInOrganisation(CodeImpl.fromOriginalText("Staff Doctor"));
        gpJob.setOccupation(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

        ReferralAuthor author = new ReferralAuthorImpl(authorHPII, authorPerson, ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER, gpJob);

        author.setQualifications("M.B.B.S., F.R.A.C.S.");
        author.setAddress(authorOrganisationAddress);
        author.setElectronicCommunicationDetail(electronicCommunicationDetailList);

        // ************************
        // ******  Referee  *******
        // ************************
        // Provider Identifier
        HPII refereeHPII = new HPII("8003610000001145");

        // Provider Organisation Identifier
        HPIO refereeHPIO = new HPIO("8003620000045562");

        // Only surname is mandatory
        PersonName referrerName = new PersonNameImpl("SpecialistSurname");
        referrerName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
        ProviderPerson participantPerson = new ProviderPersonImpl(referrerName);

        ProviderEmploymentDetail employmentDetails = new ProviderEmploymentDetailImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);
        participantPerson.setEmploymentDetail(employmentDetails);

        AustralianAddress refereeAddress = new AustralianAddressImpl();
        refereeAddress.addUnstructuredAddressLine("The Melbourne");
        refereeAddress.addUnstructuredAddressLine("10 Browning St");
        refereeAddress.setCity("West End");
        refereeAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        refereeAddress.setPostcode("4101");
        ProviderAddress refereeProviderAddress = new ProviderAddressImpl(false, refereeAddress, AddressPurpose.BUSINESS);

        Telecom participantFax = new TelecomImpl(TelecomMedium.FAX, "0212345678", TelecomUse.BUSINESS);
        Telecom participantTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0212345678", TelecomUse.BUSINESS);
        List<Telecom> refereeTelecoms = Arrays.asList(participantFax, participantTelephone);

        Organisation refereeOrg = new OrganisationImpl("Sam's Specialist Clinic");
        ReferralParticipant referee = new ReferralParticipantImpl(
                refereeHPII,
                referrerName,
                refereeProviderAddress,
                refereeTelecoms,
                refereeHPIO,
                refereeOrg
        );

        // *********************
        // ***** Custodian *****
        // *********************

        AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");
        Telecom contact = new TelecomImpl(TelecomMedium.EMAIL, "example@custodian.com.au", TelecomUse.BUSINESS);

        AustralianAddress custodianAddress = new AustralianAddressImpl();
        custodianAddress.addUnstructuredAddressLine("99 Clinician Street");
        custodianAddress.setCity("Nehtaville");
        custodianAddress.setState("QLD");
        custodianAddress.setPostcode("5555");
        custodianAddress.setAdditionalLocator("32568931");

        UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl(documentID);
        CustodianOrganization custodianOrganization = CustodianOrganizationImpl.getInstance(Collections.singletonList(typedDocumentID), custodianIdentifier);

        OrganizationName custodianOrganizationName = new OrganizationNameImpl("Custodian organisation");

        custodianOrganization.setName(custodianOrganizationName);
        custodianOrganization.setTelecom(contact);
        custodianOrganization.setAddress(new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.POSTAL_ADDRESS));

        AssignedCustodian assignedCustodian = AssignedCustodianImpl.getInstance(custodianOrganization);
        Custodian custodian = CustodianImpl.getInstance(assignedCustodian);

        // *****************************
        // ***** Attached Referral *****
        // *****************************

        AttachedMedia attachment = new AttachedMedia(new File("src/test/resources/ReferralDocument.pdf"));
        ReferralDocument refDocument = new ReferralDocumentImpl(attachment);

        // *****************************
        // ***** Clinical Document *****
        // *****************************

        ClinicalDocument document = ClinicalDocumentFactory.getEReferral();
        document.setSetId(documentID);

        // We can set the document number to something other than 1 if required
        document.setVersionNumber(1);

        // As an example we can add another template if needed.
        // This template indicates CDA Rendering is possible with
        // NEHTA_Generic_CDA_Stylesheet.xsl
        document.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
        document.setCompletionCode(DocumentStatusCode.FINAL);

        // String documentId =
        // "2.25.36901752580752676809846395044082807160";
        // Must be an OID to pass into PCEHR

        // You can also use the conversion tool
        String documentUUID = UUID.randomUUID().toString();
        String documentIdAsAnOid = UUIDTool.uuidToOid(documentUUID);

        document.setClinicalDocumentId(documentIdAsAnOid);

        // All model objects combined
        ReferralModel model = new ReferralModelImpl(document, subject, author, referee, custodian);

        EReferralCreator eReferralCreator = new EReferralCreator(model, refDocument);

        // useStrict() does Schematron checking when creating.
        // This is useful for finding bugs in development
        // and can then be turned off for production performance
        // eReferralCreator.setSchematronResource(SchematronResources.E_REFERRAL_1A.resource());
        // eReferralCreator.useStrict();

        Document clinicalDocument = eReferralCreator.create();

        String cdaString = documentToXML(clinicalDocument);
        printToFile(cdaString, "eReferral1A.xml");
        System.out.println(cdaString);
    }

    /**
     * Print the string to a file
     */
    public static void printToFile(String s, String fileName) {
        FileOutputStream fs = null;

        try {
            fs = new FileOutputStream(fileName);
            fs.write(s.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fs != null) {
                try {
                    fs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Convert a Document to a String
     */
    public static String documentToXML(Document clinicalDocument) {
        String cdaXml = "";
        try {

            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer();
            transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");

            StringWriter writer = new StringWriter();
            StreamResult result = new StreamResult(writer);

            DOMSource domSource = new DOMSource(clinicalDocument);
            transformer.transform(domSource, result);

            writer.flush();
            writer.close();
            cdaXml = writer.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cdaXml;
    }
}

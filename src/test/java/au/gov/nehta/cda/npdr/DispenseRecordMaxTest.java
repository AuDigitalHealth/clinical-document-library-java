package au.gov.nehta.cda.npdr;

import au.gov.nehta.builder.npdr.dispenserecord.DispenseRecordCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.AMTv3Code;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.PBSCode;
import au.gov.nehta.model.cda.common.code.PatientCategory;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.document.RelatedDocument;
import au.gov.nehta.model.cda.common.document.TransformRelatedDocument;
import au.gov.nehta.model.cda.common.id.*;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.npdr.DispenseRecordCdaModel;
import au.gov.nehta.model.cda.npdr.PCEHRDispenseItem;
import au.gov.nehta.model.cda.npdr.PCEHRDispenseItemBuilder;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescriptionImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.clinical.etp.dispenserecord.*;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import java.io.File;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.*;

public class DispenseRecordMaxTest extends Base {

    private static final String SCHEMATRON = "ccd-3B.sch";
    private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/PCEHR-DispenseRecord/";

    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/npdr/npdr-dispense-max.xml";

    @Test
    @Ignore
    public void test_MAX__NPDR_DispenseDocumentCreation() {
        generateMaxDocument();
//        SchematronCheckResult check = Schematron
//                .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//        show(check);
//        assertTrue(check.schemaErrors.size() == 0);
//        assertTrue(check.schematronErrors.size() == 0);
        File f = new File(DOCUMENT_FILE_NAME);
        Assert.assertTrue(f.exists());
        Assert.assertTrue(f.length() > 0L);
    }

    public void generateMaxDocument() {
        ZonedDateTime now = ZonedDateTime.now();

        // Setup context
        // Subject Of Care
        // IHI ihi = new IHI( "8003600300001283" );
        String socFamilyName = "Example";

        ZonedDateTime dob = LocalDate.of(1982, 11, 28).atStartOfDay(ZoneId.systemDefault());

        AustralianAddress subjectOfCareAustralianAddress = new AustralianAddressImpl();
        subjectOfCareAustralianAddress.addUnstructuredAddressLine("Desk-40, Level 2, 10 Browning street");
        subjectOfCareAustralianAddress.setCity("West End");
        subjectOfCareAustralianAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        subjectOfCareAustralianAddress.setPostcode("4101");

        AddressContext subjectOfCareAddress = new AddressContextImpl(subjectOfCareAustralianAddress, AddressPurpose.RESIDENTIAL_PERMANENT);
        PersonName subjectOfCarePersonName = new PersonNameImpl(socFamilyName);
        subjectOfCarePersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
        subjectOfCarePersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
        subjectOfCarePersonName.addGivenName("I'm an");
        subjectOfCarePersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

        // The most common way of adding a date of birth, age and accuracy indicator.
        // Age will be calculated from date of birth
        DateAccuracy dobAccuracy = new DateAccuracyImpl(/*day */ true,  /*month*/ true, /*year*/ true);
        DateOfBirthDetail socDobDetail = new DateOfBirthDetailImpl(dob, dobAccuracy);

        SubjectOfCareDemographicData socDemographicData = new SubjectOfCareDemographicDataImpl(Sex.MALE, socDobDetail);

        SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectOfCarePersonName, socDemographicData);

        List<IHI> socIdentifiers = Collections.singletonList(new IHI("8003604444567894"));
        SubjectOfCareParticipant subjectOfCareParticipant = new SubjectOfCareParticipantImpl(socIdentifiers, subjectOfCareAddress, subjectOfCarePerson);

        AsEntityIdentifier subjectOfCareEntitlementNumber = new MedicareCardIdentifier("123456789-2");

        Entitlement subjectOfCareEntitlement = new EntitlementImpl(subjectOfCareEntitlementNumber, EntitlementType.MEDICARE_BENEFITS);

        // New ParticipantEntitlement starting from today
        subjectOfCareEntitlement.setEntitlementValidityDuration(RestrictedTimeInterval.getHighInstance(new PrecisionDate(Precision.DAY)));

        List<Entitlement> subjectOfCareEntitlementList = new ArrayList<>();
        subjectOfCareEntitlementList.add(subjectOfCareEntitlement);
        subjectOfCareParticipant.setEntitlements(subjectOfCareEntitlementList);

//      String subjectOfCareParticipationType ="Subject Of Care";
//      SubjectOfCareParticipation subjectOfCareParticipation = new SubjectOfCareParticipationImpl( subjectOfCareParticipationType,  subjectOfCareParticipant );

        // Dispenser
        HPII dispenserHPII = new HPII("8003610000010401");
        String dispenserFamilyName = "Davo";

        Calendar dispenserDOB = GregorianCalendar.getInstance();
        dispenserDOB.set(1952, Calendar.JANUARY, 1);

        // The author location
        AustralianAddress dispenserAddress = new AustralianAddressImpl();
        dispenserAddress.addUnstructuredAddressLine("chemical wherehouse 10 Browning street");
        dispenserAddress.setCity("West End");
        dispenserAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        dispenserAddress.setPostcode("4101");
        ProviderAddress addressCotext = new ProviderAddressImpl(false, dispenserAddress, AddressPurpose.BUSINESS);
        DispenserParticipant dispenserParticipant = new DispenserParticipantImpl(dispenserHPII, new PersonNameImpl(dispenserFamilyName), addressCotext);
        DispenserParticipation dispenserParticipation = new DispenserParticipationImpl(dispenserParticipant);

        // Dispenser Organisation
        HPIO dispensingOrgHPIO = new HPIO("8003620000030333");
        String dispenserOrgName = "London Drugs";

        AustralianAddress dispensingOrgAddress = new AustralianAddressImpl();
        dispensingOrgAddress.addUnstructuredAddressLine("Desk-40, Level 2, 10 Browning street");
        dispensingOrgAddress.setCity("West End");
        dispensingOrgAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        dispensingOrgAddress.setPostcode("4101");

        ProviderAddress dispensingOrganisationAddress = new ProviderAddressImpl(false, dispensingOrgAddress, AddressPurpose.BUSINESS);
        Telecom dispensingOrgEmail = new TelecomImpl(TelecomMedium.EMAIL, "info@londondrugs.com.au", TelecomUse.BUSINESS);
        Telecom dispensingOrgTel = new TelecomImpl("0512345678");
        List<Telecom> dispensingOrgTelecoms = Arrays.asList(dispensingOrgEmail, dispensingOrgTel);
        Organisation dispensingOrganisation = new OrganisationImpl(dispenserOrgName);

        DispensingOrganisationParticipant dispensingOrganisationParticipant =
                new DispensingOrganisationParticipantImpl(
                        dispensingOrgHPIO,
                        dispensingOrganisationAddress,
                        dispensingOrgTelecoms,
                        dispensingOrganisation);

        AsEntityIdentifier dispensingOrgEntitlement = new AsEntityIdentifierImpl("1.22.333.4444", "12345678-1");

        Entitlement dispensingOrganisationEntitlement = new EntitlementImpl(dispensingOrgEntitlement, EntitlementType.MEDICARE_PHARMACY_APPROVAL_NUMBER);

        // Validity between now and two weeks from now
        dispensingOrganisationEntitlement.setEntitlementValidityDuration(RestrictedTimeInterval.getLowHighInstance(new PrecisionDate(Precision.DAY, 900L), new PrecisionDate(Precision.DAY)));

        DispensingOrganisationParticipation dispensingOrganisationParticipation = new DispensingOrganisationParticipationImpl(dispensingOrganisationParticipant);

        // therapeuticGoodIdentification
        Code amt = new AMTv3Code("23641011000036102", "paracetamol 500 mg + codeine phosphate 30 mg tablet");
        Code pbs = new PBSCode("1471K", "FLUCONAZOLE");

        // amt may be translated to pbs, or either may be used on their own
        amt.addTranslation(pbs);

        // A builder pattern to create a 'PCEHRDispenseItem' object which can be complex.
        PCEHRDispenseItemBuilder builder = new PCEHRDispenseItemBuilder();

        // May chain calls
        builder.therapeuticGood(pbs) // example of using pbs without amt->pbs translation
                .eventDate(ZonedDateTime.now())
                .isbrandSubstitutionOccured(true)
                .maximumNumberOfRepeats(5)
                .numberOfThisDispense(1)
                .claimTypeCategory(ClaimTypeCategory.GENERAL_BENEFIT)
                .quantityDispensed(QuantityUnitDescriptionImpl.create(new RealQuantity(3, "bottles")))
                .patientCategory(PatientCategory.COMMUNITY_PATIENT)
                .prescriptionItem(UniqueIdentifierImpl.createSimpleIdentifier("1.22.33.444", "123457"))
                .dispenseItem(UniqueIdentifierImpl.createSimpleIdentifier("1.22.33.444", "123456"))
                .dispensingStatusType(DispensingStatus.COMPLETED);

        PCEHRDispenseItem content = builder.build();

        DispenseRecordContext context = new DispenseRecordContextImpl(subjectOfCareParticipant, dispenserParticipation, dispensingOrganisationParticipation);
        DispenseRecord dispenseRecord = new DispenseRecordImpl(context, content);

        int versionId = 2; // this version replaces a previous document
        BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getNPDRDispenseRecord();
        cdaClinicalDocument.setVersionNumber(versionId);

        // String dispenseDocumentId = "2.25.300851251280737466240776669920800075139";

        // You can also use the conversion tool
        String doucmentUUID = UUID.randomUUID().toString();
        String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);
        String dispenseDocumentId = documentIdAsAnOid;

        cdaClinicalDocument.setClinicalDocumentId(dispenseDocumentId);

        // As an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
        String cdaSetID = "2.3.1234535353";
        cdaClinicalDocument.setSetId(cdaSetID);

        HPII authenticator = new HPII("8003610000010401");
        Person authenticatorPerson = PersonImpl.getInstance(authenticator, new PersonNameImpl("Jones"));
        HPIO authHpio = new HPIO("1234687901234561");
        Organization authenticatingOrg = OrganizationImpl.getInstance(authHpio);
        AssignedEntity assignedAuthenticator = AssignedEntityImpl.getInstance(UUID.randomUUID().toString(), authenticatorPerson, authenticatingOrg);

        LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl.getInstance(now, assignedAuthenticator);

        // HPIO the easy way
        AsEntityIdentifier custodianIdentifier = new HPIO("8003620000030333");

        UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl(UUID.randomUUID().toString());
        UniqueIdentifier otherId = new UniqueIdentifierImpl(UUID.randomUUID().toString());

        CustodianOrganization custodianOrg =
                CustodianOrganizationImpl.getInstance(Arrays.asList(typedDocumentID, otherId),
                        custodianIdentifier);
        custodianOrg.setName(new OrganizationNameImpl("Mal's Practice"));

        AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl.getInstance(custodianOrg);

        Custodian cdaCustodian = CustodianImpl.getInstance(cdaAssignedCustodian);

        // replacement style related document
//        int replacedVersion = versionId++;
//        UniqueIdentifier parentDocumentID = UniqueIdentifierImpl.createSimpleIdentifier( dispenseDocumentId, "extension" );
//        UniqueIdentifier parentDocumentSetID = UniqueIdentifierImpl.createSimpleIdentifier( cdaSetID, "Source Record Identifier" );
//        ReplacementRelatedDocument relatedDocument = new ReplacementRelatedDocument( parentDocumentID, parentDocumentSetID, replacedVersion );
//        //the document code being replaced
//        Code code = new NCTISDataComponent("100.16765","PCEHR Dispense Record");
//        relatedDocument.setDocumentCode( code  );
//        List<RelatedDocument> relatedDocuments = Collections.singletonList( (RelatedDocument)relatedDocument  );

        // Transform style replacement document
        UniqueIdentifier docId = new UniqueIdentifierImpl(UUIDTool.uuidToOid(UUID.randomUUID()));
        UniqueIdentifier setId = new UniqueIdentifierImpl(UUID.randomUUID().toString());

        TransformRelatedDocument relatedDocument = new TransformRelatedDocument(docId, setId, 1);
        List<RelatedDocument> relatedDocuments = Collections.singletonList((RelatedDocument) relatedDocument);

        DispenseRecordCdaModel dispenseRecordCdaModel =
                new DispenseRecordCdaModel(
                        cdaClinicalDocument,
                        cdaLegalAuthenticator,
                        relatedDocuments,
                        cdaCustodian
                );

        DispenseRecordCreator dispenseRecordCreatorCreator = new DispenseRecordCreator(dispenseRecordCdaModel, dispenseRecord);
        // do strict Schematron checking
        // dispenseRecordCreatorCreator.useStrict();
        String cdaString;
        try {
            cdaString = TestHelper.documentToXML(dispenseRecordCreatorCreator.create());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
        System.out.println(cdaString);
    }
}

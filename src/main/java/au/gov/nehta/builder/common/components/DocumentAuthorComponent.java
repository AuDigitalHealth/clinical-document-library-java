package au.gov.nehta.builder.common.components;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisation;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.net.electronichealth.ns.cda._2_0.*;

import java.time.ZonedDateTime;
import java.util.List;

public class DocumentAuthorComponent {

    private ObjectFactory objectFactory = new ObjectFactory();

    public POCDMT000040Author getAuthor(DocumentAuthor documentAuthor,
                                        LegalAuthenticator legalAuthenticator) {

        POCDMT000040Author author = objectFactory.createPOCDMT000040Author();
        author.setTypeCode(ParticipationType.AUT);

        ZonedDateTime authorTime = documentAuthor.getParticipationPeriod();
        if (authorTime == null) {
            authorTime = legalAuthenticator.getAuthenticationTime();
        }

        author.setTime(Converter.getTS(authorTime));

        POCDMT000040AssignedAuthor assignedAuthor = objectFactory.createPOCDMT000040AssignedAuthor();
        assignedAuthor.getId().add(CDATypeUtil.getII(documentAuthor.getID()));
        assignedAuthor.setCode(Converter.convertToCECode(documentAuthor.getRole()));
        POCDMT000040Person person = objectFactory.createPOCDMT000040Person();

        List<AsEntityIdentifier> ids = documentAuthor.getEntityIdentifiers();
        person.getAsEntityIdentifier().addAll(Converter.convertEntityIdentifiers(ids));

        List<AddressContext> addresses = documentAuthor.getAddresses();
        if (addresses != null && addresses.size() > 0) {
            assignedAuthor.getAddr().addAll(AddressConverter.convert(addresses));
        }
        assignedAuthor.getTelecom()
                .addAll(Converter.convert(documentAuthor.getElectronicCommunicationDetails()));
        person.getName().addAll(Converter.convertNames(documentAuthor.getPersonNames()));

        ExtendedEmploymentOrganisation employmentDetail = documentAuthor.getEmploymentDetail();
        person.setAsEmployment(
                ClinicalModelConverter.getExtendedEmploymentOrganisation(employmentDetail));

        assignedAuthor.setAssignedPerson(person);
        author.setAssignedAuthor(assignedAuthor);

        return author;
    }
}

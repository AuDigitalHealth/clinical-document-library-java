package au.gov.nehta.builder.util;

import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.id.AssignedEntity;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.net.electronichealth.ns.cda._2_0.AD;
import au.net.electronichealth.ns.cda._2_0.II;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssignedCustodian;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssignedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040CustodianOrganization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.TEL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class CDAModelConverter {

  private static ObjectFactory objectFactory = new ObjectFactory();

  public static POCDMT000040AssignedEntity convertAssignedEntity(
      AssignedEntity cdaModelAssignedEntity) {
    POCDMT000040AssignedEntity assignedEntity = objectFactory.createPOCDMT000040AssignedEntity();
    assignedEntity.getId().add(CDATypeUtil.getII(cdaModelAssignedEntity.getId()));

    if (cdaModelAssignedEntity.getCode() != null) {
      assignedEntity.setCode(Converter.convertToCECode(cdaModelAssignedEntity.getCode()));
    }

    if (cdaModelAssignedEntity.getAssignedPerson() != null) {
      assignedEntity.setAssignedPerson(convertPerson(cdaModelAssignedEntity.getAssignedPerson()));
    }
    if (cdaModelAssignedEntity.getAddress() != null) {
      assignedEntity.getAddr()
          .addAll(convertAssignedEntityAddress(cdaModelAssignedEntity.getAddress()));
    }
    if (cdaModelAssignedEntity.getTelecom() != null) {
      assignedEntity.getTelecom().addAll(convertTelecom(cdaModelAssignedEntity.getTelecom()));
    }
    if (cdaModelAssignedEntity.getRepresentedOrganization() != null) {
      assignedEntity.setRepresentedOrganization(
          convertOrganization(cdaModelAssignedEntity.getRepresentedOrganization()));
    }

    return assignedEntity;
  }

  private static POCDMT000040Person convertPerson(Person cdaModelPerson) {
    POCDMT000040Person assignedPerson = objectFactory.createPOCDMT000040Person();
    assignedPerson.getAsEntityIdentifier().addAll(
        Collections.singletonList(Converter.convert(cdaModelPerson.getAsEntityIdentifier())));

    for (PersonName n : cdaModelPerson.getName()) {
      assignedPerson.getName().add(Converter.getPersonName(n));
    }

    return assignedPerson;
  }

  private static List<AD> convertAssignedEntityAddress(List<PostalAddress> cdaModelAddress) {
    List<AD> address = new ArrayList<>();

    for (PostalAddress cdaModelPostalAddress : cdaModelAddress) {
      address.add(Converter.getAddress(cdaModelPostalAddress));
    }

    return address;
  }

  private static List<TEL> convertTelecom(
      List<Telecom> cdaModelLegalAuthenticatorAssignedEntityTelecom) {
    List<TEL> telecom = new ArrayList<>();
    for (Telecom cdaModelTelecom : cdaModelLegalAuthenticatorAssignedEntityTelecom) {
      telecom.add(Converter.convert(cdaModelTelecom));
    }

    return telecom;
  }

  private static POCDMT000040Organization convertOrganization(Organization cdaModelOrganisation) {
    POCDMT000040Organization organization = objectFactory.createPOCDMT000040Organization();
    if (null != cdaModelOrganisation.getAsEntityIdentifier()) {
      organization.getAsEntityIdentifier()
          .add(Converter.convert(cdaModelOrganisation.getAsEntityIdentifier()));
    }

    if (cdaModelOrganisation.getName() != null) {
      organization.getName()
          .add(Converter.getOrganizationNameAndUse(cdaModelOrganisation.getName()));
    }
    return organization;
  }

  public static POCDMT000040AssignedCustodian convertAssignedCustodian(
      CustodianOrganization custodianOrg) {
    POCDMT000040AssignedCustodian assignedCustodian = objectFactory
        .createPOCDMT000040AssignedCustodian();
    POCDMT000040CustodianOrganization assignedCustodianOrganization = objectFactory
        .createPOCDMT000040CustodianOrganization();
    assignedCustodianOrganization.getId()
        .addAll(getCustodianAssignedCustodianRepresentedOrganizationId(custodianOrg));

    if (custodianOrg.getAsEntityIdentifier() != null) {
      assignedCustodianOrganization.getAsEntityIdentifier()
          .add(Converter.convert(custodianOrg.getAsEntityIdentifier()));
    }

    if (custodianOrg.getName() != null) {
      assignedCustodianOrganization.setName(Converter.getOrganizationName(custodianOrg.getName()));
    }
    if (custodianOrg.getTelecom() != null) {
      assignedCustodianOrganization.setTelecom(Converter.convert(custodianOrg.getTelecom()));
    }

    if (custodianOrg.getAddress() != null) {
      assignedCustodianOrganization.setAddr(Converter.getAddress(custodianOrg.getAddress()));
    }

    assignedCustodian.setRepresentedCustodianOrganization(assignedCustodianOrganization);
    return assignedCustodian;
  }

  private static List<II> getCustodianAssignedCustodianRepresentedOrganizationId(
      CustodianOrganization org) {
    List<II> id = new LinkedList<>();

    org.getIds().parallelStream().filter(Objects::nonNull).forEach(uniqueIdentifier -> {
      id.add(Converter.getII(uniqueIdentifier));
    });

    return id;
  }
}

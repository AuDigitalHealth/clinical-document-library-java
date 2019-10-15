/*
 * Copyright 2011 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

package au.gov.nehta.builder.common;

import au.gov.nehta.builder.ereferral.ReferralParticipant;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.diagnostic.pathology.AuthorParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.EmploymentOrganisation;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisation;
import au.gov.nehta.model.clinical.diagnostic.pathology.RequesterParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetail;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ED;
import au.net.electronichealth.ns.cda._2_0.EntityClass;
import au.net.electronichealth.ns.cda._2_0.ON;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040OrganizationPartOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;
import au.net.electronichealth.ns.ci.cda.extensions._3.Employment;
import au.net.electronichealth.ns.ci.cda.extensions._3.ParticipantRole;
import au.net.electronichealth.ns.ci.cda.extensions._3.Qualifications;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ClinicalModelConverter {

  private static final String COVERAGE2_TYPE_CODE = "COVBY";

  public static POCDMT000040Organization getPrescriberOrganization(
      PrescriberOrganisationParticipant prescriberOrganisationParticipant) {
    return getProviderOrganization(prescriberOrganisationParticipant.getOrganisation(),
        prescriberOrganisationParticipant.getEntityIdentifiers(),
        prescriberOrganisationParticipant.getAddresses(),
        prescriberOrganisationParticipant.getElectronicCommunicationDetail());
  }

  public static POCDMT000040Organization getDispensingOrganization(
      DispensingOrganisationParticipant dispensingOrganisationParticipant) {
    return getProviderOrganization(dispensingOrganisationParticipant.getOrganisation(),
        dispensingOrganisationParticipant.getEntityIdentifiers(),
        dispensingOrganisationParticipant.getAddresses(),
        dispensingOrganisationParticipant.getElectronicCommunicationDetail());
  }

  private static POCDMT000040Organization getProviderOrganization(Organisation organisation,
      HPIO hpio, ProviderAddress providerAddress,
      List<Telecom> communicationDetail) {
    POCDMT000040Organization organization = new POCDMT000040Organization();
    POCDMT000040OrganizationPartOf asOrganizationPartOf = new POCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganization = new POCDMT000040Organization();

    if (hpio != null) {
      wholeOrganization.getAsEntityIdentifier().add(Converter.convert(hpio));
    }

    if (providerAddress != null) {
      wholeOrganization.getAddr().add(AddressConverter.convert(providerAddress));
    }

    if (communicationDetail != null && !communicationDetail.isEmpty()) {
      wholeOrganization.getTelecom().addAll(Converter.convert(communicationDetail));
    }

    if (organisation.getDepartmentUnit() != null) {
      String departmentUnit = organisation.getDepartmentUnit();
      ON departmentUnitON = new ON();
      departmentUnitON.getContent().add(departmentUnit);
      organization.getName().add(departmentUnitON);
    }

    if (organisation.getId() != null) {
      organization.getId().add(CDATypeUtil.getII(organisation.getId()));
    }

    wholeOrganization.getName().add(Converter.getOrganizationNameAndUse(organisation));
    asOrganizationPartOf.setWholeOrganization(wholeOrganization);
    organization.setAsOrganizationPartOf(asOrganizationPartOf);

    return organization;
  }


  public static POCDMT000040Person getPrescriberPerson(DefaultParticipant prescriberParticipant) {
    POCDMT000040Person person = getPerson(prescriberParticipant.getPerson().getPersonName(),
        prescriberParticipant.getEntityIdentifiers(), prescriberParticipant.getQualifications());
    person.setAsEmployment(getEmployment(prescriberParticipant.getPerson().getEmploymentDetail()));
    return person;
  }

  static POCDMT000040Person getRequestersPerson(RequesterParticipant requesterParticipant) {
    POCDMT000040Person person = getPerson(requesterParticipant.getPerson().getPersonName(),
        requesterParticipant.getEntityIdentifiers(), requesterParticipant.getQualifications());
    person.setAsEmployment(getEmployment(requesterParticipant.getPerson().getEmploymentDetail()));

    POCDMT000040Organization providerOrganization = getProviderOrganization(
        requesterParticipant.getOrganisation(), null, null, null);

    POCDMT000040Organization wholeOrganization = providerOrganization.getAsOrganizationPartOf()
        .getWholeOrganization();
    if (null != requesterParticipant.getOrganisationIdentifiers()
        && !requesterParticipant.getOrganisationIdentifiers().isEmpty()) {
      for (AsEntityIdentifier id : requesterParticipant.getOrganisationIdentifiers()) {
        wholeOrganization.getAsEntityIdentifier().add(Converter.convert(id));
      }
    }

    person.getAsEmployment().setEmployerOrganization(providerOrganization);
    return person;
  }

  static POCDMT000040Person getRefereePerson(ReferralParticipant referee) {
    POCDMT000040Person person = getPerson(referee.getParticipantName(),
        referee.getParticipantHPII(), null);
    Employment emp = new Employment();
    emp.setClassCode(EntityClass.EMP);
    POCDMT000040Organization org = getProviderOrganization(referee.getEmploymentOrganisation(),
        referee.getEmploymentOrganisationHPIO(),
        null, null);
    emp.setEmployerOrganization(org);
    person.setAsEmployment(emp);

    return person;
  }

  public static POCDMT000040Person getAuthorPerson(AuthorParticipant authorParticipant) {
    POCDMT000040Person person = getPerson(authorParticipant.getPerson().getPersonName(),
        authorParticipant.getEntityIdentifiers(), authorParticipant.getQualifications());

    person
        .setAsEmployment(getEmploymentOrganisation(authorParticipant.getEmploymentOrganisation()));

    return person;
  }

  public static Employment getEmploymentOrganisation(EmploymentOrganisation employmentOrg) {
    if (employmentOrg == null) {
      return null;
    }

    Employment employment = new Employment();
    employment.setClassCode(EntityClass.EMP);

    POCDMT000040Organization organization = new POCDMT000040Organization();
    POCDMT000040OrganizationPartOf asOrganizationPartOf = new POCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganization = new POCDMT000040Organization();

    List<? extends AsEntityIdentifier> organisationIdentifiers = employmentOrg
        .getOrganisationIdentifiers();

    for (AsEntityIdentifier id : organisationIdentifiers) {
      wholeOrganization.getAsEntityIdentifier().add(Converter.convert(id));
    }

    if (employmentOrg.getDepartmentUnit() != null) {
      String departmentUnit = employmentOrg.getDepartmentUnit();
      ON departmentUnitON = new ON();
      departmentUnitON.getContent().add(departmentUnit);
      organization.getName().add(departmentUnitON);
    }

    wholeOrganization.getName().add(Converter.getOrganizationNameAndUse(employmentOrg));

    asOrganizationPartOf.setWholeOrganization(wholeOrganization);
    organization.setAsOrganizationPartOf(asOrganizationPartOf);

    employment.setEmployerOrganization(organization);
    employment.setJobCode(Converter.convertToCECode(employmentOrg.getOccupation()));
    employment.setJobClassCode(Converter.convertToCECode(employmentOrg.getEmployementType()));
    employment.setCode(Converter.convertToCECode(employmentOrg.getPositionInOrganisation()));

    return employment;
  }


  public static Employment getExtendedEmploymentOrganisation(
      ExtendedEmploymentOrganisation employmentOrg) {
    if (employmentOrg == null) {
      return null;
    }

    //map the base employment
    Employment employment = getEmploymentOrganisation(employmentOrg);

    POCDMT000040Organization wholeOrganization = employment.getEmployerOrganization()
        .getAsOrganizationPartOf().getWholeOrganization();

    //add the extra addresses
    if (employmentOrg.getAddresses() != null && !employmentOrg.getAddresses().isEmpty()) {

      wholeOrganization.getAddr().addAll(AddressConverter.convert(employmentOrg.getAddresses()));
    }

    //add the extra communication details
    if (employmentOrg.getElectronicCommunicationDetails() != null && !employmentOrg
        .getElectronicCommunicationDetails().isEmpty()) {
      wholeOrganization.getTelecom()
          .addAll(Converter.convert(employmentOrg.getElectronicCommunicationDetails()));
    }

    return employment;
  }

  private static Employment getEmployment(ProviderEmploymentDetail prescriberEmploymentDetail) {
    Employment employment = new Employment();
    employment.setClassCode(EntityClass.EMP);

    if (prescriberEmploymentDetail != null) {
      employment.setJobCode(Converter.convertToCECode(prescriberEmploymentDetail.getOccupation()));
    }
    return employment;
  }

  public static POCDMT000040Person getDispenserPerson(DispenserParticipant part) {
    return getPerson(part.getPersonName(), part.getEntityIdentifiers(), part.getQualifications());
  }

  public static POCDMT000040Person getPerson(PersonName personName,
      AsEntityIdentifier providerEntityIdentifier,
      String providerQualifications) {
    POCDMT000040Person person = new POCDMT000040Person();
    if (null != providerEntityIdentifier) {
      person.getAsEntityIdentifier()
          .addAll(Collections.singletonList(Converter.convert(providerEntityIdentifier)));
    }
    person.getName().add(Converter.getPersonName(personName));

    if (providerQualifications != null) {
      Qualifications qualifications = new Qualifications();
      qualifications.setClassCode(EntityClass.QUAL);
      CE qualificationsCode = new CE();
      ED qualificationCodeOriginalTextValue = new ED();
      qualificationCodeOriginalTextValue.getContent().add(providerQualifications);
      qualificationsCode.setOriginalText(qualificationCodeOriginalTextValue);
      qualifications.setCode(qualificationsCode);
      person.setAsQualifications(qualifications);
    }

    return person;
  }

  // Subject of Care Entitlements
  public static List<Coverage2> getSubjectOfCareEntitlements(SubjectOfCareParticipant soc) {
    String patientRoleId = soc.getPatientRoleId();

    List<Coverage2> coverage2 = new ArrayList<>();

    addSOCEntitlements(soc.getEntitlements(), patientRoleId, coverage2);

    return coverage2;
  }


  private static void addSOCEntitlements(List<? extends Entitlement> ents, String patientRoleId,
      List<Coverage2> coverage2) {
    for (Entitlement subjectOfCareEntitlement : ents) {
      Coverage2 coverage2item = new Coverage2();
      coverage2item.setTypeCode(COVERAGE2_TYPE_CODE);
      au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement coverage2itemEntitlement = new au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement();
      coverage2itemEntitlement.setClassCode(EntityClass.COV);
      coverage2itemEntitlement.setMoodCode(ActMood.EVN);
      coverage2itemEntitlement
          .setId(Converter.getII(subjectOfCareEntitlement.getEntitlementNumber()));
      coverage2itemEntitlement
          .setCode(EntitlementTypeCodeSet.convert(subjectOfCareEntitlement.getEntitlementType()));
      au.net.electronichealth.ns.ci.cda.extensions._3.Participant coverage2itemEntitlementParticipant = new au.net.electronichealth.ns.ci.cda.extensions._3.Participant();
      coverage2itemEntitlementParticipant.setTypeCode(ParticipationType.BEN);
      ParticipantRole coverage2itemEntitlementParticipantParticipantRole = new ParticipantRole();
      coverage2itemEntitlementParticipantParticipantRole.setClassCode(RoleClass.PAT);
      coverage2itemEntitlementParticipantParticipantRole.setId(CDATypeUtil.getII(patientRoleId));
      coverage2itemEntitlementParticipant
          .setParticipantRole(coverage2itemEntitlementParticipantParticipantRole);
      coverage2itemEntitlement.getParticipant().add(coverage2itemEntitlementParticipant);
      coverage2itemEntitlement.setEffectiveTime(
          Converter.convert(subjectOfCareEntitlement.getEntitlementValidityDuration()));
      coverage2item.setEntitlement(coverage2itemEntitlement);
      coverage2.add(coverage2item);
    }
  }

  // Prescriber Entitlements
  public static List<Coverage2> getParticpantEntitlements(List<? extends Entitlement> entitlements,
      String assignedAuthorId) {
    List<Coverage2> coverage2 = new ArrayList<>();

    for (Entitlement entitlement : entitlements) {
      Coverage2 coverage2item = getParticipantEntitlement(entitlement, assignedAuthorId);
      coverage2.add(coverage2item);
    }

    return coverage2;
  }

  private static Coverage2 getParticipantEntitlement(Entitlement entitlement,
      String assignedAuthorId) {
    Coverage2 coverage2item = new Coverage2();
    coverage2item.setTypeCode(COVERAGE2_TYPE_CODE);
    au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement coverage2itemEntitlement = new au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement();
    coverage2itemEntitlement.setClassCode(EntityClass.COV);
    coverage2itemEntitlement.setMoodCode(ActMood.EVN);
    coverage2itemEntitlement.setId(Converter.getII(entitlement.getEntitlementNumber()));
    coverage2itemEntitlement
        .setCode(EntitlementTypeCodeSet.convert(entitlement.getEntitlementType()));
    au.net.electronichealth.ns.ci.cda.extensions._3.Participant coverage2itemEntitlementParticipant = new au.net.electronichealth.ns.ci.cda.extensions._3.Participant();
    coverage2itemEntitlementParticipant.setTypeCode(ParticipationType.HLD);
    ParticipantRole coverage2itemEntitlementParticipantParticipantRole = new ParticipantRole();
    coverage2itemEntitlementParticipantParticipantRole.setClassCode(RoleClass.ASSIGNED);
    coverage2itemEntitlementParticipantParticipantRole.setId(CDATypeUtil.getII(assignedAuthorId));
    coverage2itemEntitlementParticipant
        .setParticipantRole(coverage2itemEntitlementParticipantParticipantRole);
    coverage2itemEntitlement.getParticipant().add(coverage2itemEntitlementParticipant);
    if (entitlement.getEntitlementValidityDuration() != null) {
      coverage2itemEntitlement
          .setEffectiveTime(Converter.convert(entitlement.getEntitlementValidityDuration()));
    }
    coverage2item.setEntitlement(coverage2itemEntitlement);
    return coverage2item;
  }

  // Dispensing Organisation entitlement
  public static List<Coverage2> getDispensingOrganisationEntitlements(
      List<? extends Entitlement> entitlements, String participantRoleId) {
    List<Coverage2> coverage2 = new ArrayList<>();

    for (Entitlement entitlement : entitlements) {
      Coverage2 coverage2item = getDispensingOrganisationEntitlement(entitlement,
          participantRoleId);
      coverage2.add(coverage2item);
    }

    return coverage2;
  }


  private static Coverage2 getDispensingOrganisationEntitlement(Entitlement entitlement,
      String participantRoleId) {
    Coverage2 coverage2item = new Coverage2();
    coverage2item.setTypeCode(COVERAGE2_TYPE_CODE);
    au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement coverage2itemEntitlement = new au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement();
    coverage2itemEntitlement.setClassCode(EntityClass.COV);
    coverage2itemEntitlement.setMoodCode(ActMood.EVN);
    coverage2itemEntitlement.setId(Converter.getII(entitlement.getEntitlementNumber()));
    coverage2itemEntitlement
        .setCode(EntitlementTypeCodeSet.convert(entitlement.getEntitlementType()));
    au.net.electronichealth.ns.ci.cda.extensions._3.Participant coverage2itemEntitlementParticipant = new au.net.electronichealth.ns.ci.cda.extensions._3.Participant();
    coverage2itemEntitlementParticipant.setTypeCode(ParticipationType.HLD);
    ParticipantRole coverage2itemEntitlementParticipantParticipantRole = new ParticipantRole();
    coverage2itemEntitlementParticipantParticipantRole.setClassCode(RoleClass.SDLOC);

    coverage2itemEntitlementParticipantParticipantRole.setId(CDATypeUtil.getII(participantRoleId));
    coverage2itemEntitlementParticipant
        .setParticipantRole(coverage2itemEntitlementParticipantParticipantRole);
    coverage2itemEntitlement.getParticipant().add(coverage2itemEntitlementParticipant);
    if (entitlement.getEntitlementValidityDuration() != null) {
      coverage2itemEntitlement
          .setEffectiveTime(Converter.convert(entitlement.getEntitlementValidityDuration()));
    }
    coverage2item.setEntitlement(coverage2itemEntitlement);
    return coverage2item;
  }
}

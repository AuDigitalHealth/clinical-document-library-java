package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.id.TemplateId;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public class AttachedMedia {

  private String fileName;
  private String mediaType;
  private byte[] integrityCheck;
  private IntegerityCheckType integrityCheckType;
  private POCDMT000040ObservationMedia observationMediaReference;
  private POCDMT000040Observation observationReference;
  private TemplateId templateId;

  public AttachedMedia(File file) throws IOException {
    this(file, IntegerityCheckType.SHA_1);
  }

  /**
   * Use this constructor when a template ID is required. Current affected documents include :
   *
   * - PharmacistSharedMedicinesList
   *
   * Refer to :
   *
   * - au.gov.nehta.model.cda.common.id.TemplateId - au.gov.nehta.builder.psml.PharmacistSharedMedicinesListCreator.getPSMLSection()
   *
   * Where each entry in the list of attached media requires a template id to be present as per
   * example xml below :
   *
   * <entry>
   * <templateId root="1.2.36.1.2001.1001.101.102.16883"/>
   * <observationMedia ID="fde23eaa-77ff-4c0c-837f-d53902321c1d" classCode="OBS" moodCode="EVN">
   * <value integrityCheck="WuGzArOJ0d+HNGnOw7xj3uKVXig=" mediaType="application/pdf">
   * <reference value="referral_list.pdf"/>
   * </value>
   * </observationMedia>
   * </entry>
   */
  public AttachedMedia(File file, TemplateId templateId) throws IOException {
    this(file.getName(),
          Files.probeContentType(file.toPath()),
          IntegerityCheckType.SHA_1.check(file),
          IntegerityCheckType.SHA_1,
          null,
          null,
          templateId);
  }

  public AttachedMedia(File file, IntegerityCheckType checkType) throws IOException {
    this(file, Files.probeContentType(file.toPath()), checkType);
  }

  public AttachedMedia(File file, String mediaType, IntegerityCheckType checkType) {
    this(file.getName(),
          mediaType,
          checkType.check(file),
          checkType,
          null,
          null,
          null);
    ArgumentUtils.checkNotNull(file, "logo file");
  }


  public AttachedMedia(String fileName,
                       String mediaType,
                       byte[] integrityCheck,
                       IntegerityCheckType integrityCheckType,
                       POCDMT000040ObservationMedia observationMediaReference,
                       POCDMT000040Observation observationReference,
                       TemplateId templateId) {
    this.fileName = fileName;
    this.mediaType = mediaType;
    this.integrityCheck = integrityCheck;
    this.integrityCheckType = integrityCheckType;
    this.observationMediaReference = observationMediaReference;
    this.observationReference = observationReference;
    this.templateId = templateId;
  }

  /**
   * @return the fileName
   */
  public String getFileName() {
    return fileName;
  }

  /**
   * @return the mediaType
   */
  public String getMediaType() {
    return mediaType;
  }

  /**
   * @return the integrityCheck
   */
  public byte[] getIntegrityCheck() {
    return integrityCheck.clone();
  }

  /**
   * @return the integrityCheck
   */
  public IntegerityCheckType getIntegrityCheckType() {
    return integrityCheckType;
  }

  public POCDMT000040ObservationMedia getObservationMediaReference() {
    return observationMediaReference;
  }

  public void setObservationMediaReference(
      POCDMT000040ObservationMedia observationMediaIDAttribute) {
    this.observationMediaReference = observationMediaIDAttribute;
  }

  public POCDMT000040Observation getObservationReference() {
    return observationReference;
  }

  public void setObservationReference(
      POCDMT000040Observation observationReference) {
    this.observationReference = observationReference;
  }

  public TemplateId getTemplateId() {
    return templateId;
  }

  public void setTemplateId(TemplateId templateId) {
    this.templateId = templateId;
  }


  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public void setMediaType(String mediaType) {
    this.mediaType = mediaType;
  }

  public void setIntegrityCheck(byte[] integrityCheck) {
    this.integrityCheck = integrityCheck;
  }

  public void setIntegrityCheckType(IntegerityCheckType integrityCheckType) {
    this.integrityCheckType = integrityCheckType;
  }
}

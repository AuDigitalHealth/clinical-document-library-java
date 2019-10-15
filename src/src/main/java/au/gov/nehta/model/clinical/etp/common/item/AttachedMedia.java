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

  public AttachedMedia(File file) {
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
   * example xml example below :
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
  public AttachedMedia(File file, TemplateId templateId) {
    this(file, IntegerityCheckType.SHA_1);
    this.templateId = templateId;
  }

  public AttachedMedia(File file, IntegerityCheckType checkType) {
    ArgumentUtils.checkNotNull(file, "logo file");
    /*try {
      final MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
//      integrityCheck = getFileChecksum(messageDigest, file);
    } catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }*/
    integrityCheck = checkType.check(file);
    integrityCheckType = checkType;

//         mediaType = new MimetypesFileTypeMap().getContentType(file);
    try {
      mediaType = Files.probeContentType(file.toPath());
    } catch (IOException e) {
      e.printStackTrace();
    }
    fileName = file.getName();
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

}

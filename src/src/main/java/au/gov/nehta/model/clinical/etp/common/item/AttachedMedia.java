package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.common.utils.ArgumentUtils;
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

  public AttachedMedia(File file) {
    this(file, IntegerityCheckType.SHA_1);
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

}

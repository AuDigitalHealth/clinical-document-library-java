package au.gov.nehta.builder.util;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.net.electronichealth.ns.cda._2_0.BL;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.CS;
import au.net.electronichealth.ns.cda._2_0.CV;
import au.net.electronichealth.ns.cda._2_0.ED;
import au.net.electronichealth.ns.cda._2_0.II;
import au.net.electronichealth.ns.cda._2_0.INT;
import au.net.electronichealth.ns.cda._2_0.NullFlavor;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.SC;
import au.net.electronichealth.ns.cda._2_0.ST;
import au.net.electronichealth.ns.cda._2_0.SXCMTS;
import au.net.electronichealth.ns.cda._2_0.TS;

import java.math.BigInteger;
import java.time.format.DateTimeFormatter;
import java.time.ZonedDateTime;
import java.util.UUID;

public class CDATypeUtil {

    private static ObjectFactory objectFactory = new ObjectFactory();

    private static final String HL7_DATE_FORMAT = "yyyyMMddHHmmssZ";
    private static final DateTimeFormatter HL7_DATE_FORMATTER = DateTimeFormatter.ofPattern(HL7_DATE_FORMAT);

    public static II getII(String value) {
        II result = objectFactory.createII();
        result.setRoot(value);
        return result;
    }

    public static CD getNullCDCode() {
        CD cd = objectFactory.createCD();
        cd.setNullFlavor(NullFlavor.NA);
        return cd;
    }

    public static CE getNullCECode() {
        CE ce = objectFactory.createCE();
        ce.setNullFlavor(NullFlavor.NA);
        return ce;
    }

    public static II getII(String root, String extension) {
        ArgumentUtils.checkNotNull(extension, "value");
        II result = objectFactory.createII();
        result.setRoot(root);
        result.setExtension(extension);
        return result;
    }

    public static II getExtensionOnlyII(String value) {
        ArgumentUtils.checkNotNull(value, "value");
        II result = objectFactory.createII();
        result.setExtension(value);
        return result;
    }

    public static CE getCE(
            String code, String codeSystem, String codeSystemName, String displayName) {
        CE result = objectFactory.createCE();
        result.setCode(code);
        result.setCodeSystem(codeSystem);
        result.setCodeSystemName(codeSystemName);
        result.setDisplayName(displayName);
        return result;
    }

    public static CD getCD(
            String code, String codeSystem, String codeSystemName, String displayName) {
        CD result = objectFactory.createCD();
        result.setCode(code);
        result.setCodeSystem(codeSystem);
        result.setCodeSystemName(codeSystemName);
        result.setDisplayName(displayName);
        return result;
    }

    public static CD getCD(Coded codedValue) {
        CD result = objectFactory.createCD();
        result.setCode(codedValue.getCode());
        result.setCodeSystem(codedValue.getCodeSystem());
        result.setCodeSystemName(codedValue.getCodeSystemName());
        result.setDisplayName(codedValue.getDisplayName());
        result.setCodeSystemVersion(codedValue.getCodeSystemVersion());
        return result;
    }

    public static CV getCV(
            String code, String codeSystem, String codeSystemName, String displayName) {
        CV result = objectFactory.createCV();
        result.setCode(code);
        result.setCodeSystem(codeSystem);
        result.setCodeSystemName(codeSystemName);
        result.setDisplayName(displayName);
        return result;
    }

    public static ST getST(String value) {
        ArgumentUtils.checkNotNull(value, "value");
        ST result = objectFactory.createST();
        result.getContent().add(value);
        return result;
    }

    public static SC getSC(String value) {
        ArgumentUtils.checkNotNull(value, "value");
        SC result = objectFactory.createSC();
        result.getContent().add(value);
        return result;
    }

    public static ED getED(String value) {
        ArgumentUtils.checkNotNull(value, "value");
        ED result = objectFactory.createED();
        result.getContent().add(value);
        return result;
    }

    public static BL getBL(Boolean value) {
        ArgumentUtils.checkNotNull(value, "value");
        BL result = objectFactory.createBL();
        result.setValue(value);
        return result;
    }

    public static INT getINT(Integer value) {
        ArgumentUtils.checkNotNull(value, "value");
        INT result = objectFactory.createINT();
        result.setValue(new BigInteger(value.toString()));
        return result;
    }

    public static CS getCS(String value) {
        ArgumentUtils.checkNotNull(value, "value");
        CS result = objectFactory.createCS();
        result.setCode(value);
        return result;
    }

    public static TS getTS(ZonedDateTime date) {
        TS time = objectFactory.createTS();
        time.setValue(date.format(HL7_DATE_FORMATTER));
        return time;
    }

    public static SXCMTS getSXCMTS(ZonedDateTime date) {
        SXCMTS time = objectFactory.createSXCMTS();
        time.setValue(date.format(HL7_DATE_FORMATTER));
        return time;
    }

    public static String getUUID() {
//    String character = Character.toString(((char) (new Random().nextInt(26) + 'a')));
//    return UUID.randomUUID().toString().replaceFirst("[0-9]", character);
        String uuid = UUID.randomUUID().toString();
        if (!Character.isDigit(uuid.charAt(0))) {
            return uuid;
        }
        return getUUID();
//    return uuid;
    }

    /**
     * public static CD getCD( CodeableText codeableText ) { ArgumentUtils.checkNotNull( codeableText,
     * "codeableText" );
     *
     * <p>CD result = null;
     *
     * <p>if (codeableText.isCoded()) { result = CDATypeUtil.getCD( codeableText.getCode(),
     * codeableText.getCodeSystem(), codeableText.getCodeSystemName(), codeableText.getDisplayName()
     * ); result.setOriginalText( getED( codeableText.getOriginalText() ) ); } else { result = new
     * CD(); result.setOriginalText( getED( codeableText.getUncodedValue() ) ); result.setDisplayName(
     * codeableText.getUncodedValue() ); }
     *
     * <p>return result; }
     *
     * <p>public static CE getCE( CodeableText codeableText ) { ArgumentUtils.checkNotNull(
     * codeableText, "codeableText" ); CE result = null;
     *
     * <p>if (codeableText.isCoded()) { result = CDATypeUtil.getCE( codeableText.getCode(),
     * codeableText.getCodeSystem(), codeableText.getCodeSystemName(), codeableText.getDisplayName()
     * ); result.setOriginalText( getED( codeableText.getOriginalText() ) ); } else { result = new
     * CE(); result.setOriginalText( getED( codeableText.getUncodedValue() ) ); result.setDisplayName(
     * codeableText.getUncodedValue() ); }
     *
     * <p>return result; }
     */
}

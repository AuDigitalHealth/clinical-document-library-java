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
import au.net.electronichealth.ns.cda._2_0.SC;
import au.net.electronichealth.ns.cda._2_0.ST;
import au.net.electronichealth.ns.cda._2_0.SXCMTS;
import au.net.electronichealth.ns.cda._2_0.TS;
import java.math.BigInteger;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class CDATypeUtil {

	private static final String HL7_DATE_FORMAT = "yyyyMMddHHmmssZ";
	private static final DateTimeFormatter HL7_DATE_FORMATTER =
			DateTimeFormat.forPattern(HL7_DATE_FORMAT);

	public static II getII(String value) {
		II result = new II();
		result.setRoot(value);

		return result;
	}

	public static CD getNullCDCode() {
		CD cd = new CD();
		cd.setNullFlavor(NullFlavor.NA);
		return cd;
	}

	public static CE getNullCECode() {
		CE ce = new CE();
		ce.setNullFlavor(NullFlavor.NA);
		return ce;
	}

	public static II getII(String root, String extension) {
		ArgumentUtils.checkNotNull(extension, "value");
		II result = new II();
		result.setRoot(root);
		result.setExtension(extension);
		return result;
	}

	public static II getExtensionOnlyII(String value) {
		ArgumentUtils.checkNotNull(value, "value");
		II result = new II();
		result.setExtension(value);

		return result;
	}

	public static CE getCE(
			String code, String codeSystem, String codeSystemName, String displayName) {
		CE result = new CE();
		result.setCode(code);
		result.setCodeSystem(codeSystem);
		result.setCodeSystemName(codeSystemName);
		result.setDisplayName(displayName);

		return result;
	}

	public static CD getCD(
			String code, String codeSystem, String codeSystemName, String displayName) {
		CD result = new CD();
		result.setCode(code);
		result.setCodeSystem(codeSystem);
		result.setCodeSystemName(codeSystemName);
		result.setDisplayName(displayName);

		return result;
	}

	public static CD getCD(Coded codedValue) {
		CD result = new CD();
		result.setCode(codedValue.getCode());
		result.setCodeSystem(codedValue.getCodeSystem());
		result.setCodeSystemName(codedValue.getCodeSystemName());
		result.setDisplayName(codedValue.getDisplayName());
		result.setCodeSystemVersion(codedValue.getCodeSystemVersion());

		return result;
	}

	public static CV getCV(
			String code, String codeSystem, String codeSystemName, String displayName) {
		CV result = new CV();
		result.setCode(code);
		result.setCodeSystem(codeSystem);
		result.setCodeSystemName(codeSystemName);
		result.setDisplayName(displayName);

		return result;
	}

	public static ST getST(String value) {
		ArgumentUtils.checkNotNull(value, "value");
		ST result = new ST();
		result.getContent().add(value);

		return result;
	}

	public static SC getSC(String value) {
		ArgumentUtils.checkNotNull(value, "value");
		SC result = new SC();
		result.getContent().add(value);

		return result;
	}

	public static ED getED(String value) {
		ArgumentUtils.checkNotNull(value, "value");
		ED result = new ED();
		result.getContent().add(value);

		return result;
	}

	public static BL getBL(Boolean value) {
		ArgumentUtils.checkNotNull(value, "value");
		BL result = new BL();
		result.setValue(value);

		return result;
	}

	public static INT getINT(Integer value) {
		ArgumentUtils.checkNotNull(value, "value");
		INT result = new INT();
		result.setValue(new BigInteger(value.toString()));

		return result;
	}

	public static CS getCS(String value) {
		ArgumentUtils.checkNotNull(value, "value");
		CS result = new CS();
		result.setCode(value);

		return result;
	}

	public static TS getTS(DateTime date) {
		TS time = new TS();
		time.setValue(HL7_DATE_FORMATTER.print(date));

		return time;
	}

	public static SXCMTS getSXCMTS(DateTime date) {
		SXCMTS time = new SXCMTS();
		time.setValue(HL7_DATE_FORMATTER.print(date));

		return time;
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

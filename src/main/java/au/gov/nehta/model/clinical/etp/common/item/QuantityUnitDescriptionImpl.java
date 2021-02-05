package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.clinical.common.types.RealQuantity;


/**
 * A Class that represents either a Structured Dose or a Quantity Description
 * that has optionally a Quantity, units, and a Quantity Description.
 * <p>
 * <p>
 * This may be constructed with either a Real valued Physical Quantity
 * or a quantity with units specified in a particular code system.
 * <p>
 * Use the static create methods to ensure correctness.
 *
 * <br>
 * example:
 * <pre>
 * QuantityUnitDescription quantity = QuantityUnitDescriptionImpl.create(new RealQuantity(3,"tablets"));
 *
 * or
 *
 * QuantityUnitDescription quantity = QuantityUnitDescriptionImpl.create(3, new SNOMED_AU_Code("385057009", "Film-coated tablet"));
 *
 * or
 *
 * QuantityUnitDescription quantity = QuantityUnitDescriptionImpl.create("3 somethings ");
 */
public class QuantityUnitDescriptionImpl implements QuantityUnitDescription {

    // A quantity and unit code value eg - 3, tablets
    private RealQuantity realQuantity;

    // A SNOMED CT-AU code for units
    private Code codedUnit;

    private String quantityDescription;

    /**
     * Create a quantity that has units in free text
     * <p>
     * <p>
     * example: QuantityUnitDescriptionImpl.create(new RealQuantity(3,"tablets"));
     *
     * @param realQuantity a real valued amount of something with units represented by free text
     */
    public static QuantityUnitDescription create(RealQuantity realQuantity) {
        QuantityUnitDescriptionImpl i = new QuantityUnitDescriptionImpl();
        i.setRealQuantity(realQuantity);
        return i;
    }

    /**
     * Create a quantity that has units with a actual code such as SNOMED CT AU
     * <p>
     * example: QuantityUnitDescriptionImpl.create(3, new SNOMED_AU_Code("385057009", "Film-coated tablet"));
     *
     * @param value a double number representing the amount in coded units of something
     * @param code  a code identifying the units of the supplied value, usually a SNOMED CT-AU code
     */
    public static QuantityUnitDescription create(double value, Code code) {
        QuantityUnitDescriptionImpl i = new QuantityUnitDescriptionImpl();
        i.setRealQuantity(new RealQuantity(value, null));
        i.setUnitCode(code);
        return i;
    }

    /**
     * Create a quantity that has both units and value as a single free text field.
     * This is the least usable quantity type.
     * <p>
     * example : QuantityUnitDescriptionImpl.create("3 football fields")
     */
    public static QuantityUnitDescription create(String freeTextQuantityDescription) {
        QuantityUnitDescriptionImpl i = new QuantityUnitDescriptionImpl();
        i.setQuantityDescription(freeTextQuantityDescription);
        return i;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.common.item.IQuantityUnitDescription#getRealQuantity()
     */
    @Override
    public RealQuantity getRealQuantity() {
        return realQuantity;
    }

    /**
     * RealValued (eg decimal) Quantity of the amount involved.
     * If a Coded value of units exists, that should be used.
     *
     * @param quantityAndUnits
     */
    public void setRealQuantity(RealQuantity quantityAndUnits) {
        this.realQuantity = quantityAndUnits;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.common.item.IQuantityUnitDescription#getCodedUnit()
     */
    @Override
    public Code getCodedUnit() {
        return codedUnit;
    }

    /**
     * Set the coded value in units for this Quantity.
     * Usually this will be a SNOMED CT AU Code.
     *
     * @param codeUnit SNOMED CT-AU Code
     */
    public void setUnitCode(Code codeUnit) {
        this.codedUnit = codeUnit;
    }

    public String getQuantityDescription() {
        return quantityDescription;
    }

    /**
     * A plain text description of the quantity involved
     *
     * @param quantityDescription
     */
    public void setQuantityDescription(String quantityDescription) {
        this.quantityDescription = quantityDescription;
    }
}

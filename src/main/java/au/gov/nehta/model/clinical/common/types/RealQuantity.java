package au.gov.nehta.model.clinical.common.types;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;


/**
 * A Quantity that models real values of units.
 * It's "Real" in that it uses real (decimal) numbers.
 *
 * <p>
 * example: <br>
 * <p>
 * new RealQuantity(3.4 ,"ml" );
 * <p>
 * <p>
 * the real number will be stored as a string and formatted as such:<br>
 * <pre>
 * 1.00000 =  "1"
 * 1.30000 =  "1.3"
 * 1.00001 =  "1.00001"
 * 1.000009 = "1.0001"    truncated after 5 decimal places
 *
 * </pre>
 */
public class RealQuantity extends Quantity {

    public RealQuantity(double value, String unit) {
        super(format(value), unit);
    }
    private static final int MAXIMUM_SIGNIFICANT_DIGITS = 5;

    /**
     * Format 1.0 as 1 and 1.2000 as 1.2
     *
     * @param value             the value to format
     * @param significantDigits digits to round
     * @return a formatted string
     */
    public static String format(double value, int significantDigits) {
        MathContext mathContext = new MathContext(significantDigits, RoundingMode.DOWN);
        BigDecimal bigDecimal = new BigDecimal(value, mathContext);
        return bigDecimal.toPlainString();
    }

    /**
     * Format 1.0 as 1 and 1.2000 as 1.2
     * Convenience method for format(value,  5)
     */
    private static String format(double value) {
        return format(value, MAXIMUM_SIGNIFICANT_DIGITS);
    }
}

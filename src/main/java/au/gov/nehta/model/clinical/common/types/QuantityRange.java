package au.gov.nehta.model.clinical.common.types;

public class QuantityRange {

    private double high;
    private double low;
    private String units;

    public QuantityRange(double high, double low, String units) {
        this.high = high;
        this.low = low;
        this.units = units;
    }

    public double getHigh() {
        return high;
    }

    public void setHigh(double high) {
        this.high = high;
    }

    public double getLow() {
        return low;
    }

    public void setLow(double low) {
        this.low = low;
    }

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }
}

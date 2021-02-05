package au.gov.nehta.model.cda.common.time;


/**
 * PeriodicTimeInterval
 * <br>
 * A Class that models time intervals in the PIVL_TS CDA HL7 datatype
 * <p>
 * Definition: An interval of time that recurs periodically. Periodic intervals have two
 * properties, phase and period. The phase specifies the "interval prototype" that is repeated
 * every period.
 *
 * <p>
 * Note 3 - Alignment
 * <br>
 * Specifies if and how the repetitions are aligned to the cycles of the underlying calendar
 * (e.g., to distinguish every 30 days from "the 5th of every month".) A non-aligned periodic
 * interval recurs independently from the calendar. An aligned periodic interval is
 * synchronized with the calendar.
 * <p>
 * <p>
 * <p>
 * <p>
 * Note 5 - phase
 * <Br>
 * A prototype of the repeating interval specifying the duration of each occurrence and
 * anchors the periodic interval sequence at a certain point in time.
 *
 * <p>
 * Note 6 - period
 * <br>
 * A time duration specifying as a reciprocal measure of the frequency at which the periodic
 * interval repeats.
 *
 * <p>
 * Note 7 - frequency
 * <br>
 * The inverse of period, but allows to specify a number of repeats in a time unit using a
 * ratio.
 *
 * @author NeHTA
 * @see CalendarCycleCode
 * @see RestrictedTimeInterval (IVL_TS)
 * @see SetComponentTime (SXCM_TS)
 */
public class PeriodicIntervalTime extends SetComponentTime {

    private CalendarCycleCode cycleAlignment;
    private Double period;
    private RestrictedTimeInterval phase;
    private TimeQuantity frequency; //the numerator of the frequency
    private Integer denominator;

    public CalendarCycleCode getCycleAlignment() {
        return cycleAlignment;
    }

    /**
     * Set a time interval using the frequency method.
     *
     * @param frequency A time quantity with a unit and width, optionally with a narrative.
     *                  NOTE: a frequency narrative will override the periodic time interval narrative
     */
    public PeriodicIntervalTime(TimeQuantity frequency) {
        this.frequency = frequency;
        if (frequency.getNarrative() != null) this.setNarrative(frequency.getNarrative());
    }

    /**
     * Set a time interval using the frequency method.
     *
     * @param frequency A time quantity with a unit and width, optionally with a narrative.
     *                  NOTE: a frequency narrative will override the periodic time interval narrative
     */
    public PeriodicIntervalTime(TimeQuantity frequency, int denominator) {
        this.frequency = frequency;
        this.denominator = denominator;
        if (frequency.getNarrative() != null) this.setNarrative(frequency.getNarrative());
    }

    public PeriodicIntervalTime(RestrictedTimeInterval phase) {
        this.phase = phase;
    }

    public PeriodicIntervalTime(double period, CalendarCycleCode cycleAlignment) {
        this.cycleAlignment = cycleAlignment;
        this.period = period;
    }

    public PeriodicIntervalTime(double period, CalendarCycleCode cycleAlignment, RestrictedTimeInterval phase) {
        this.cycleAlignment = cycleAlignment;
        this.period = period;
        this.phase = phase;
    }

    public RestrictedTimeInterval getPhase() {
        return phase;
    }

    public void setPhase(RestrictedTimeInterval phase) {
        this.phase = phase;
    }

    public void setCycleAlignment(CalendarCycleCode cycleAlignment) {
        this.cycleAlignment = cycleAlignment;
    }

    public Double getPeriod() {
        return period;
    }

    public void setPeriod(Double period) {
        this.period = period;
    }

    public TimeQuantity getFrequency() {
        return frequency;
    }

    public void setFrequency(TimeQuantity frequency) {
        this.frequency = frequency;
    }

    public void setDenominator(int denominator) {
        this.denominator = denominator;
    }

    public Integer getDenominator() {
        return denominator;
    }
}

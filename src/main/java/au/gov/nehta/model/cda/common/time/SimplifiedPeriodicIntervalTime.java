package au.gov.nehta.model.cda.common.time;


/**
 * 
 * A simplified version of PeriodicIntervalTime that encodes only a period with a value<br>
 * 
 * <pre>
 * eg: 
 * <effectiveTime xsi:type="PIVL_TS">
 *                   <period value="8" unit="wk" />
 * </effectiveTime>
 *  
 * </pre>
 * 
 * 
 * @author NeHTA
 * @see {@link PeriodicIntervalTime}, {@link TimeQuantity},  {@link SetComponentTime}
 */
public class SimplifiedPeriodicIntervalTime extends SetComponentTime {

    //time quantity captures the same information.
    //by shadowing this type we can use the SimplifiedPeriodicIntervalTime to render 
    //as a period instead of a width
    private TimeQuantity time;
    
    /**
     * A period based time value, for example 8 weeks
     * 
     * SimplifiedPeriodicIntervalTime periodicTime = new SimplifiedPeriodicIntervalTime(8,"wk"); 
     * 
     * @param period an integer value specifyng the number of units
     * @param unit the unit of time
     */
    public SimplifiedPeriodicIntervalTime(int period, TimeUnitOfMeasure unit){
        if(unit == null){
            throw new IllegalArgumentException("Time unit must be supplied for a SimplifiedPeriodicIntervalTime");
        }
        
        time= new TimeQuantity( period, unit );
    }
    
    /**
     * An alternative constructor that allows you to include a custom narrative <br />
     * example:
     * 
     * <pre>
     * TimeQuantity qty = new TimeQuantity(8, TimeUnitOfMeasure.WEEK)
     * qty.setNarrative(" 8 weeks ");
     * SimplifiedPeriodicIntervalTime drugSupplyPeriod =  new SimplifiedPeriodicIntervalTime(qty);
     * </pre>
     *
     *
     *
     * @param period an integer value specifyng the number of units
     * @param unit the unit of time
     */
    public SimplifiedPeriodicIntervalTime(TimeQuantity quantity){
        time= quantity;
    }

    public String getPeriod() {
        return time.getValue();
    }

    
    public String getUnit() {
        return time.getUnit();
    }

    public String getNarrative(){
        return time.getNarrative();
    }
    
    public void setNarrative(String narrative){
        if(time!= null){
            time.setNarrative( narrative );
        }
    }
}

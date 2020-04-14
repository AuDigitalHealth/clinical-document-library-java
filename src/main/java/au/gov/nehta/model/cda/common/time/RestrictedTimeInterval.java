/*
 * Copyright 2011 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package au.gov.nehta.model.cda.common.time;


/**
 * This class models the Time interval IVL_TS HL7 class the creation is restricted to only allow
 * valid combinations of dates
 *
 * <pre>
 *  example:
 *
 *  //a new day with today's date, ignoring hours minutes and seconds
 *  PrecisionDate high = new PrescisionDate(Precision.day);
 *  RestrictedTimeInterval = RestrictedTimeInterval.getHighInstance(high);
 *
 * </pre>
 *
 * The following combinations are allowed via the schema: [{low}, {width}, {high}, {center}, {low,
 * width}, {width, high}, {low, high}, {center, width}]
 */
public class RestrictedTimeInterval extends SetComponentTime {


  private PreciseDate high;
  private PreciseDate low;
  private PreciseDate center;
  private TimeQuantity width;

  public RestrictedTimeInterval() {
  }

  public static RestrictedTimeInterval getLowInstance(PreciseDate low) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.low = low;
    return t;
  }


  public static RestrictedTimeInterval getWidthInstance(TimeQuantity width) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.width = width;
    return t;
  }


  public static RestrictedTimeInterval getHighInstance(PreciseDate high) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.high = high;
    return t;
  }

  public static RestrictedTimeInterval getCenterInstance(PreciseDate center) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.center = center;
    return t;
  }

  public static RestrictedTimeInterval getLowWidthInstance(PreciseDate low, TimeQuantity width) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.low = low;
    t.width = width;
    return t;
  }


  public static RestrictedTimeInterval getLowHighInstance(PreciseDate low, PreciseDate high) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.low = low;
    t.high = high;
    return t;
  }

  public static RestrictedTimeInterval getLowHighInstance(PreciseDate low, PreciseDate high,
      TimeQuantity width) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.low = low;
    t.high = high;
    t.width = width;
    return t;
  }

  public static RestrictedTimeInterval getHighWidthInstance(PreciseDate high, TimeQuantity width) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.width = width;
    t.high = high;
    return t;
  }

  public static RestrictedTimeInterval getCenterWidthInstance(PreciseDate center,
      TimeQuantity width) {
    RestrictedTimeInterval t = new RestrictedTimeInterval();
    t.center = center;
    t.width = width;
    return t;
  }


  public PreciseDate getHigh() {
    return high;
  }


  public void setHigh(PreciseDate high) {
    this.high = high;
  }


  public PreciseDate getLow() {
    return low;
  }


  public void setLow(PreciseDate low) {
    this.low = low;
  }


  public PreciseDate getCenter() {
    return center;
  }


  public void setCenter(PreciseDate center) {
    this.center = center;
  }


  public TimeQuantity getWidth() {
    return width;
  }


  public void setWidth(TimeQuantity width) {
    this.width = width;
  }

}



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

package au.gov.nehta.model.cda.common.telecom;

import java.util.regex.Pattern;

import au.gov.nehta.common.utils.ArgumentUtils;

public class TelecomImpl implements Telecom {
	private TelecomMedium medium;
	private String value;
	private TelecomUse use;
	private static final Pattern p = Pattern.compile( "\\D" );
	
	
	public TelecomImpl( TelecomMedium medium, String communicationvalue,TelecomUse usageCode ) {
		ArgumentUtils.checkNotNull( medium, "Telecom medium" );
		ArgumentUtils.checkNotNull( communicationvalue, "Telecom  value" );
		ArgumentUtils.checkNotNull( usageCode, "Telecom  use" );
		
		
		//check that telephone numbers contain only digits
		// 22/01 Removed this check as not required
		//if(TelecomMedium.TELEPHONE.equals( medium )){
		//    if(p.matcher( communicationvalue ).find() ){
		//        throw new IllegalArgumentException( "Telephone '"+communicationvalue+"' contains a non digit character " );
		//    }
		//}
		
		this.medium = medium;
		this.value = communicationvalue;
		this.use = usageCode;
	}
	

	/**
	 * A convenience constructor that defaults to Medium type of TelecomMedium.Telephone
	 * @param value
	 * @param use
	 */
    public TelecomImpl( String value,TelecomUse use ) {
        this(TelecomMedium.TELEPHONE, value, use);
    }
    
    /**
     * A convenience constructor that defaults to Medium type of TelecomMedium.Telephone and a TelecomUse.Business
     */
    public TelecomImpl( String value  ) {
        this(TelecomMedium.TELEPHONE, value, TelecomUse.BUSINESS);
    }
    
    /**
     * A convenience constructor that defaults to a TelecomUse.Business
     * @param value
     * @param use
     */
    public TelecomImpl( TelecomMedium medium, String value  ) {
        this(medium, value, TelecomUse.BUSINESS);
    }
    
    /**
      * A convenience constructor that defaults to Medium type of TelecomMedium.Telephone and a TelecomUse.Business
     */
    public static TelecomImpl phone(String value){
    	return new TelecomImpl(TelecomMedium.TELEPHONE, value, TelecomUse.BUSINESS);
    }
    
    
    /**
      * A convenience constructor that defaults to Medium type of TelecomMedium.Fax and a TelecomUse.Business
     */
    public static TelecomImpl fax(String value){
    	return new TelecomImpl(TelecomMedium.FAX, value, TelecomUse.BUSINESS);
    }

	public TelecomMedium getTelecomMedium() {
		return medium;
	}

	public String getTelecomValue() {
		return value;
	}

	public TelecomUse getTelecomUse() {
		return use;
	}

	public void setTelecomUse( TelecomUse electronicCommunicationUsageCode ) {
		this.use = electronicCommunicationUsageCode;
	}

  
}

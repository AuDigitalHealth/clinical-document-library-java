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

package au.gov.nehta.model.cda.npdr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItemImpl;

public class PCEHRPrescriptionItemImpl  extends  PrescriptionItemImpl implements PCEHRPrescriptionItem {

    private Coded productFormCode;
    private String genericName; 
    private String theraputicGoodStrength;
    private String qtyDesc;
    
    @Override
    public String getGenericName() {
        return genericName;
    }
    

    @Override
    public Coded getProductFormCode() {
        return productFormCode;
    }
    
    @Override
    public String getQuantityDescription() {
        return qtyDesc;
    }
    
    @Override
    public String getTheraputicGoodStrength() {
        return theraputicGoodStrength;
    }

    public void setQuantityDescription( String qtyDesc ) {
        this.qtyDesc=qtyDesc;
    }
    

    public void setProductFormCode( Coded productFormCode ) {
        this.productFormCode = productFormCode;
    }


    public void setGenericName( String genericName ) {
      this.genericName=genericName;
    }

    


    public void setTheraputicGoodStrength( String theraputicGoodStrength ) {
        this.theraputicGoodStrength = theraputicGoodStrength;
    }


    

}

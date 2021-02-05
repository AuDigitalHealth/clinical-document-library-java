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

package au.gov.nehta.model.clinical.etp.eprescription;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.common.time.SimplifiedPeriodicIntervalTime;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.*;

import java.time.ZonedDateTime;
import java.util.List;

public interface PrescriptionItem {

    ZonedDateTime getDateTimePrescriptionWritten();

    ZonedDateTime getDateTimePrescriptionExpires();

    PrescriptionItemIdentifier getPrescriptionItemIdentifier();

    Coded getPbsRpbsItemCode();

    String getFormula();

    Dosage getDosage();

    String getDirections();

    QuantityUnitDescription getDispenseQuantity();

    UniqueIdentifier getDispensItemIdentifier();

    Boolean getBrandSubstituteAllowed();

    Integer getMaximumNumberOfRepeats();

    SimplifiedPeriodicIntervalTime getMinimumIntervalBetweenRepeats();

    MedicalBenefitCategoryType getMedicalBenefitCategoryType();

    GroundsForConcurrentSupply getGroundsForConcurrentSupply();

    UniqueIdentifier getStateAuthorityNumber();

    String getReasonForTherapeuticGood();

    String getAdditionalComments();

    String getTimingDescription();

    Boolean getPRN();

    List<SetComponentTime> getStructuredTime();

    PreciseDate getStartCriterion();

    PreciseDate getStopCriterion();

    Boolean isLongTerm();

    Code getMethodCode();

    Code getRouteCode();

    Code getApproachSiteCode();

    UniqueIdentifier getCloseTheGapBenifitId();

    UniqueIdentifier getPbsAuthorityApprovalNumber();

    UniqueIdentifier getPbsRpbsManufacturerCode();

    UniqueIdentifier getPbsAuthorityPrescriptionNumber();

    UniqueIdentifier getStreamlinedAuthorityApprovalNumber();

    PBSPrescriptionTypeCode getPbsType();

    UniqueIdentifier getMedicationInstructionIdentifier();

    boolean isRequestItem();

    List<Ingredient> getExtemporaneousIngredients();

    /**
     void setPbsAuthorityPrescriptionNumber(UniqueIdentifier number);
     void setStreamlinedAuthorityApprovalNumber(UniqueIdentifier number);
     void setPbsAuthorityApprovalNumber(UniqueIdentifier pbsAan);
     void setPbsRpbsManufacturerCode( UniqueIdentifier pbsRpbsManufacturerCode );


     void setCloseTheGapBenefitId(UniqueIdentifier ctgBenefitID);
     void setDispenseQuantity(DispenseQuantity quantity);
     void setDispensItemIdentifier(UniqueIdentifier dispensItemIdentifier);

     void setMethodCode(Code code);
     void setRouteCode(Code code);
     void setApproachSiteCode(Code code);

     void setLongTerm(Boolean longTerm);

     void setFormula( String formula );

     void setDosage( Dosage dosage );

     void setDirections( String instructionsForUse );

     void setMinimumIntervalBetweenRepeats( TimeQuantity timeInterval );

     void setStateAuthorityNumber( UniqueIdentifier stateAuthorityNumber );

     void setReasonForTherapeuticGood( String reasonForTherapeuticGood );

     void setAdditionalComments( String additionalComments );

     void setTimingDescription(String timingDescripition );

     void setPRN(Boolean prn);

     void setStartCriterion(PrecisionDate start);
     void addExtemporaneousIngredient( Ingredient extemporaneousIngredient );
     void setStopCriterion(PrecisionDate stop);
     **/
}

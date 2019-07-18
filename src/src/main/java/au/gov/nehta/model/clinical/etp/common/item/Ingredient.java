package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.clinical.common.types.Ratio;

public class Ingredient {

    private Code ingredientCode;
    private Ratio quantity;
    
    public Ingredient() {}
    
    public Ingredient(Code ingredient, Ratio quantity) {
        this.ingredientCode=ingredient;
        this.quantity=quantity;
    }
    /**
     * @return the ingredientCode
     */
    public Code getIngredientCode() {
        return ingredientCode;
    }
    /**
     * @param ingredientCode the ingredientCode to set
     */
    public void setIngredientCode( Code ingredientCode ) {
        this.ingredientCode = ingredientCode;
    }
    /**
     * @return the quantity
     */
    public Ratio getQuantity() {
        return quantity;
    }
    /**
     * @param quantity the quantity to set
     */
    public void setQuantity( Ratio quantity ) {
        this.quantity = quantity;
    }
    
    
}

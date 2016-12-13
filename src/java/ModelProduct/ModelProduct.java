/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelProduct;

/**
 *
 * @author nhatduthan2405
 */
public class ModelProduct {
   
    private String generalInfo;
    private String productID;
    private float price;
    private int modelID;
    
    public ModelProduct(){
        
    }
    public ModelProduct(int modelID, String productID, String Processor, String Memory, String Graphics, String generalInfo, String BonusInfo, float price){
        this.modelID = modelID;
        this.productID = productID;
       
        this.generalInfo = generalInfo;
        
        this.price = price;
    }
    public ModelProduct(String productID, String generalInfo, float price){
        
        this.productID = productID;
       
        this.generalInfo = generalInfo;
        
        this.price = price;
    }

    public ModelProduct(int modelID, String productID, String generalInfo, float price){
        
        this.productID = productID;
       
        this.generalInfo = generalInfo;
        
        this.price = price;
        this.modelID = modelID;
    }
    /**
     * @return the productID
     */
    public String getProductID() {
        return productID;
    }

    /**
     * @param productID the productID to set
     */
    public void setProductID(String productID) {
        this.productID = productID;
    }

    /**
     * @return the Processor
     */
   
    /**
     * @return the generalInfo
     */
    public String getGeneralInfo() {
        return generalInfo;
    }

    /**
     * @param generalInfo the generalInfo to set
     */
    public void setGeneralInfo(String generalInfo) {
        this.generalInfo = generalInfo;
    }

    /**
     * @return the BonusInfo
     */
    
    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the modelID
     */
    public int getModelID() {
        return modelID;
    }

    /**
     * @param modelID the modelID to set
     */
    public void setModelID(int modelID) {
        this.modelID = modelID;
    }
    
}

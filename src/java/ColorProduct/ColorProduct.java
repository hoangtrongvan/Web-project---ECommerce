/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ColorProduct;

/**
 *
 * @author nhatduthan2405
 */
public class ColorProduct {
    
    private String prodID;
    private String color;
    private String colorProd_url;
    private String colordot_img;
    public ColorProduct(){
        
    }
    public ColorProduct(String prodID, String color, String colorProd_url){
        
        this.prodID = prodID;
        this.color = color;
        this.colorProd_url = colorProd_url;
    }
    public ColorProduct(String prodID, String color){
        
        this.prodID = prodID;
        this.color = color;
        
        
    }

    /**
     * @return the prodID
     */
    public String getProdID() {
        return prodID;
    }

    /**
     * @param prodID the prodID to set
     */
    public void setProdID(String prodID) {
        this.prodID = prodID;
    }

    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }

    /**
     * @return the colorProd_url
     */
    public String getColorProd_url() {
        return colorProd_url;
    }

    /**
     * @param colorProd_url the colorProd_url to set
     */
    public void setColorProd_url(String colorProd_url) {
        this.colorProd_url = colorProd_url;
    }

    /**
     * @return the colordot_img
     */
    public String getColordot_img() {
        return colordot_img;
    }

    /**
     * @param colordot_img the colordot_img to set
     */
    public void setColordot_img(String colordot_img) {
        this.colordot_img = colordot_img;
    }
    
}

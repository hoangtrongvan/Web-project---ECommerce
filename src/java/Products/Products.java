/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

/**
 *
 * @author nhatduthan2405
 */
public class Products {
    private String name;
    private double price;
    private int amount;
    private String img_url;
    private String productID;
    private String aaa;

    /**
     * @return the name
     */
    public Products(String name, double price, int amount, String img_url, String productID){
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.img_url = img_url;
        this.productID = productID;
    }
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the amount
     */
    public int getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(int amount) {
        this.amount = amount;
    }

    /**
     * @return the img_url
     */
    public String getImg_url() {
        return img_url;
    }

    /**
     * @param img_url the img_url to set
     */
    public void setImg_url(String img_url) {
        this.img_url = img_url;
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
    
}

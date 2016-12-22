/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

import ColorProduct.ColorProduct;
import ModelProduct.ModelProduct;
import java.util.ArrayList;

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
    private String ava_url;
    private String Brief_Desc;
    private String desc1;
    private String desc2;
    private String img_desc1;
    private String img_desc2;
    private String Category;
    private String large_img_url;
    private String small_icon_url;
    private String caption;
    private String description;
    private ArrayList<ColorProduct> allColorsofProduct;
    private ArrayList<ModelProduct> allModelsofProduct;
    private double total;

    /**
     * @return the name
     */
    public Products(){
        
    }
   
    public Products(String name, String caption, String large_img_url, String productID, String small_icon_url){
        this.name = name;
        this.caption = caption;
        this.large_img_url = large_img_url;
        this.productID = productID;
        this.small_icon_url = small_icon_url;
    }
    public Products(String name, double price, int amount, String img_url, String productID, String description){
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.img_url = img_url;
        this.productID = productID;
        this.description = description;
        
    }
    
    public Products(String productID, String name, double price, int amount, double total){
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.total = total;
    }
    public Products(String productID, String ava_url, String Category, String name){
        this.productID = productID;
        this.ava_url = ava_url;
        this.Category = Category;
        this.name = name;
    }
    
    public Products(String name, String caption, String img_desc1, String img_desc2, String productID, String desc1, String desc2){
        this.name = name;
        this.caption = caption;
        this.desc1 = desc1;
        this.desc2 = desc2;
        this.img_desc1 = img_desc1;
        this.img_desc2 = img_desc2;
        this.productID = productID;
    }
    public Products(String productID, String name, String ava_url, String Brief_Desc, String desc1, String desc2, String img_desc1, String img_desc2, String large_img_url, String Category, String small_icon_url, String Caption){
        this.productID = productID;
        this.name = name;
        this.ava_url = ava_url;
        this.Brief_Desc = Brief_Desc;
        this.desc1 = desc1;
        this.desc2 = desc2;
        this.img_desc1 = img_desc1;
        this.img_desc2 = img_desc2;
        this.large_img_url = large_img_url;
        this.Category = Category;
        this.small_icon_url = small_icon_url;
        this.caption = Caption;
    }
    
     public Products(String productID, String name, String Brief_Desc, String desc1, String desc2, String Caption){
        this.productID = productID;
        this.name = name;
        
        this.Brief_Desc = Brief_Desc;
        this.desc1 = desc1;
        this.desc2 = desc2;
        
        
        this.caption = Caption;
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



    /**
     * @return the Brief_Desc
     */
    public String getBrief_Desc() {
        return Brief_Desc;
    }

    /**
     * @param Brief_Desc the Brief_Desc to set
     */
    public void setBrief_Desc(String Brief_Desc) {
        this.Brief_Desc = Brief_Desc;
    }

    /**
     * @return the desc1
     */
    public String getDesc1() {
        return desc1;
    }

    /**
     * @param desc1 the desc1 to set
     */
    public void setDesc1(String desc1) {
        this.desc1 = desc1;
    }

    /**
     * @return the desc2
     */
    public String getDesc2() {
        return desc2;
    }

    /**
     * @param desc2 the desc2 to set
     */
    public void setDesc2(String desc2) {
        this.desc2 = desc2;
    }

    /**
     * @return the Category
     */
    public String getCategory() {
        return Category;
    }

    /**
     * @param Category the Category to set
     */
    public void setCategory(String Category) {
        this.Category = Category;
    }

    /**
     * @return the larg_img_url
     */
   

    /**
     * @return the ava_url
     */
    public String getAva_url() {
        return ava_url;
    }

    /**
     * @param ava_url the ava_url to set
     */
    public void setAva_url(String ava_url) {
        this.ava_url = ava_url;
    }

    /**
     * @return the img_desc1
     */
    public String getImg_desc1() {
        return img_desc1;
    }

    /**
     * @param img_desc1 the img_desc1 to set
     */
    public void setImg_desc1(String img_desc1) {
        this.img_desc1 = img_desc1;
    }

    /**
     * @return the img_desc2
     */
    public String getImg_desc2() {
        return img_desc2;
    }

    /**
     * @param img_desc2 the img_desc2 to set
     */
    public void setImg_desc2(String img_desc2) {
        this.img_desc2 = img_desc2;
    }

    /**
     * @return the large_img_url
     */
    public String getLarge_img_url() {
        return large_img_url;
    }

    /**
     * @param large_img_url the large_img_url to set
     */
    public void setLarge_img_url(String large_img_url) {
        this.large_img_url = large_img_url;
    }

    /**
     * @return the small_icon_url
     */
    public String getSmall_icon_url() {
        return small_icon_url;
    }

    /**
     * @param small_icon_url the small_icon_url to set
     */
    public void setSmall_icon_url(String small_icon_url) {
        this.small_icon_url = small_icon_url;
    }

    /**
     * @return the caption
     */
    public String getCaption() {
        return caption;
    }

    /**
     * @param caption the caption to set
     */
    public void setCaption(String caption) {
        this.caption = caption;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
}

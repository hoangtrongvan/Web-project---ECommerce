/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Category;

/**
 *
 * @author nhatduthan2405
 */
public class Category {
    private int CategoryID;
    private String Category;
    public Category(){
        
    }
    
    public Category(String Category){
        this.Category = Category;
    }

    /**
     * @return the CategoryID
     */
    public int getCategoryID() {
        return CategoryID;
    }

    /**
     * @param CategoryID the CategoryID to set
     */
    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
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
    
}

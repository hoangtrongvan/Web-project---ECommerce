/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Color;

/**
 *
 * @author nhatduthan2405
 */
public class Color {
    
    private int ColorID;
    private String name;
    private String color_img;
    
    public Color(){
        
    }
    public Color(int ColorID, String name, String color_img){
        
        this.color_img = color_img;
        this.ColorID = ColorID;
        this.name = name;
    }
    
 

    /**
     * @return the ColorID
     */
    public int getColorID() {
        return ColorID;
    }

    /**
     * @param ColorID the ColorID to set
     */
    public void setColorID(int ColorID) {
        this.ColorID = ColorID;
    }

    /**
     * @return the name
     */
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
     * @return the color_img
     */
    public String getColor_img() {
        return color_img;
    }

    /**
     * @param color_img the color_img to set
     */
    public void setColor_img(String color_img) {
        this.color_img = color_img;
    }
}

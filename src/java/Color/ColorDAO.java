/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Color;


import com.javadb.lib.MySqlConnectionManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author nhatduthan2405
 */
public class ColorDAO {
    public ColorDAO(){
        
    }
     public  ArrayList<Color> getallColors(){
        ArrayList<Color> allColors = new ArrayList<>();
        Color color = new Color();
         MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM color";
                 ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
         try {
            while(rs.next()){
                    color = new Color(rs.getInt("ColorID"),rs.getString("Name"),rs.getString("Color_img"));
                    allColors.add(color);
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
        return allColors;
    }
     
     public String getURLColorByName(String colorName) throws SQLException{
          MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM color WHERE Name = ? ";
                 PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                 preparedStmt.setString(1, colorName);
                 ResultSet rs = preparedStmt.executeQuery();
                 String url="";
         try {
            while(rs.next()){
            
                
                  url =  rs.getString("Color_img");
                    
                    
              
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
     }
         sqlConnectionManager.closeConnection();
         return url;
     }
    
}

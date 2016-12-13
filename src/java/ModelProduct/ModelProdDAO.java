/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelProduct;

import Products.productServlet;
import com.javadb.lib.MySqlConnectionManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nhatduthan2405
 */
public class ModelProdDAO {
    
    public ModelProdDAO(){
        
    }
    
    public void addModelProd(ModelProduct modelProd){
        /* Update ava of User in database */
       MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="INSERT INTO productmodel (ProductID, GeneralInfo, Price)" +
                   "VALUES (?,?,?)";;
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, modelProd.getProductID());
                         
                          preparedStmt.setString(2, modelProd.getGeneralInfo());
                          
                          preparedStmt.setFloat(3, modelProd.getPrice());
                          
                
                          preparedStmt.execute();
            }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                 sqlConnectionManager.closeConnection();
    }
    
    public ModelProduct getModelByID(int modelID) throws SQLException{
         
        ModelProduct modelProd = new ModelProduct();
          /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM productmodel WHERE ModelID = ? ";
                 PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                 preparedStmt.setInt(1, modelID);
                 ResultSet rs = preparedStmt.executeQuery();
                 
         try {
            while(rs.next()){
            
                
                    modelProd = new ModelProduct(rs.getInt("ModelID"), rs.getString("ProductID"), rs.getString("GeneralInfo"),rs.getFloat("Price"));
                    
                    
                    
              
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
        return modelProd;
    }
    
    public void removeModelProd(String productID){
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="DELETE FROM productmodel " +
                   "WHERE ProductID=?";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString (1, productID);
                          
                
                          preparedStmt.execute();
        
                 } catch (SQLException ex) {
                Logger.getLogger(productServlet.class.getName()).log(Level.SEVERE, null, ex);
            }     

        sqlConnectionManager.closeConnection();
    }
}

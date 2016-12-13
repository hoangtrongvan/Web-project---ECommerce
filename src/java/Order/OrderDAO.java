/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Order;


import Products.Products;
import com.javadb.lib.MySqlConnectionManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nhatduthan2405
 */
public class OrderDAO {
    
    public void insertOrder(String userName, ArrayList<Products> cart,Date date){
        
    }
    
    public ArrayList<Order> getAllOrders(){
        ArrayList<Order> allOrders = new ArrayList();
        Order order = new Order();
          /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM orderpineapple";
                 ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
         try {
            while(rs.next()){
            
                
                    order = new Order(rs.getString("ProductID"),rs.getString("Date"),rs.getString("Time"),Integer.parseInt(rs.getString("Quantity")),rs.getString("Customer"),rs.getInt("OrderID"), rs.getString("ProductName"));
                    allOrders.add(order);
                    
                    
              
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
        return allOrders;
        
     
    }
    
    public void updateOrderQuantity(int orderID, int newQuantity) throws SQLException{
          MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="UPDATE orderpineapple " +
                   "SET Quantity = ? WHERE OrderID=?";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setInt (1, newQuantity);
                          preparedStmt.setInt(2, orderID);
                
                          preparedStmt.execute();
        
                 } catch (SQLException ex) {
                Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }     

        sqlConnectionManager.closeConnection();
        
    }
    
    public void removeOrder(int orderID){
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="DELETE FROM orderpineapple " +
                   "WHERE OrderID=?";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setInt (1, orderID);
                          
                
                          preparedStmt.execute();
        
                 } catch (SQLException ex) {
                Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }     

        sqlConnectionManager.closeConnection();
    }

}    


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer;

import Order.Order;
import Order.orderServlet;
import com.javadb.lib.MySqlConnectionManager;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;
import javax.servlet.http.Part;
import java.io.*;

/**
 *
 * @author nhatduthan2405
 */
public class UserDAO {
    public UserDAO(){
        
    }
     public User getUser(String uEmail){
         User user = new User();
          /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM useraccount";
                 ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
         try {
            while(rs.next()){
             if (rs.getString("email").equals(uEmail)) {
                    
                    user = new User(rs.getInt("userID"),rs.getString("first_name"), rs.getString("last_name"), rs.getString("birthday"), rs.getString("phone_number"), rs.getString("address"), rs.getString("email"), Integer.parseInt(rs.getString("isManager")), rs.getString("ava_url"));
                    
              }
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
     return user;
}
     public ArrayList<User> getAllUsers(String isManager) throws SQLException{
        ArrayList<User> allUsers = new ArrayList();
        User user = new User();
          /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM useraccount WHERE isManager = ? ";
                 PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                 preparedStmt.setString(1, isManager);
                 ResultSet rs = preparedStmt.executeQuery();
                 
         try {
            while(rs.next()){
            
                
                    user = new User(rs.getInt("userID"),rs.getString("first_name"), rs.getString("last_name"), rs.getString("birthday"), rs.getString("phone_number"), rs.getString("address"), rs.getString("email"), Integer.parseInt(rs.getString("isManager")), rs.getString("ava_url"));
                    allUsers.add(user);
                    
                    
              
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
        return allUsers;
        
     
    }
     public void removeUser(String uEmail){
          MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="DELETE FROM useraccount " +
                   "WHERE email = ? ";
                 String sqlStatement2 = "DELETE FROM orderpineapple " +
                   "WHERE Customer = ? ";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, uEmail);
                          
                         
                          
                
                          preparedStmt.execute();
                          PreparedStatement preparedStmt2 = sqlConnectionManager.getConnection().prepareStatement(sqlStatement2);
                          preparedStmt2.setString(1, uEmail);
                          
                         
                          
                
                          preparedStmt2.execute();
            }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                 sqlConnectionManager.closeConnection();
         
     }
     public void updateUserInfo(String first_name, String last_name, String dob, String phone_number, String address, String email) throws SQLException{
          MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="UPDATE useraccount " +
                   "SET first_name = ?, last_name = ?, birthday = ?, phone_number = ?, address = ? WHERE email = ? ";
                  
                 
       
           
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, first_name);
                          preparedStmt.setString(2, last_name);
                          preparedStmt.setString(3, dob);
                          preparedStmt.setString(4, phone_number);
                          preparedStmt.setString(5, address);
                          preparedStmt.setString(6, email);
                          
                          
                
                          preparedStmt.execute();
        
                 sqlConnectionManager.closeConnection();
            }

       public boolean checkPassword(String uEmail, String pass) throws SQLException{
                /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM useraccount WHERE email = ? ";
                 PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, uEmail);
                ResultSet rs = preparedStmt.executeQuery();
                while (rs.next()){
                    if (rs.getString("password").equals(pass))
                        return true;
                }
                          
                          
        sqlConnectionManager.closeConnection();
                     
                            return false;
       
       }
       
       public void updatePassword(String uEmail, String newPass) throws SQLException{
           MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="UPDATE useraccount " +
                   "SET password = ? WHERE email = ? ";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, newPass);
                          preparedStmt.setString(2, uEmail);
                         
                          
                
                          preparedStmt.execute();
            }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                 sqlConnectionManager.closeConnection();
       }
       
       public void changeAvatar(User loginUser, Part filePart, String path) throws IOException{
            
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = getFileExtension(fileName);
           
            int loginUserID = loginUser.getUid();
            String newFileName = Integer.toString(loginUserID) + "." + fileExtension;

            OutputStream out = null;
            InputStream filecontent = null;
            String imgPath = "";

    try {
        out = new FileOutputStream(new File(path + File.separator
                + newFileName));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        
        LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", 
                new Object[]{fileName, path});
        
       
        imgPath = "../avatars" + "/" +  newFileName.toLowerCase();
       
    } catch (FileNotFoundException fne) {
      

        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
                new Object[]{fne.getMessage()});
    } finally {
        if (out != null) {
            out.close();
        }
        if (filecontent != null) {
            filecontent.close();
        }
       
    }
        
       
       /* Update ava of User in database */
       MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="UPDATE useraccount " +
                   "SET ava_url = ? WHERE userID = ? ";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, imgPath);
                          preparedStmt.setInt(2, loginUserID);
                         
                          
                
                          preparedStmt.execute();
            }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                 sqlConnectionManager.closeConnection();
       }
       
       

       
    private String getFileExtension(String fileName) {
   
        try {
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        } catch (Exception e) {
        return "";
        }
    }
    
    public void setManager(int uid){
         MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="UPDATE useraccount " +
                   "SET isManager = '1' WHERE UserID = ? ";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setInt(1, uid);
                          
                         
                          
                
                          preparedStmt.execute();
            }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                 sqlConnectionManager.closeConnection();
    }
    
     public void removeManager(int uid){
         MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="UPDATE useraccount " +
                   "SET isManager = '0' WHERE UserID = ? ";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setInt(1, uid);
                          
                         
                          
                
                          preparedStmt.execute();
            }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                 sqlConnectionManager.closeConnection();
    }


        
     

}
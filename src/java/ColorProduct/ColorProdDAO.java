/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ColorProduct;

import Customer.User;
import Products.productServlet;
import com.javadb.lib.MySqlConnectionManager;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/**
 *
 * @author nhatduthan2405
 */
public class ColorProdDAO {
    public ColorProdDAO(){
        
    }
    public void adddefaultColorProd(ColorProduct colorProduct){
         /* Update ava of User in database */
       MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="INSERT INTO colorproduct (ProductID, Color, colorProduct_url)" +
                   "VALUES (?,?,?)";;
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, colorProduct.getProdID());
                          preparedStmt.setString(2, colorProduct.getColor());
                          preparedStmt.setString(3, colorProduct.getColorProd_url());
                         
                          
                
                          preparedStmt.execute();
            }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                 sqlConnectionManager.closeConnection();
    }
    public void addColorProd(ColorProduct colorProduct, Part filePart, String path) throws IOException{
        
            
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = getFileExtension(fileName);
           
            String prodID = colorProduct.getProdID();
            String color = colorProduct.getColor();
            String newFileName = prodID + color + "." + fileExtension.toLowerCase();

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
        
       
        imgPath = "../colorProducts" + "/" +  newFileName;
       
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
        
                 String sqlStatement ="INSERT INTO colorproduct (ProductID, Color, colorProduct_url)" +
                   "VALUES (?,?,?)";;
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, colorProduct.getProdID());
                          preparedStmt.setString(2, colorProduct.getColor());
                          preparedStmt.setString(3, imgPath);
                         
                          
                
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
      
      public ColorProduct getColorProductByProdID(String color, String prodID) throws SQLException{
           ColorProduct colorProd = new ColorProduct();
          /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM colorproduct WHERE Color = ? AND ProductID = ? ";
                 PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                 preparedStmt.setString(1, color);
                 preparedStmt.setString(2, prodID);
                 ResultSet rs = preparedStmt.executeQuery();
                 
         try {
            while(rs.next()){
            
                
                    colorProd = new ColorProduct(rs.getString("ProductID"), rs.getString("Color"), rs.getString("colorProduct_url"));
                    
                    
                    
              
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
        return colorProd;
      }
      
      public ArrayList<ColorProduct> getallColorProdByProdID(String prodID) throws SQLException{
          ArrayList<ColorProduct> allColorofProd = new ArrayList();
         ColorProduct colorProduct = new ColorProduct();
          /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM colorproduct WHERE ProductID = ? ";
                 PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                 preparedStmt.setString(1, prodID);
                 ResultSet rs = preparedStmt.executeQuery();
                 
         try {
            while(rs.next()){
            
                
                    colorProduct = new ColorProduct(rs.getString("ProductID"), rs.getString("Color"), rs.getString("colorProduct_url"));
                    allColorofProd.add(colorProduct);
                    
                    
              
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
        return allColorofProd;
      }
      
      public void removeColorProd(String productID){
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="DELETE FROM colorproduct " +
                   "WHERE ProductID=?";
                  
                 
       
            try {
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                          preparedStmt.setString(1, productID);
                          
                
                          preparedStmt.execute();
        
                 } catch (SQLException ex) {
                Logger.getLogger(productServlet.class.getName()).log(Level.SEVERE, null, ex);
            }     

        sqlConnectionManager.closeConnection();
    }
      
   
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

import Color.Color;
import ColorProduct.ColorProdDAO;
import ColorProduct.ColorProduct;
import ModelProduct.ModelProdDAO;
import ModelProduct.ModelProduct;
import Order.Order;
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
public class ProductDAO {

    public ProductDAO() {

    }

    public String getPath(String path) {
        return path.substring(path.indexOf("/"), path.length());
    }

    public void addProduct(Products product) throws IOException {

        /* Update ava of User in database */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "INSERT INTO products (ProductID, avatar, Name, Large_img, img_desc1, img_desc2, Category, Desc1, Desc2, Brief_Desc, Caption, Small_icon_url)"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";;

        try {
            PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
            preparedStmt.setString(1, product.getProductID());
            preparedStmt.setString(2, product.getAva_url());
            preparedStmt.setString(3, product.getName());
            preparedStmt.setString(4, product.getLarge_img_url());
            preparedStmt.setString(5, product.getImg_desc1());
            preparedStmt.setString(6, product.getImg_desc2());
            preparedStmt.setString(7, product.getCategory());
            preparedStmt.setString(8, product.getDesc1());
            preparedStmt.setString(9, product.getDesc2());
            preparedStmt.setString(10, product.getBrief_Desc());
            preparedStmt.setString(11, product.getCaption());
            preparedStmt.setString(12, product.getSmall_icon_url());

            preparedStmt.execute();
        } catch (SQLException ex) {
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

    public void addproductColor(String prodID, String[] color) throws SQLException {
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();
        String sql2 = "INSERT INTO colorproduct (ProductID, Color)"
                + "VALUES (?,?)";
        for (int i = 0; i < color.length; i++) {
            PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sql2);
            preparedStmt.setString(1, prodID);
            preparedStmt.setString(2, color[i]);

            preparedStmt.execute();
        }
        sqlConnectionManager.closeConnection();

    }

    public String addIMG(String newName, Part filePart, String path) throws IOException {

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String fileExtension = getFileExtension(fileName);

        String newFileName = newName + "." + fileExtension.toLowerCase();

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

            imgPath = "../ProductsContainer" + "/" + newFileName;

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
        return imgPath;

    }

    public ArrayList<Products> getAllProductsFromCategory(String cName) throws SQLException {
        ArrayList<Products> allProductsFromCategory = new ArrayList();
        Products product = new Products();
        /* Create MySql Connection */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "SELECT * FROM products WHERE Category = ? ";
        PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
        preparedStmt.setString(1, cName);
        ResultSet rs = preparedStmt.executeQuery();

        try {
            while (rs.next()) {

                product = new Products(rs.getString("ProductID"), rs.getString("Name"), rs.getString("avatar"), rs.getString("Brief_Desc"), rs.getString("Desc1"), rs.getString("Desc2"), rs.getString("img_desc1"), rs.getString("img_desc2"), rs.getString("Large_img"), rs.getString("Category"), rs.getString("Small_icon_url"), rs.getString("Caption"));
                allProductsFromCategory.add(product);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        sqlConnectionManager.closeConnection();
        return allProductsFromCategory;
    }

    public Products getOneProduct(String prodID) throws SQLException {
        Products product = new Products();
        /* Create MySql Connection */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "SELECT * FROM products WHERE ProductID = ? ";
        PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
        preparedStmt.setString(1, prodID);
        ResultSet rs = preparedStmt.executeQuery();

        try {
            while (rs.next()) {

                product = new Products(rs.getString("ProductID"), rs.getString("Name"), rs.getString("avatar"), rs.getString("Brief_Desc"), rs.getString("Desc1"), rs.getString("Desc2"), rs.getString("img_desc1"), rs.getString("img_desc2"), rs.getString("Large_img"), rs.getString("Category"), rs.getString("Small_icon_url"), rs.getString("Caption"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        sqlConnectionManager.closeConnection();
        return product;
    }

    public ArrayList<ColorProduct> getAllColorOfProduct(String prodID) throws SQLException {
        ArrayList<ColorProduct> allColorOfProduct = new ArrayList();
        ColorProduct colorProd = new ColorProduct();
        /* Create MySql Connection */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "SELECT * FROM colorproduct WHERE ProductID = ? ";
        PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
        preparedStmt.setString(1, prodID);
        ResultSet rs = preparedStmt.executeQuery();

        try {
            while (rs.next()) {

                colorProd = new ColorProduct(rs.getString("ProductID"), rs.getString("Color"), rs.getString("colorProduct_url"));
                allColorOfProduct.add(colorProd);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        sqlConnectionManager.closeConnection();
        return allColorOfProduct;
    }

    public ArrayList<ModelProduct> getAllModelOfProduct(String prodID) throws SQLException {
        ArrayList<ModelProduct> allModelOfProduct = new ArrayList();
        ModelProduct modelProd = new ModelProduct();
        /* Create MySql Connection */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "SELECT * FROM productmodel WHERE ProductID = ? ";
        PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
        preparedStmt.setString(1, prodID);
        ResultSet rs = preparedStmt.executeQuery();

        try {
            while (rs.next()) {

                modelProd = new ModelProduct(rs.getInt("ModelID"), rs.getString("ProductID"), rs.getString("GeneralInfo"), rs.getFloat("Price"));
                allModelOfProduct.add(modelProd);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        sqlConnectionManager.closeConnection();
        return allModelOfProduct;
    }
    public String[] displayGeneralInfo(String generalInfo) {
        return generalInfo.split(";");
    }
    public ArrayList<generalDisplay> getAllInfo(String generalInfo) {
        ArrayList<generalDisplay> AllInfo = new ArrayList();
        generalDisplay genDis = new generalDisplay();
        String[] splitDevide = generalInfo.split("|");
        String title = "";
        String[] content = new String[30];
        for(int i = 0;i<splitDevide.length;i++){
            
            title = splitDevide[i].split(":")[0];
            content = splitDevide[i].split(":")[1].split(";");
            genDis = new generalDisplay(title,content);
            AllInfo.add(genDis);
        }
        return AllInfo;
        
    }

    public ArrayList<Products> getAllProducts() {
        ArrayList<Products> allProducts = new ArrayList();
        Products product = new Products();
        /* Create MySql Connection */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "SELECT * FROM products";
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {

                product = new Products(rs.getString("ProductID"), rs.getString("avatar"), rs.getString("Category"), rs.getString("Name"));
                allProducts.add(product);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        sqlConnectionManager.closeConnection();
        return allProducts;

    }

    public void removeProduct(String productID) {
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "DELETE FROM products "
                + "WHERE ProductID=?";

        try {
            PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
            preparedStmt.setString(1, productID);

            preparedStmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(productServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        ModelProdDAO modelprodDAO = new ModelProdDAO();
        modelprodDAO.removeModelProd(productID);
        ColorProdDAO colorprodDAO = new ColorProdDAO();
        colorprodDAO.removeColorProd(productID);
        sqlConnectionManager.closeConnection();
    }

    public ArrayList<Products> getAllRelatedProducts(String searchKeyWord) throws SQLException {
        ArrayList<Products> allRelaredProducts = new ArrayList();
        Products product = new Products();
        String prodID = "";
        /* Create MySql Connection */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();
        String sql1 = "SELECT * FROM products prod WHERE prod.Name LIKE ? "
                + "or prod.ProductID = ? "
                + "or prod.Category = ? ";

        PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sql1);
        preparedStmt.setString(1, "%" + searchKeyWord + "%");
        preparedStmt.setString(2, searchKeyWord);
        preparedStmt.setString(3, searchKeyWord);

        ResultSet rs = preparedStmt.executeQuery();

        String sql2 = "SELECT * FROM products WHERE ProductID = ? ";
        PreparedStatement preparedStmt2 = sqlConnectionManager.getConnection().prepareStatement(sql2);

        String sql3 = "SELECT * FROM colorproduct colorProd WHERE colorProd.Color = ? ";
        PreparedStatement preparedStmt3 = sqlConnectionManager.getConnection().prepareStatement(sql3);
        preparedStmt3.setString(1, searchKeyWord);
        ResultSet rs3 = preparedStmt3.executeQuery();

        String sql4 = "SELECT * FROM productmodel prodModel WHERE prodModel.GeneralInfo LIKE ? ";
        PreparedStatement preparedStmt4 = sqlConnectionManager.getConnection().prepareStatement(sql4);
        preparedStmt4.setString(1, "%" + searchKeyWord + "%");
        ResultSet rs4 = preparedStmt4.executeQuery();

        try {
            while (rs.next()) {

                prodID = rs.getString("ProductID");
                preparedStmt2.setString(1, prodID);
                ResultSet rs2 = preparedStmt2.executeQuery();
                while (rs2.next()) {
                    product = new Products(rs2.getString("ProductID"), rs2.getString("Name"), rs2.getString("avatar"), rs2.getString("Brief_Desc"), rs2.getString("Desc1"), rs2.getString("Desc2"), rs2.getString("img_desc1"), rs2.getString("img_desc2"), rs2.getString("Large_img"), rs2.getString("Category"), rs2.getString("Small_icon_url"), rs2.getString("Caption"));
                    allRelaredProducts.add(product);
                }

            }
            while (rs3.next()) {

                prodID = rs3.getString("ProductID");
                preparedStmt2.setString(1, prodID);
                ResultSet rs2 = preparedStmt2.executeQuery();
                while (rs2.next()) {
                    product = new Products(rs2.getString("ProductID"), rs2.getString("Name"), rs2.getString("avatar"), rs2.getString("Brief_Desc"), rs2.getString("Desc1"), rs2.getString("Desc2"), rs2.getString("img_desc1"), rs2.getString("img_desc2"), rs2.getString("Large_img"), rs2.getString("Category"), rs2.getString("Small_icon_url"), rs2.getString("Caption"));
                    allRelaredProducts.add(product);
                }

            }
            while (rs4.next()) {

                prodID = rs4.getString("ProductID");
                preparedStmt2.setString(1, prodID);
                ResultSet rs2 = preparedStmt2.executeQuery();
                while (rs2.next()) {
                    product = new Products(rs2.getString("ProductID"), rs2.getString("Name"), rs2.getString("avatar"), rs2.getString("Brief_Desc"), rs2.getString("Desc1"), rs2.getString("Desc2"), rs2.getString("img_desc1"), rs2.getString("img_desc2"), rs2.getString("Large_img"), rs2.getString("Category"), rs2.getString("Small_icon_url"), rs2.getString("Caption"));
                    int iCount = 0;
                    for (Products productCheck : allRelaredProducts) {
                        if (productCheck.getProductID().equals(product.getProductID())) {
                            iCount++;
                        }
                    }
                    if (iCount == 0) {
                        allRelaredProducts.add(product);
                    }
                }

            }

            /*  
            PreparedStatement preparedStmt2 = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
                 preparedStmt2.setString(1,prodID);
                 
                 ResultSet rs2 = preparedStmt2.executeQuery();
                 
           while(rs2.next()){
            
                
                    product = new Products(rs2.getString("ProductID"), rs2.getString("Name"), rs2.getString("avatar"), rs2.getString("Brief_Desc"), rs2.getString("Desc1"), rs2.getString("Desc2"), rs2.getString("img_desc1"), rs2.getString("img_desc2"), rs2.getString("Large_img"), rs2.getString("Category"), rs2.getString("Small_icon_url"), rs2.getString("Caption"));
                    allRelaredProducts.add(product); 
                    
                    
              
            }   
             */
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        sqlConnectionManager.closeConnection();
        return allRelaredProducts;
    }

    public void updateProductInfo(String prodID, Products newinfoProduct) throws SQLException {

        String caption = newinfoProduct.getCaption();
        String brief_desc = newinfoProduct.getBrief_Desc();
        String desc1 = newinfoProduct.getDesc1();
        String desc2 = newinfoProduct.getDesc2();

        String prodName = newinfoProduct.getName();
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");

        sqlConnectionManager.openConnection();

        String sqlStatement = "UPDATE products "
                + "SET Name = ?, Brief_Desc = ?, Desc1 = ?, Desc2 = ?, Caption = ? WHERE ProductID = ? ";

        PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sqlStatement);
        preparedStmt.setString(1, prodName);
        preparedStmt.setString(2, brief_desc);
        preparedStmt.setString(3, desc1);
        preparedStmt.setString(4, desc2);
        preparedStmt.setString(5, caption);
        preparedStmt.setString(6, prodID);

        preparedStmt.execute();

        sqlConnectionManager.closeConnection();
    }

}

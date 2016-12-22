/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Category;


import com.javadb.lib.MySqlConnectionManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author nhatduthan2405
 */
public class CategoryDAO {
    public CategoryDAO(){
        
    }
    public ArrayList<Category> getAllCategories(){
        
        ArrayList<Category> allCategories = new ArrayList<>();
        Category category = new Category();
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM category";
                 ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
         try {
            while(rs.next()){
                    category = new Category(rs.getString("Category"));
                    allCategories.add(category);
            }
           
           
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
        return allCategories;
    }
}

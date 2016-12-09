
package Data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * 
 */
public class JDBCConnection {
    private String dbUserName=null;
    private String databaseName=null;
    
    public JDBCConnection() {}
    
    public JDBCConnection(String  dbUserName, String databaseName) {
        this.dbUserName=dbUserName;
        this.databaseName=databaseName;
    }
    
    public void setDbUserName(String dbUserName) {
        this.dbUserName = dbUserName;
    }

    
    public void setDatabase(String databaseName) {
        this.databaseName = databaseName;
    }
    
    private String connectionURL = "jdbc:mysql://localhost:3306/";
    private Connection connection=null;
    private Statement stm=null;
    private ResultSet rs;

    public void getConnection() {
      try {
        Class.forName("com.mysql.jdbc.Driver");

        // 1. Get a connection to database
        connection = DriverManager.getConnection(connectionURL+this.databaseName, this.dbUserName, "password");
        System.out.println("DB Connection successfully");
        // 2. Create a statement
        stm = connection.createStatement();
      } catch (Exception exc) {
        exc.printStackTrace();
      }
    }
    
    public boolean executeUpdate(String command) throws SQLException {
        stm.executeUpdate(command);
        return true;
    }

    public ResultSet executeQuery(String command) throws SQLException {
        rs = stm.executeQuery(command);
        return rs;
    }

    public void close() throws SQLException {
        if (stm != null) {
            stm.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (connection != null) {
            connection.close();
        }

}
}
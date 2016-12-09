/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javadb.lib;

import java.sql.*;
import java.util.*;
import com.mysql.jdbc.Driver;
import java.io.InputStream;


/**
 *
 * @author Mitdacit
 */
public class MySqlConnectionManager {
    //private static String connectionString = "jdbc:mysql://localhost:3306/it?user=root;password=";
    //private static String connectionString = "jdbc:mysql://10.8.52.21/it?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";

    private String ip;
    private String port;
    private String database;
    private String userName;
    private String password;
    private String connectionString;
    private Connection connection;
    public MySqlConnectionManager() {
    }
    
    public Connection getConnection(){
        return this.connection;
    }
    public MySqlConnectionManager(String ip, String port, String database, String userName, String password) {
        this.ip = ip;
        this.port = port;
        this.database = database;
        this.userName = userName;
        this.password = password;

        connectionString = "jdbc:mysql://" + ip + ":" + port + "/" + database + "?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";

    }

    public MySqlConnectionManager(String userName, String password, String connectionString) {
        this.userName = userName;
        this.password = password;
        this.connectionString = connectionString;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConnectionString() {
        return connectionString;
    }

    public void setConnectionString(String connectionString) {
        this.connectionString = connectionString;
    }
    
    
     public void openConnection() {
        String connectionURL = connectionString;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, userName, password);
            
        } catch (Exception ex) {
            Lib4iLogger.log(ex.toString());
        }
    }
     
     public void closeConnection() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Lib4iLogger.log(ex.toString());
        }
     }
     
     
     

    public ResultSet ExecuteQuery(String sql) {
        ResultSet result = null;
        try {
            Statement stmt = connection.createStatement();
            String mysql = sql;

            result = stmt.executeQuery(mysql);
        } catch (Exception ex) {
            Lib4iLogger.log(ex.toString());
        }

        return result;
    }

    public int ExecuteUpdate(String sql) {
        int result = 0;
        try {
          
            Statement stmt = connection.createStatement();

            String mysql = sql;

            result = stmt.executeUpdate(mysql);
        } catch (Exception ex) {
            Lib4iLogger.log(ex.toString());
        }

        return result;
    }

    public int ExecuteUpdateBlob(String sql, InputStream inputStream) {

        int result = 0;
        try {
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setBlob(1, inputStream);
                result = statement.executeUpdate();
            
        } catch (Exception ex) {
            Lib4iLogger.log(ex.toString());
        }
        
        
        return result;
    }

}

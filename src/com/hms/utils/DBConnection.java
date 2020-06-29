package com.hms.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Database Util
 * @author Harish
 */
public class DBConnection {
    private static Connection con;

    private static final String Driver = "com.mysql.jdbc.Driver";
    private static final String ConnectionString = "jdbc:mysql://gp96xszpzlqupw4k.cbetxkdyhwsb.us-east-1.rds.amazonaws.com/ikgk6e5x3n5d30pm";
    private static final String user = "jrfc0k4rzsfbvfvd"; //database username
    private static final String pwd = "drsg5a1ab9yoxtj4"; //database pass

    public static Connection getConnection() throws Exception {        
        Class.forName(Driver);       
        con = DriverManager.getConnection(ConnectionString, user, pwd);
        return con;
    }
    public static void closeConnection() throws Exception {    
    	con.close();    	
    }
}
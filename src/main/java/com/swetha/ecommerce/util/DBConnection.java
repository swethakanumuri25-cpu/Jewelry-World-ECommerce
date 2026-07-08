package com.swetha.ecommerce.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
    "jdbc:mysql://mysql-1fe3fbc9-swetha-156e.k.aivencloud.com:16698/defaultdb?ssl-mode=REQUIRED";

    private static final String USER = "avnadmin";

    private static final String PASSWORD = System.getenv("DB_PASSWORD");

    static {
        System.out.println("DB_PASSWORD = " + System.getenv("DB_PASSWORD"));
    }

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("URL = " + URL);
            System.out.println("USER = " + USER);
            System.out.println("PASSWORD NULL? " + (PASSWORD == null));
            System.out.println("PASSWORD LENGTH = " + (PASSWORD == null ? 0 : PASSWORD.length()));

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {

            System.out.println("DATABASE CONNECTION FAILED");
        
            System.out.println(e.getClass().getName());
        
            System.out.println(e.getMessage());
        
            e.printStackTrace();
        
        }

        return con;
    }
}
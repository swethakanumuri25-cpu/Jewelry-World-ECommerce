package com.swetha.ecommerce.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
    "jdbc:mysql://mysql-1fe3fbc9-swetha-156e.k.aivencloud.com:16698/defaultdb?sslMode=REQUIRED";

    private static final String USER = "avnadmin";

    private static final String PASSWORD = System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {

            e.printStackTrace();

        }

        return con;
    }
}
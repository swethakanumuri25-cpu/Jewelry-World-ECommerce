package com.swetha.ecommerce.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.swetha.ecommerce.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zipcode = request.getParameter("zipcode");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT SUM(p.price*c.quantity) total " +
                    "FROM cart c JOIN products p ON c.product_id=p.id " +
                    "WHERE c.email=?");

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            double total = 0;

            if(rs.next()){
                total = rs.getDouble("total");
            }

            PreparedStatement insert =
                    con.prepareStatement(
                    "INSERT INTO orders(fullname,email,address,city,state,zipcode,total,status) VALUES(?,?,?,?,?,?,?,?)");

            insert.setString(1, fullname);
            insert.setString(2, email);
            insert.setString(3, address);
            insert.setString(4, city);
            insert.setString(5, state);
            insert.setString(6, zipcode);
            insert.setDouble(7, total);
            insert.setString(8, "Pending");

            insert.executeUpdate();

            PreparedStatement clear =
                    con.prepareStatement(
                    "DELETE FROM cart WHERE email=?");

            clear.setString(1, email);
            clear.executeUpdate();

            con.close();

            response.sendRedirect("orderSuccess.jsp");

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}
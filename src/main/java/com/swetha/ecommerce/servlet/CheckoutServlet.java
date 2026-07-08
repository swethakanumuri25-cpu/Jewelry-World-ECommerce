package com.swetha.ecommerce.servlet;

import com.swetha.ecommerce.util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");

        try {

            Connection con = DBConnection.getConnection();

            // Calculate Grand Total
            double total = 0;

            String totalSql =
                    "SELECT SUM(products.price * cart.quantity) AS grandTotal " +
                    "FROM cart " +
                    "JOIN products ON cart.product_id = products.id " +
                    "WHERE cart.email=?";

            PreparedStatement ps1 = con.prepareStatement(totalSql);
            ps1.setString(1, email);

            var rs = ps1.executeQuery();

            if (rs.next()) {
                total = rs.getDouble("grandTotal");
            }

            // Save Order
            String sql =
                    "INSERT INTO orders(fullname,email,address,city,state,zipcode,total) " +
                    "VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps2 = con.prepareStatement(sql);

            ps2.setString(1, fullname);
            ps2.setString(2, email);
            ps2.setString(3, address);
            ps2.setString(4, city);
            ps2.setString(5, state);
            ps2.setString(6, zipcode);
            ps2.setDouble(7, total);

            ps2.executeUpdate();

            // Clear Cart
            String delete =
                    "DELETE FROM cart WHERE email=?";

            PreparedStatement ps3 = con.prepareStatement(delete);

            ps3.setString(1, email);

            ps3.executeUpdate();

            response.sendRedirect("orderSuccess.jsp");

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}
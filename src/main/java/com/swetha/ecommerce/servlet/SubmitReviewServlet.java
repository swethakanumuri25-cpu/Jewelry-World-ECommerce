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
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitReviewServlet")
public class SubmitReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();

            String email = (String) session.getAttribute("user");
            String name = (String) session.getAttribute("userName");

            int productId = Integer.parseInt(request.getParameter("productId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String review = request.getParameter("review");

            Connection con = DBConnection.getConnection();

            // Check whether the user already reviewed this product
            PreparedStatement check = con.prepareStatement(
                    "SELECT id FROM reviews WHERE product_id=? AND email=?");

            check.setInt(1, productId);
            check.setString(2, email);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {

                // Update existing review
                PreparedStatement update = con.prepareStatement(
                        "UPDATE reviews SET name=?, rating=?, review=? WHERE product_id=? AND email=?");

                update.setString(1, name);
                update.setInt(2, rating);
                update.setString(3, review);
                update.setInt(4, productId);
                update.setString(5, email);

                update.executeUpdate();
                update.close();

            } else {

                // Insert new review
                PreparedStatement insert = con.prepareStatement(
                        "INSERT INTO reviews(product_id,name,email,rating,review) VALUES(?,?,?,?,?)");

                insert.setInt(1, productId);
                insert.setString(2, name);
                insert.setString(3, email);
                insert.setInt(4, rating);
                insert.setString(5, review);

                insert.executeUpdate();
                insert.close();
            }

            rs.close();
            check.close();

            // Update average rating
            PreparedStatement avg = con.prepareStatement(
                    "UPDATE products SET rating=(SELECT AVG(rating) FROM reviews WHERE product_id=?) WHERE id=?");

            avg.setInt(1, productId);
            avg.setInt(2, productId);

            avg.executeUpdate();

            avg.close();
            con.close();

            response.sendRedirect("productDetails.jsp?id=" + productId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
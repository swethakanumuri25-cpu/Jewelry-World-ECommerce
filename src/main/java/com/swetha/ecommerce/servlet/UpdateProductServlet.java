package com.swetha.ecommerce.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.swetha.ecommerce.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String image = request.getParameter("image");
            String category = request.getParameter("category");
            String description = request.getParameter("description");

            Connection con = DBConnection.getConnection();

            String sql =
                    "UPDATE products SET name=?, price=?, image=?, category=?, description=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, image);
            ps.setString(4, category);
            ps.setString(5, description);
            ps.setInt(6, id);

            ps.executeUpdate();

            response.sendRedirect("manageProducts.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
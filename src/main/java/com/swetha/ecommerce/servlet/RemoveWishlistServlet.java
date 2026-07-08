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
import jakarta.servlet.http.HttpSession;

@WebServlet("/RemoveWishlistServlet")
public class RemoveWishlistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("user");

        if(email == null){

            response.sendRedirect("login.jsp");
            return;

        }

        int productId = Integer.parseInt(request.getParameter("id"));

        try{

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "DELETE FROM wishlist WHERE email=? AND product_id=?");

            ps.setString(1,email);
            ps.setInt(2,productId);

            ps.executeUpdate();

            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        response.sendRedirect("wishlist.jsp");

    }
}
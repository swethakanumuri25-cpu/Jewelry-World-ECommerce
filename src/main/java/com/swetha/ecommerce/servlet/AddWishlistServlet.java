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

@WebServlet("/AddWishlistServlet")
public class AddWishlistServlet extends HttpServlet {

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

            PreparedStatement check = con.prepareStatement(
                    "SELECT * FROM wishlist WHERE email=? AND product_id=?");

            check.setString(1, email);
            check.setInt(2, productId);

            if(!check.executeQuery().next()){

                PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO wishlist(email,product_id) VALUES(?,?)");

                ps.setString(1, email);
                ps.setInt(2, productId);

                ps.executeUpdate();

                ps.close();
            }

            check.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        response.sendRedirect("wishlist.jsp");

    }

}
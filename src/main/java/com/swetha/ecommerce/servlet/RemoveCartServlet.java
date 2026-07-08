package com.swetha.ecommerce.servlet;

import com.swetha.ecommerce.util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        int id=Integer.parseInt(request.getParameter("id"));

        try{

            Connection con=DBConnection.getConnection();

            PreparedStatement ps=
            con.prepareStatement(
            "DELETE FROM cart WHERE id=?");

            ps.setInt(1,id);

            ps.executeUpdate();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        response.sendRedirect("cart.jsp");

    }

}
package com.swetha.ecommerce.servlet;

import com.swetha.ecommerce.util.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        out.println("Login request received");
        out.println("Email: " + email);

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                out.println("ERROR: Database connection is NULL.");
                return;
            }

            out.println("Database Connected Successfully");

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("user", rs.getString("email"));
                session.setAttribute("fullname", rs.getString("fullname"));
                session.setAttribute("userName", rs.getString("fullname"));
                session.setAttribute("userEmail", rs.getString("email"));

                response.sendRedirect("index.jsp");

            } else {

                out.println("Login Failed");
                out.println("User not found or password incorrect.");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            out.println("EXCEPTION OCCURRED:");
            e.printStackTrace(out);

        }
    }
}
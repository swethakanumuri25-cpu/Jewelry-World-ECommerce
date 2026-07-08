package com.swetha.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.swetha.ecommerce.model.Product;
import com.swetha.ecommerce.util.DBConnection;

public class ProductDAO {

    // Get All Products
    public List<Product> getAllProducts() {

        List<Product> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM products");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product p = new Product();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setRating(rs.getDouble("rating"));

                list.add(p);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Products By Category
    public List<Product> getProductsByCategory(String category) {

        List<Product> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                            "SELECT * FROM products WHERE category=?");

            ps.setString(1, category);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product p = new Product();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setRating(rs.getDouble("rating"));

                list.add(p);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Search Products
    public List<Product> searchProducts(String keyword){

        List<Product> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM products WHERE name LIKE ? OR category LIKE ? OR description LIKE ?";

            PreparedStatement ps = con.prepareStatement(sql);

            String search = "%" + keyword + "%";

            ps.setString(1, search);
            ps.setString(2, search);
            ps.setString(3, search);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Product p = new Product();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setRating(rs.getDouble("rating"));

                list.add(p);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

    // Get Product By ID
    public Product getProductById(int id) {

        Product p = null;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                            "SELECT * FROM products WHERE id=?");

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                p = new Product();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setRating(rs.getDouble("rating"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.ProductHierarchy;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DEKUPAC
 */
public class ProductHierarchyDAO {

    private final Connection connection;

    public ProductHierarchyDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveProductHierarchy(ProductHierarchy productHierarchy) {
        int status = 0;
        String strInsert = "insert into ProductHierarchy(ProductID,Quantity,Price) values(?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, productHierarchy.getProductId());
            ps.setInt(2, productHierarchy.getQuantity());
            ps.setFloat(3, productHierarchy.getPrice());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int updateProductHierarchy(ProductHierarchy productHierarchy) {
        int status = 0;
        String strUpdate = "update ProductHierarchy set Price=? where ProductID=? and Quantity=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setFloat(1, productHierarchy.getPrice());
            ps.setInt(2, productHierarchy.getProductId());
            ps.setInt(3, productHierarchy.getQuantity());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int deleteProductHierarchy(ProductHierarchy productHierarchy) {
        int status = 0;
        String strDelete = "delete from ProductHierarchy where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, productHierarchy.getProductId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return status;
    }

    public List<ProductHierarchy> getAllProductHierarchy() {
        List<ProductHierarchy> productHierarchys = new ArrayList<>();
        String strSelectAll = "select * from ProductHierarchy";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductHierarchy productHierarchy = new ProductHierarchy();
                productHierarchy.setProductId(rs.getInt("ProductID"));
                productHierarchy.setQuantity(rs.getInt("Quantity"));
                productHierarchy.setPrice(rs.getInt("Price"));
                productHierarchys.add(productHierarchy);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productHierarchys;
    }
    public List<ProductHierarchy> getHierarchyByProId(int productId) {

        String strSelectAll = "select * from ProductHierarchy where ProductID = ? order by Quantity";
        List<ProductHierarchy> productImages = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductHierarchy productHierarchy = new ProductHierarchy();
                productHierarchy.setProductId(rs.getInt("ProductID"));
                productHierarchy.setQuantity(rs.getInt("Quantity"));
                productHierarchy.setPrice(rs.getInt("Price"));
                productImages.add(productHierarchy);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productImages;
    }
    public List<ProductHierarchy> getAllHieByProId(int productId) {

        String strSelectAll = "select * from ProductHierarchy where ProductID = ? order by Quantity desc";
        List<ProductHierarchy> productImages = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductHierarchy productHierarchy = new ProductHierarchy();
                productHierarchy.setProductId(rs.getInt("ProductID"));
                productHierarchy.setQuantity(rs.getInt("Quantity"));
                productHierarchy.setPrice(rs.getInt("Price"));
                productImages.add(productHierarchy);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productImages;
    }

    public int deleteProductHierarchyByProId(int id) {
        int status = 0;
        String strDelete = "delete from ProductHierarchy where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return status;
    }

    public List<ProductHierarchy> getAllHieByProIdAsc(int productId) {
        String strSelectAll = "select * from ProductHierarchy where ProductID = ? order by Quantity";
        List<ProductHierarchy> productImages = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductHierarchy productHierarchy = new ProductHierarchy();
                productHierarchy.setProductId(rs.getInt("ProductID"));
                productHierarchy.setQuantity(rs.getInt("Quantity"));
                productHierarchy.setPrice(rs.getInt("Price"));
                productImages.add(productHierarchy);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productImages;
    }
}

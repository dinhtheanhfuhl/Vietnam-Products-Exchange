/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.ProductImage;
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
public class ProductImageDAO {

    private final Connection connection;

    public ProductImageDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveProductImage(ProductImage productImage) {
        int status = 0;
        String strInsert = "insert into ProductImage(ProductID,ImgPath) values(?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, productImage.getProducId());
            ps.setString(2, productImage.getImgPath());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteProductImage(ProductImage productImage) {
        int status = 0;
        String strDelete = "delete from ProductImage where ProductImageID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, productImage.getProductImageId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<ProductImage> getAllProductImage() {

        String strSelectAll = "select * from ProductImage";
        List<ProductImage> productImages = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage();
                productImage.setProductImageId(rs.getInt("ProductImageID"));
                productImage.setProducId(rs.getInt("ProductID"));
                productImage.setImgPath(rs.getString("ImgPath"));
                productImages.add(productImage);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return productImages;
    }
       public ProductImage getProductImageById(int productId) {
        ProductImage productImage = null;
        String strSelectById = "select top 1 * from ProductImage where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                productImage = new ProductImage();
                productImage.setProductImageId(rs.getInt("ProductImageID"));
                productImage.setProducId(rs.getInt("ProductID"));
                productImage.setImgPath(rs.getString("ImgPath"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return  productImage;
    }
       public static void main(String[] args) {
        ProductImage p = new ProductImageDAO(dbconnect.DBConnect.getConnection()).getProductImageById(12);
           System.out.println(p);
    }
}

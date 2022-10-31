/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.ProductVideo;
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
public class ProductVideoDAO {

    private final Connection connection;

    public ProductVideoDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveProductImage(ProductVideo productVideo) {
        int status = 0;
        String strInsert = "insert into ProductVideo(ProductID,VideoPath) values(?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, productVideo.getProductId());
            ps.setString(2, productVideo.getVideoPath());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteProductImage(ProductVideo productVideo) {
        int status = 0;
        String strDelete = "delete from ProductVideo where ProductVideoID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, productVideo.getProductVideoId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<ProductVideo> getAllProductVideo() {

        String strSelectAll = "select * from ProductVideo";
        List<ProductVideo> productVideos = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductVideo productVideo = new ProductVideo();
                productVideo.setProductVideoId(rs.getInt("ProductVideoID"));
                productVideo.setProductId(rs.getInt("ProductID"));
                productVideo.setVideoPath(rs.getString("VideoPath"));
                productVideos.add(productVideo);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return productVideos;
    }
}
//chưa test dao
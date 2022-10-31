/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.DeliveryArea;
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
public class DeliveryAreaDAO {
    private final Connection connection;

    public DeliveryAreaDAO(Connection connection) {
        this.connection = connection;
    }
    
    public int saveDeliveryArea(DeliveryArea deliveryArea) {
        int status = 0;
        String strInsert = "insert into DeliveryArea(ProductID,CityID) values(?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, deliveryArea.getProductId());
            ps.setInt(2, deliveryArea.getCityId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteDeliveryArea(DeliveryArea deliveryArea) {
        int status = 0;
        String strDelete = "delete from DeliveryArea where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, deliveryArea.getProductId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<DeliveryArea> getAllDeliveryArea() {
        
        String strSelectAll = "select * from DeliveryArea";
        List<DeliveryArea> deliveryAreas = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DeliveryArea deliveryArea = new DeliveryArea();
                deliveryArea.setProductId(rs.getInt("ProductID"));
                deliveryArea.setCityId(rs.getInt("CityID"));
                deliveryAreas.add(deliveryArea);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return deliveryAreas;
    }

    public List<DeliveryArea> getDeliverysAreaById(int id) {
        
        String strSelectById = "select * from DeliveryArea where ProductID=?";
        List<DeliveryArea> deliveryAreas = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DeliveryArea deliveryArea = new DeliveryArea();
                deliveryArea.setProductId(rs.getInt("ProductID"));
                deliveryArea.setCityId(rs.getInt("CityID"));
                deliveryAreas.add(deliveryArea);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return deliveryAreas;
    }
}

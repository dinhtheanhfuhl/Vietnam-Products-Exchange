/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.OrderStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ductd
 */
public class OrderStatusDAO {

    private final Connection connection;

    public OrderStatusDAO(Connection connection) {
        this.connection = connection;
    }

    public List<OrderStatus> getAllOrderDetails() {
        List<OrderStatus> orderStatuses = new ArrayList<>();
        String strSelectAll = "select * from OrderStatus";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderStatus orderStatus = new OrderStatus();
                orderStatus.setOrderStatusID(rs.getInt("OrderStatusID"));
                orderStatus.setStatusName(rs.getString("StatusName"));

                orderStatuses.add(orderStatus);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderStatuses;
    }
    
    public List<OrderStatus> getAllOrderStatus() {
        List<OrderStatus> orderStatuses = new ArrayList<>();
        String strSelectAll = "select * from OrderStatus";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderStatus orderStatus = new OrderStatus();
                orderStatus.setOrderStatusID(rs.getInt("OrderStatusID"));
                orderStatus.setStatusName(rs.getString("StatusName"));

                orderStatuses.add(orderStatus);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderStatuses;
    }

    public OrderStatus getOrderStatusById(int orderStatusId) {
        OrderStatus orderStatus = null;
        String strSelectAll = "select * from OrderStatus where OrderStatusID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, orderStatusId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 orderStatus = new OrderStatus();
                orderStatus.setOrderStatusID(rs.getInt("OrderStatusID"));
                orderStatus.setStatusName(rs.getString("StatusName"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderStatus;


    public void updateOrderStatus(int orderId) {
        String query = "UPDATE [Order] SET OrderStatusID= 5 where OrderID= ? ";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

    }
}

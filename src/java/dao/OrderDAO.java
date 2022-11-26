/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Cart;
import entity.Order;
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
public class OrderDAO {

    private final Connection connection;

    public OrderDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveOrder(Order order) {
        int status = 0;
        String strInsert = "insert into [Order](CustomerID,RecieverName,RecieverPhone,RecieverAddress,TotalPrice,OrderStatusID)"
                + " values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, order.getCustomerID());
            ps.setString(2, order.getRecieverName());
            ps.setString(3, order.getRecieverPhone());
            ps.setString(4, order.getRecieverAddress());
            ps.setInt(5, order.getTotalPrice());
            ps.setInt(6, order.getOrderStatusID());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String strSelectAll = "select * from [Order]";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getInt("OrderID"));
                order.setCustomerID(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusID(rs.getInt("OrderStatusID"));
                orders.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orders;
    }
    
    public Order getOrderById(int id) {
        Order order = null;
        String strSelectById = "select * from [Order] where OrderID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order();
                order.setOrderID(rs.getInt("OrderID"));
                order.setCustomerID(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusID(rs.getInt("OrderStatusID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return order;
    }
}

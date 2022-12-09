/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
            ps.setInt(1, order.getCustomerId());
            ps.setString(2, order.getRecieverName());
            ps.setString(3, order.getRecieverPhone());
            ps.setString(4, order.getRecieverAddress());
            ps.setInt(5, order.getTotalPrice());
            ps.setInt(6, order.getOrderStatusId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public void insertOrder(int customerId, String receiverName, String receiverAddress, String receiverPhone, int totalPrice, int statusId, String note) {
        String strInsert = "insert into [Order](CustomerID,RecieverName,RecieverAddress,RecieverPhone,TotalPrice,OrderStatusID,Note) values(?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, customerId);
            ps.setString(2, receiverName);
            ps.setString(3, receiverAddress);
            ps.setString(4, receiverPhone);
            ps.setInt(5, totalPrice);
            ps.setInt(6, statusId);
            ps.setString(7, note);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String strSelectAll = "select * from [Order]";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
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
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
                order.setNote(rs.getString("Note"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return order;
    }

    public Order getNewestOrder() {
        Order order = null;
        String strSelectById = "select top 1 * from [Order] order by OrderID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
                order.setNote(rs.getString("Note"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return order;
    }

    public Order getOrderByOrderDetailId(int id) {
        Order order = null;
        String strSelectById = "select * from [Order] inner join OrderDetail on [Order].OrderID = OrderDetail.OrderID where OrderDetailID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
                order.setNote(rs.getString("Note"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return order;
    }

    public List<Order> getOrderByCusId(int customerId) {
        List<Order> orders = new ArrayList<>();
        String strSelectAll = "select * from [Order] where CustomerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
                order.setNote(rs.getString("Note"));
                orders.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orders;
    }

    public List<Order> getListOrderByStatusId(int statusId, int cusId) {
        List<Order> orders = new ArrayList<>();
        String strSelectAll = "select * from [Order] where OrderStatusID = ? and CustomerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, statusId);
            ps.setInt(2, cusId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
                order.setNote(rs.getString("Note"));
                orders.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orders;
    }


    public List<Order> searchOrder(String id, String shopName, String filter) {
        List<Order> orders = new ArrayList<>();
        String strSelectAll = "select * from [Order]";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
                orders.add(order);
            }
            } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orders;
    }
    public int sumPrice(int orderId) {
        Order order = null;
        String query = "SELECT SUM (Cost) FROM OrderDetail WHERE OrderID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<Order> searchOrder(String id, String filter) {
        List<Order> orders = new ArrayList<>();
        String sqlStr = "select * from [Order]";
        if(id != null && !id.equals("")){
            sqlStr += " and id="+id;
        }
        if(id != null && !id.equals("")){
            sqlStr += " and id="+id;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sqlStr);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setRecieverName(rs.getString("RecieverName"));
                order.setRecieverPhone(rs.getString("RecieverPhone"));
                order.setRecieverAddress(rs.getString("RecieverAddress"));
                order.setTotalPrice(rs.getInt("TotalPrice"));
                order.setOrderStatusId(rs.getInt("OrderStatusID"));
                orders.add(order);
            }
            } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orders;
    }
}

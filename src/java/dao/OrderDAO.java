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
        String strInsert = "insert into [Order](CustomerID,SupplierID,RecieverName,RecieverPhone,RecieverAddress,TotalPrice,OrderStatusID,Note)"
                + " values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, order.getCustomerId());
            ps.setInt(2, order.getSupplierId());
            ps.setString(3, order.getRecieverName());
            ps.setString(4, order.getRecieverPhone());
            ps.setString(5, order.getRecieverAddress());
            ps.setInt(6, order.getTotalPrice());
            ps.setInt(7, order.getOrderStatusId());
            ps.setString(8, order.getNote());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public void insertOrder(int customerId,int supplierId, String receiverName, String receiverAddress, String receiverPhone, int totalPrice, int statusId, String note) {
        String strInsert = "insert into [Order](CustomerID,SupplierID,RecieverName,RecieverAddress,RecieverPhone,TotalPrice,OrderStatusID,Note) values(?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, customerId);
            ps.setInt(2, supplierId);
            ps.setString(3, receiverName);
            ps.setString(4, receiverAddress);
            ps.setString(5, receiverPhone);
            ps.setInt(6, totalPrice);
            ps.setInt(7, statusId);
            ps.setString(8, note);
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
                order.setSupplierId(rs.getInt("SupplierID"));
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
                order.setSupplierId(rs.getInt("SupplierID"));
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
                order.setSupplierId(rs.getInt("SupplierID"));
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
                order.setSupplierId(rs.getInt("SupplierID"));
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
        String strSelectAll = "select distinct o.OrderID,o.CustomerID,o.SupplierID,o.RecieverName,o.RecieverPhone,\n"
                + "o.RecieverAddress,o.TotalPrice,o.OrderStatusID,od.OrderDate \n"
                + "from [Order] as o join OrderDetail as od on o.OrderID = od.OrderID \n"
                + "where CustomerID = ? order by OrderDate desc ";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setSupplierId(rs.getInt("SupplierID"));
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
                order.setSupplierId(rs.getInt("SupplierID"));
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

    public int sumPrice(int orderId) {
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
        String sqlStr = "select * from [Order] where 1 = 1 ";
        if (id != null && !id.equals("")) {
            sqlStr += " and OrderID=" + id;
        }
        if (filter != null && !filter.equals("") && !filter.equals("0")) {
            sqlStr += " and OrderStatusID=" + filter;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sqlStr);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setSupplierId(rs.getInt("SupplierID"));
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

    public int sumAmount(int orderId) {
        String query = "SELECT SUM (Amount) FROM OrderDetail WHERE OrderID = ?";
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
    
    public int countDetailOrder(int orderId) {
        String query = "SELECT COUNT (*) FROM OrderDetail WHERE OrderID = ?";
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

    public List<Order> searchOrderBySupplierID(int supplierId, String orderID, String filter) {
        List<Order> orders = new ArrayList<>();
        String sqlStr = "select * from [Order] where supplierId="+supplierId;
        if (orderID != null && !orderID.equals("")) {
            sqlStr += " and OrderID=" + orderID;
        }
        if (filter != null && !filter.equals("") && !filter.equals("0")) {
            sqlStr += " and OrderStatusID=" + filter;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sqlStr);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setSupplierId(rs.getInt("SupplierID"));
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

    public int updateStatusOrder(Order order) {
        int status = 0;
        String strUpdate = "update [Order] set OrderStatusID = ? where OrderID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setInt(1, order.getOrderStatusId());
            ps.setInt(2, order.getOrderId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}

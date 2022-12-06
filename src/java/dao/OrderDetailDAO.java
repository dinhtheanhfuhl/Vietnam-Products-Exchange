/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.OrderDetail;
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
public class OrderDetailDAO {

    private final Connection connection;

    public OrderDetailDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveOrderDetail(OrderDetail orderDetail) {
        int status = 0;
        String strInsert = "insert into OrderDetail(OrderID, ProductID, OrderDate, Amount, Cost) values(?,?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, orderDetail.getOrderId());
            ps.setInt(2, orderDetail.getProductId());
            ps.setString(3, orderDetail.getOrderDate());
            ps.setInt(4, orderDetail.getAmount());
            ps.setInt(5, orderDetail.getCost());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public List<OrderDetail> getAllOrderDetails() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String strSelectAll = "select * from OrderDetail";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderDetailId(rs.getInt("OrderDetailID"));
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setProductId(rs.getInt("ProductID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setAmount(rs.getInt("Amount"));
                orderDetail.setCost(rs.getInt("Cost"));

                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDetails;
    }
    
     public List<OrderDetail> getAllOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String strSelectAll = "select * from OrderDetail where OrderID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderDetailId(rs.getInt("OrderDetailID"));
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setProductId(rs.getInt("ProductID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setAmount(rs.getInt("Amount"));
                orderDetail.setCost(rs.getInt("Cost"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDetails;
    }

    public OrderDetail getOrderDetailById(int id) {
        OrderDetail orderDetail = null;
        String strSelectById = "select * from OrderDetail where OrderDetailID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail = new OrderDetail();
                orderDetail.setOrderDetailId(rs.getInt("OrderDetailID"));
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setProductId(rs.getInt("ProductID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setAmount(rs.getInt("Amount"));
                orderDetail.setCost(rs.getInt("Cost"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDetail;
    }
    
    public OrderDetail getOrderDetailByOrderId(int id) {
        OrderDetail orderDetail = null;
        String strSelectById = "select * from OrderDetail where OrderID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail = new OrderDetail();
                orderDetail.setOrderDetailId(rs.getInt("OrderDetailID"));
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setProductId(rs.getInt("ProductID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setAmount(rs.getInt("Amount"));
                orderDetail.setCost(rs.getInt("Cost"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDetail;
    }
    public List<OrderDetail> getOrderDetailByCusId(int customerId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String strSelectAll = "select * from OrderDetail inner join [Order] on OrderDetail.OrderID = [Order].OrderID where [Order].CustomerID = ? order by OrderDate desc";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderDetailId(rs.getInt("OrderDetailID"));
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setProductId(rs.getInt("ProductID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setAmount(rs.getInt("Amount"));
                orderDetail.setCost(rs.getInt("Cost"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDetails;
    }
    
    public void insertOrderDetail(int orderId, int proId, String orderdate, int amount, int cost) {
        String strInsert = "insert into OrderDetail(OrderID,ProductID,OrderDate,Amount,Cost) values(?,?,?,?,?)";

        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, orderId);
            ps.setInt(2, proId);
            ps.setString(3, orderdate);
            ps.setInt(4, amount);
            ps.setInt(5, cost);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }
}

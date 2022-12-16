/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.MessageRejectAccount;
import entity.MessageRejectOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MessageRejectOrderDAO {

    private final Connection connection;

    public MessageRejectOrderDAO(Connection connection) {
        this.connection = connection;
    }

    public void saveMessageRejectOrder(int orderId, String message) {
        String strInsert = "insert into MessageRejectOrder(OrderID, MessageDescribe) values(?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, orderId);
            ps.setString(2, message);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public MessageRejectOrder getMessageRejectOrderByOrderId(int id) {
        MessageRejectOrder messageRejectOrder = null;
        String strSelectById = "select top(1)* from MessageRejectOrder where OrderID=? order by MessageOrderID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                messageRejectOrder = new MessageRejectOrder();
                messageRejectOrder.setMessageOrderId(rs.getInt("MessageOrderID"));
                messageRejectOrder.setOrderId(rs.getInt("OrderID"));
                messageRejectOrder.setMessageDescribe(rs.getString("MessageDescribe"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return messageRejectOrder;
    }
}

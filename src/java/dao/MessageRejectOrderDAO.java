/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.MessageRejectAccount;
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
}

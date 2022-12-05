/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Cart;
import entity.MessageRejectAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DEKUPAC
 */
public class MessageRejectAccountDAO {

    private final Connection connection;

    public MessageRejectAccountDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveMessageRejectAccount(MessageRejectAccount messageRejectAccount) {
        int status = 0;
        String strInsert = "insert into MessageRejectAccount(AccID, MessageDescribe) values(?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, messageRejectAccount.getAccID());
            ps.setString(2, messageRejectAccount.getMessageDescribe());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public MessageRejectAccount getMessageRejectAccountById(int id) {
        MessageRejectAccount messageRejectAccount = null;
        String strSelectById = "select * from MessageRejectAccount where MessageAccID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                messageRejectAccount = new MessageRejectAccount();
                messageRejectAccount.setMessageAccID(rs.getInt("MessageAccID"));
                messageRejectAccount.setAccID(rs.getInt("AccID"));
                messageRejectAccount.setMessageDescribe(rs.getString("MessageDescribe"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return messageRejectAccount;
    }

    public MessageRejectAccount getMessRejectAccByAccId(int id) {
        MessageRejectAccount messageRejectAccount = null;
        String strSelectById = "select * from MessageRejectAccount where AccID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                messageRejectAccount = new MessageRejectAccount();
                messageRejectAccount.setMessageAccID(rs.getInt("MessageAccID"));
                messageRejectAccount.setAccID(rs.getInt("AccID"));
                messageRejectAccount.setMessageDescribe(rs.getString("MessageDescribe"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return messageRejectAccount;
    }
}

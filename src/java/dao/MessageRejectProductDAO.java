/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.MessageRejectAccount;
import entity.MessageRejectProduct;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DEKUPAC
 */
public class MessageRejectProductDAO {

    private final Connection connection;

    public MessageRejectProductDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveMessageRejectProduct(MessageRejectProduct messageRejectProduct) {
        int status = 0;
        String strInsert = "insert into MessageRejectProduct(ProductID, MessageDescribe) values(?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, messageRejectProduct.getProductId());
            ps.setString(2, messageRejectProduct.getMessageDescribe());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public MessageRejectProduct getMessageRejectProductById(int id) {
        MessageRejectProduct messageRejectProduct = null;
        String strSelectById = "select * from MessageRejectProduct where MessageProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                messageRejectProduct = new MessageRejectProduct();
                messageRejectProduct.setMessageProductId(rs.getInt("MessageProductID"));
                messageRejectProduct.setProductId(rs.getInt("ProductID"));
                messageRejectProduct.setMessageDescribe(rs.getString("MessageDescribe"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return messageRejectProduct;
    }

    public MessageRejectProduct getMessageRejectProductByProId(int id) {
        MessageRejectProduct messageRejectProduct = null;
        String strSelectById = "select top(1) * from MessageRejectProduct where ProductID=? order by MessageProductID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                messageRejectProduct = new MessageRejectProduct();
                messageRejectProduct.setMessageProductId(rs.getInt("MessageProductID"));
                messageRejectProduct.setProductId(rs.getInt("ProductID"));
                messageRejectProduct.setMessageDescribe(rs.getString("MessageDescribe"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return messageRejectProduct;
    }
}

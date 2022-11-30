/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.CartItem;
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
public class CartItemDAO {

    private final Connection connection;

    public CartItemDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveCartItem(CartItem cartItem) {
        int status = 0;
        String strInsert = "insert into CartItem(CartID, ProductID, Amount) values(?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, cartItem.getCartId());
            ps.setInt(2, cartItem.getProductId());
            ps.setInt(3, cartItem.getAmount());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public void insertCartItem(int cartId, int productId, int amount) {
        String strInsert = "insert into CartItem(CartID, ProductID, Amount) values(?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, cartId);
            ps.setInt(2, productId);
            ps.setInt(3, amount);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public void updateAmount(int amount, int CartID, int ProductID) {
        String query = "UPDATE CartItem\n"
                + "SET Amount= ? where CartID=? and ProductID=?";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, CartID);
            ps.setInt(3, ProductID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public List<CartItem> getAllCartItems() {
        List<CartItem> cartItems = new ArrayList<>();
        String strSelectAll = "select * from CartItem";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartItem cartItem = new CartItem();
                cartItem.setCartId(rs.getInt("CartID"));
                cartItem.setProductId(rs.getInt("ProductID"));
                cartItem.setAmount(rs.getInt("Amount"));
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return cartItems;
    }

    public CartItem getCartItemByProductId(int productid, int cartId) {
        CartItem cartItem = null;
        String strSelectAll = "select * from CartItem where ProductID = ? and CartID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, productid);
            ps.setInt(2, cartId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cartItem = new CartItem();
                cartItem.setCartId(rs.getInt("CartID"));
                cartItem.setProductId(rs.getInt("ProductID"));
                cartItem.setAmount(rs.getInt("Amount"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return cartItem;
    }

}

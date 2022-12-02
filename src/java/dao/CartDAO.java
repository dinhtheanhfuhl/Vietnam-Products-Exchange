/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Cart;
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
public class CartDAO {

    private final Connection connection;

    public CartDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveCart(Cart cart) {
        int status = 0;
        String strInsert = "insert into Cart(CustomerID) values(?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, cart.getCustomerId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int updateCart(Cart cart) {
        int status = 0;
        String strUpdate = "update Cart set CustomerID=? where CartID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setInt(1, cart.getCustomerId());
            ps.setInt(2, cart.getCartId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int deleteCart(Cart cart) {
        int status = 0;
        String strDelete = "delete from Cart where CartID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, cart.getCartId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return status;
    }

    public List<Cart> getAllCarts() {
        List<Cart> carts = new ArrayList<>();
        String strSelectAll = "select * from Cart";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setCartId(rs.getInt("CartID"));
                cart.setCustomerId(rs.getInt("CustomerID"));
                carts.add(cart);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return carts;
    }

    public Cart getCartById(int id) {
        Cart cart = null;
        String strSelectById = "select * from Cart where CartID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cart = new Cart();
                cart.setCartId(rs.getInt("CartID"));
                cart.setCustomerId(rs.getInt("CustomerID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return cart;
    }
    public int getCartIdByCustomerId(int id) {
        int cartId = -1;
        String strSelectById = "select CartID from Cart where CustomerID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cartId=rs.getInt("CartId");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return cartId;
    }
}

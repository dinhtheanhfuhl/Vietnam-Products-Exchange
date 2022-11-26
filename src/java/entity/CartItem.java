/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class CartItem {
    private int cartId;
    private int productId;
    private int amount;

    public CartItem() {
    }

    public CartItem(int cartId, int productId, int amount) {
        this.cartId = cartId;
        this.productId = productId;
        this.amount = amount;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "CartItem{" + "cartId=" + cartId + ", productId=" + productId + ", amount=" + amount + '}';
    }
    
}

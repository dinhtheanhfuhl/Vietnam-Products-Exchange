/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class Order {

    private int orderId, customerId;
    private String recieverName, recieverPhone, recieverAddress;
    private int totalPrice, orderStatusId;
    private String note;

    public Order() {
    }

    public Order(int orderId, int customerId, String recieverName, String recieverPhone, String recieverAddress, int totalPrice, int orderStatusId, String note) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.recieverName = recieverName;
        this.recieverPhone = recieverPhone;
        this.recieverAddress = recieverAddress;
        this.totalPrice = totalPrice;
        this.orderStatusId = orderStatusId;
        this.note = note;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getRecieverName() {
        return recieverName;
    }

    public void setRecieverName(String recieverName) {
        this.recieverName = recieverName;
    }

    public String getRecieverPhone() {
        return recieverPhone;
    }

    public void setRecieverPhone(String recieverPhone) {
        this.recieverPhone = recieverPhone;
    }

    public String getRecieverAddress() {
        return recieverAddress;
    }

    public void setRecieverAddress(String recieverAddress) {
        this.recieverAddress = recieverAddress;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", customerId=" + customerId + ", recieverName=" + recieverName + ", recieverPhone=" + recieverPhone + ", recieverAddress=" + recieverAddress + ", totalPrice=" + totalPrice + ", orderStatusId=" + orderStatusId + ", note=" + note + '}';
    }
    
    
}

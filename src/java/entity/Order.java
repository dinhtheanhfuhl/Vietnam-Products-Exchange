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

    public Order(int OrderID, int CustomerID, String RecieverName, String RecieverPhone, String RecieverAddress, int TotalPrice, int OrderStatusID) {
        this.orderId = OrderID;
        this.customerId = CustomerID;
        this.recieverName = RecieverName;
        this.recieverPhone = RecieverPhone;
        this.recieverAddress = RecieverAddress;
        this.totalPrice = TotalPrice;
        this.orderStatusId = OrderStatusID;
    }

    public Order(int OrderId, int CustomerId, String RecieverName, String RecieverPhone, String RecieverAddress, int TotalPrice, int OrderStatusId, String note) {
        this.orderId = OrderId;
        this.customerId = CustomerId;
        this.recieverName = RecieverName;
        this.recieverPhone = RecieverPhone;
        this.recieverAddress = RecieverAddress;
        this.totalPrice = TotalPrice;
        this.orderStatusId = OrderStatusId;
        this.note = note;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int OrderId) {
        this.orderId = OrderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int CustomerId) {
        this.customerId = CustomerId;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int OrderStatusId) {
        this.orderStatusId = OrderStatusId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getOrderID() {
        return orderId;
    }

    public void setOrderID(int OrderID) {
        this.orderId = OrderID;
    }

    public int getCustomerID() {
        return customerId;
    }

    public void setCustomerID(int CustomerID) {
        this.customerId = CustomerID;
    }

    public String getRecieverName() {
        return recieverName;
    }

    public void setRecieverName(String RecieverName) {
        this.recieverName = RecieverName;
    }

    public String getRecieverPhone() {
        return recieverPhone;
    }

    public void setRecieverPhone(String RecieverPhone) {
        this.recieverPhone = RecieverPhone;
    }

    public String getRecieverAddress() {
        return recieverAddress;
    }

    public void setRecieverAddress(String RecieverAddress) {
        this.recieverAddress = RecieverAddress;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.totalPrice = TotalPrice;
    }

    public int getOrderStatusID() {
        return orderStatusId;
    }

    public void setOrderStatusID(int OrderStatusID) {
        this.orderStatusId = OrderStatusID;
    }

    @Override
    public String toString() {
        return "Order{" + "OrderID=" + orderId + ", CustomerID=" + customerId + ", RecieverName=" + recieverName + ", RecieverPhone=" + recieverPhone + ", RecieverAddress=" + recieverAddress + ", TotalPrice=" + totalPrice + ", OrderStatusID=" + orderStatusId + '}';
    }
    
}

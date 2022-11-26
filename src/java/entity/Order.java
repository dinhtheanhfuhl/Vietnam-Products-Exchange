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

    private int OrderId, CustomerId;
    private String RecieverName, RecieverPhone, RecieverAddress;
    private int TotalPrice, OrderStatusId;

    public Order() {
    }

    public Order(int OrderID, int CustomerID, String RecieverName, String RecieverPhone, String RecieverAddress, int TotalPrice, int OrderStatusID) {
        this.OrderId = OrderID;
        this.CustomerId = CustomerID;
        this.RecieverName = RecieverName;
        this.RecieverPhone = RecieverPhone;
        this.RecieverAddress = RecieverAddress;
        this.TotalPrice = TotalPrice;
        this.OrderStatusId = OrderStatusID;
    }

    public int getOrderID() {
        return OrderId;
    }

    public void setOrderID(int OrderID) {
        this.OrderId = OrderID;
    }

    public int getCustomerID() {
        return CustomerId;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerId = CustomerID;
    }

    public String getRecieverName() {
        return RecieverName;
    }

    public void setRecieverName(String RecieverName) {
        this.RecieverName = RecieverName;
    }

    public String getRecieverPhone() {
        return RecieverPhone;
    }

    public void setRecieverPhone(String RecieverPhone) {
        this.RecieverPhone = RecieverPhone;
    }

    public String getRecieverAddress() {
        return RecieverAddress;
    }

    public void setRecieverAddress(String RecieverAddress) {
        this.RecieverAddress = RecieverAddress;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public int getOrderStatusID() {
        return OrderStatusId;
    }

    public void setOrderStatusID(int OrderStatusID) {
        this.OrderStatusId = OrderStatusID;
    }

    @Override
    public String toString() {
        return "Order{" + "OrderID=" + OrderId + ", CustomerID=" + CustomerId + ", RecieverName=" + RecieverName + ", RecieverPhone=" + RecieverPhone + ", RecieverAddress=" + RecieverAddress + ", TotalPrice=" + TotalPrice + ", OrderStatusID=" + OrderStatusId + '}';
    }
    
}

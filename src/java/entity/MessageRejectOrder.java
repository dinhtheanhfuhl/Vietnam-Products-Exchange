/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ductd
 */
public class MessageRejectOrder {
    private int messageOrderId;
    private int orderId;
    private String messageDescribe;

    public MessageRejectOrder() {
    }

    public MessageRejectOrder(int messageOrderId, int orderId, String messageDescribe) {
        this.messageOrderId = messageOrderId;
        this.orderId = orderId;
        this.messageDescribe = messageDescribe;
    }

    public int getMessageOrderId() {
        return messageOrderId;
    }

    public void setMessageOrderId(int messageOrderId) {
        this.messageOrderId = messageOrderId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getMessageDescribe() {
        return messageDescribe;
    }

    public void setMessageDescribe(String messageDescribe) {
        this.messageDescribe = messageDescribe;
    }

    @Override
    public String toString() {
        return "MessageRejectOrder{" + "messageOrderId=" + messageOrderId + ", orderId=" + orderId + ", messageDescribe=" + messageDescribe + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class MessageRejectProduct {
   private int messageProductId, productId;
   private String messageDescribe;

    public MessageRejectProduct() {
    }

    public MessageRejectProduct(int messageProductId, int productId, String messageDescribe) {
        this.messageProductId = messageProductId;
        this.productId = productId;
        this.messageDescribe = messageDescribe;
    }

    public int getMessageProductId() {
        return messageProductId;
    }

    public void setMessageProductId(int messageProductId) {
        this.messageProductId = messageProductId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getMessageDescribe() {
        return messageDescribe;
    }

    public void setMessageDescribe(String messageDescribe) {
        this.messageDescribe = messageDescribe;
    }

    @Override
    public String toString() {
        return "MessageRejectProduct{" + "messageProductId=" + messageProductId + ", productId=" + productId + ", messageDescribe=" + messageDescribe + '}';
    }
   
}

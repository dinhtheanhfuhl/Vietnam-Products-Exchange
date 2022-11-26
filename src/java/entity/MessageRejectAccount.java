/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class MessageRejectAccount {
    private int messageAccId;
    private int accID;
    private String messageDescribe;

    public MessageRejectAccount() {
    }

    public MessageRejectAccount(int messageAccID, int accID, String messageDescribe) {
        this.messageAccId = messageAccID;
        this.accID = accID;
        this.messageDescribe = messageDescribe;
    }

    public int getMessageAccID() {
        return messageAccId;
    }

    public void setMessageAccID(int messageAccID) {
        this.messageAccId = messageAccID;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public String getMessageDescribe() {
        return messageDescribe;
    }

    public void setMessageDescribe(String messageDescribe) {
        this.messageDescribe = messageDescribe;
    }

    @Override
    public String toString() {
        return "MessageRejectAccount{" + "messageAccID=" + messageAccId + ", accID=" + accID + ", messageDescribe=" + messageDescribe + '}';
    }
    
}

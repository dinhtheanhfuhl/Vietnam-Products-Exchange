/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Iterator;

/**
 *
 * @author DEKUPAC
 */
public class Account {

    private int accId;
    private String email;
    private String passWord;
    private int roldId;
    private boolean status;

    public Account() {
    }

    public Account(int accId, String email, String passWord, int roldId, boolean status) {
        this.accId = accId;
        this.email = email;
        this.passWord = passWord;
        this.roldId = roldId;
        this.status = status;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getRoldId() {
        return roldId;
    }

    public void setRoldId(int roldId) {
        this.roldId = roldId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" + "accId=" + accId + ", email=" + email + ", passWord=" + passWord + ", roldId=" + roldId + ", status=" + status + '}';
    }
}

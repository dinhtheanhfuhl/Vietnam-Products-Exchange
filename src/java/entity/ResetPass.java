/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class ResetPass {

    private int accId;
    private String resetCode;

    public ResetPass() {
    }

    public ResetPass(int accId, String resetCode) {
        this.accId = accId;
        this.resetCode = resetCode;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getResetCode() {
        return resetCode;
    }

    public void setResetCode(String resetCode) {
        this.resetCode = resetCode;
    }

    @Override
    public String toString() {
        return "ResetPass{" + "accId=" + accId + ", resetCode=" + resetCode + '}';
    }

}

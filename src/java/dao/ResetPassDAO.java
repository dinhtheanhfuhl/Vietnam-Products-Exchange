/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Account;
import entity.ResetPass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DEKUPAC
 */
public class ResetPassDAO {

    private final Connection connection;

    public ResetPassDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveResetPass(ResetPass resetPass) {
        int status = 0;
        String strInsert = "insert into ResetPass(AccID,ResetCode) values(?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, resetPass.getAccId());
            ps.setString(2, resetPass.getResetCode());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int deleteResetPass(ResetPass resetPass) {
        int status = 0;
        String strDelete = "delete from ResetPass where AccID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, resetPass.getAccId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return status;
    }

    public ResetPass getCodeReset(String code) {
        ResetPass reset = null;
        String str = "select * from ResetPass where ResetCode=?";
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                reset = new ResetPass();
                reset.setAccId(rs.getInt("AccID"));
                reset.setResetCode(rs.getString("ResetCode"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return reset;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import entity.Account;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author DEKUPAC
 */
public class AccountDAO {

    private final Connection connection;

    public AccountDAO(Connection connection) {
        this.connection = connection;
    }
    

    public int saveAccount(Account account) {
        int status = 0;
        String strInsert = "insert into Account(Email,Password,RoleID,Status) values(?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setString(1, account.getEmail());
            ps.setString(2, account.getPassWord());
            ps.setInt(3, account.getRoldId());
            ps.setBoolean(4, account.isStatus());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int updateAccount(Account account) {
        int status = 0;
        String strUpdate = "update Account set Email=?,Password=?,RoleID=?,Status=? where AccID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, account.getEmail());
            ps.setString(2, account.getPassWord());
            ps.setInt(3, account.getRoldId());
            ps.setBoolean(4, account.isStatus());
            ps.setInt(5, account.getAccId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteAccount(Account account) {
        int status = 0;
        String strDelete = "delete from Account where AccID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, account.getAccId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<Account> getAllAccount() {
        List<Account> accounts = new ArrayList<>();
        String strSelectAll = "select * from Account";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccId(rs.getInt("AccID"));
                account.setEmail(rs.getString("Email"));
                account.setPassWord(rs.getString("Password"));
                account.setRoldId(rs.getInt("RoleID"));
                account.setStatus(rs.getBoolean("Status"));
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return accounts;
    }

    public Account getAccountById(int id) {
        Account account = null;
        String strSelectById = "select * from Account where Accid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account();
                account.setAccId(rs.getInt("AccId"));
                account.setEmail(rs.getString("Email"));
                account.setPassWord(rs.getString("Password"));
                account.setRoldId(rs.getInt("RoleID"));
                account.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return account;
    }
}

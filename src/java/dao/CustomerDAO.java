/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    private final Connection connection;

    public CustomerDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveCustomer(Customer customer) {
        int status = 0;
        String strInsert
                = "insert into "
                + "Customer(CustomerName,AccID,DateBirth,Gender,Email,Phone,"
                + "ShopName,MainAddress,CityID,BusinessLicense,AvartarImg)"
                + " values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setString(1, customer.getCustomerName());
            ps.setInt(2, customer.getAccId());
            ps.setString(3, customer.getDateBirth());
            ps.setString(4, customer.getGender());
            ps.setString(5, customer.getEmail());
            ps.setString(6, customer.getPhone());
            ps.setString(7, customer.getShopName());
            ps.setString(8, customer.getMainAddress());
            ps.setInt(9, customer.getCityId());
            ps.setString(10, customer.getBusinessLicense());
            ps.setString(11, customer.getAvartarImg());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int updateCustomer(Customer customer) {
        int status = 0;
        String strUpdate
                = "update Customer set "
                + "CustomerName=?, AccID=?, DateBirth=?, Gender=?, Email=?, Phone=?, "
                + "ShopName=?, MainAddress=?, City=?, BusinessLicense=?, AvartarImg=? where CustomerID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, customer.getCustomerName());
            ps.setInt(2, customer.getAccId());
            ps.setString(3, customer.getDateBirth());
            ps.setString(4, customer.getGender());
            ps.setString(5, customer.getEmail());
            ps.setString(6, customer.getPhone());
            ps.setString(7, customer.getShopName());
            ps.setString(8, customer.getMainAddress());
            ps.setInt(9, customer.getCityId());
            ps.setString(10, customer.getBusinessLicense());
            ps.setString(11, customer.getAvartarImg());
            ps.setInt(12, customer.getCustomerId());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteCustomer(Customer customer) {
        int status = 0;
        String strDelete = "delete from Customer where CustomerID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, customer.getCustomerId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<Customer> getAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        String strSelectAll = "select * from Customer";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("CustomerID"));
                customer.setCustomerName(rs.getString("CustomerName"));
                customer.setAccId(rs.getInt("AccID"));
                customer.setDateBirth(rs.getString("DateBirth"));
                customer.setGender(rs.getString("Gender"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhone(rs.getString("Phone"));
                customer.setShopName(rs.getString("ShopName"));
                customer.setMainAddress(rs.getString("MainAddress"));
                customer.setCityId(rs.getInt("CityID"));
                customer.setBusinessLicense(rs.getString("BusinessLicense"));
                customer.setAvartarImg(rs.getString("AvartarImg"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return customers;
    }

    public Customer getCustomerById(int id) {
        Customer customer = null;
        String strSelectById = "select * from Customer where CustomerID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("CustomerID"));
                customer.setCustomerName(rs.getString("CustomerName"));
                customer.setAccId(rs.getInt("AccID"));
                customer.setDateBirth(rs.getString("DateBirth"));
                customer.setGender(rs.getString("Gender"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhone(rs.getString("Phone"));
                customer.setShopName(rs.getString("ShopName"));
                customer.setMainAddress(rs.getString("MainAddress"));
                customer.setCityId(rs.getInt("CityID"));
                customer.setBusinessLicense(rs.getString("BusinessLicense"));
                customer.setAvartarImg(rs.getString("AvartarImg"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customer;
    }
}

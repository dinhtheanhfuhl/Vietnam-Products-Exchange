/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DEKUPAC
 */
public class SupplierDAO {

    private final Connection connection;

    public SupplierDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveSupplier(Supplier supplier) {
        int status = 0;
        String strInsert
                = "insert into "
                + "Supplier(SupplierName,AccID,DateBirth,Gender,Email,Phone,"
                + "ShopName,MainAddress,CityID,BusinessLicense,AvartarImg)"
                + " values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setString(1, supplier.getSupplierName());
            ps.setInt(2, supplier.getAccId());
            ps.setString(3, supplier.getDateBirth());
            ps.setString(4, supplier.getGender());
            ps.setString(5, supplier.getEmail());
            ps.setString(6, supplier.getPhone());
            ps.setString(7, supplier.getShopName());
            ps.setString(8, supplier.getMainAddress());
            ps.setInt(9, supplier.getCityId());
            ps.setString(10, supplier.getBusinessLicense());
            ps.setString(11, supplier.getAvartarImg());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int updateSupplier(Supplier supplier) {
        int status = 0;
        String strUpdate
                = "update Supplier set "
                + "SupplierName=?, AccID=?, DateBirth=?, Gender=?, Email=?, Phone=?, "
                + "ShopName=?, MainAddress=?, City=?, BusinessLicense=?, AvartarImg=? where SupplierID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, supplier.getSupplierName());
            ps.setInt(2, supplier.getAccId());
            ps.setString(3, supplier.getDateBirth());
            ps.setString(4, supplier.getGender());
            ps.setString(5, supplier.getEmail());
            ps.setString(6, supplier.getPhone());
            ps.setString(7, supplier.getShopName());
            ps.setString(8, supplier.getMainAddress());
            ps.setInt(9, supplier.getCityId());
            ps.setString(10, supplier.getBusinessLicense());
            ps.setString(11, supplier.getAvartarImg());
            ps.setInt(12, supplier.getSupplierId());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteSupplier(Supplier supplier) {
        int status = 0;
        String strDelete = "delete from Supplier where SupplierID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, supplier.getSupplierId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<Supplier> getAllSupplier() {
        List<Supplier> suppliers = new ArrayList<>();
        String strSelectAll = "select * from Supplier";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplier.setSupplierId(rs.getInt("SupplierID"));
                supplier.setSupplierName(rs.getString("SupplierName"));
                supplier.setAccId(rs.getInt("AccID"));
                supplier.setDateBirth(rs.getString("DateBirth"));
                supplier.setGender(rs.getString("Gender"));
                supplier.setEmail(rs.getString("Email"));
                supplier.setPhone(rs.getString("Phone"));
                supplier.setShopName(rs.getString("ShopName"));
                supplier.setMainAddress(rs.getString("MainAddress"));
                supplier.setCityId(rs.getInt("CityID"));
                supplier.setBusinessLicense(rs.getString("BusinessLicense"));
                supplier.setAvartarImg(rs.getString("AvartarImg"));
                suppliers.add(supplier);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return suppliers;
    }

    public Supplier getSupplierById(int id) {
        Supplier supplier = null;
        String strSelectById = "select * from Supplier where SupplierID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                supplier = new Supplier();
                supplier.setSupplierId(rs.getInt("SupplierID"));
                supplier.setSupplierName(rs.getString("SupplierName"));
                supplier.setAccId(rs.getInt("AccID"));
                supplier.setDateBirth(rs.getString("DateBirth"));
                supplier.setGender(rs.getString("Gender"));
                supplier.setEmail(rs.getString("Email"));
                supplier.setPhone(rs.getString("Phone"));
                supplier.setShopName(rs.getString("ShopName"));
                supplier.setMainAddress(rs.getString("MainAddress"));
                supplier.setCityId(rs.getInt("CityID"));
                supplier.setBusinessLicense(rs.getString("BusinessLicense"));
                supplier.setAvartarImg(rs.getString("AvartarImg"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return supplier;
    }

}
// chưa test dao

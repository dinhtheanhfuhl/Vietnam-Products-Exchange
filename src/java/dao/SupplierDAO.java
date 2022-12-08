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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
        }
        return supplier;
    }

    public List<Supplier> getSupplierByProId(int productId) {

        String strSelectAll = "select * from Supplier inner join Product on Supplier.SupplierID=Product.SupplierID where Product.ProductID=?";
        List<Supplier> suplierProduct = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, productId);
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
                suplierProduct.add(supplier);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return suplierProduct;
    }

    public Supplier getSupplierByProId(String id) {
        Supplier supplier = null;
        String strSelectById = "select * from Supplier inner join Product on Supplier.SupplierID=Product.SupplierID where Product.ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setString(1, id);
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
            System.out.println(e.getMessage());
        }
        return supplier;
    }

    public List<Supplier> searchSupplier(String name, String shopName, String address, String phone, String email, String filter) {
        List<Supplier> suppliers = new ArrayList<>();
        String strSearch = "select * from Supplier where 1 = 1";
        if (name != null && !name.equals("")) {
            strSearch += " and SupplierName like N'%" + name + "%'";
        }
        if (shopName != null && !shopName.equals("")) {
            strSearch += " and ShopName like N'%" + shopName + "%'";
        }
        if (address != null && !address.equals("") && !address.equals("0")) {
            strSearch += " and CityID = " + address;
        }
        if (phone != null && !phone.equals("")) {
            strSearch += " and Phone like '" + phone + "%'";
        }
        if (email != null && !email.equals("")) {
            strSearch += " and Email like '%" + email + "%'";
        }
        if (filter != null && !filter.equals("") && !filter.equals("0")) {
            int status = Integer.parseInt(filter);
            strSearch += " and AccID in (select AccID from Account where status = " + status + ")";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(strSearch);
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
            System.out.println(e.getMessage());
        }
        return suppliers;
    }

    public Supplier getSupplierByAccId(int accId) {
        Supplier supplier = null;
        String strSelectById = "select * from Supplier where AccID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, accId);
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
            System.out.println(e.getMessage());
        }
        return supplier;
    }

    public List<String> getSuppliersNameInOrder(int orderID) {
        List<String> names = new ArrayList<>();
        String strSelectAll = "select DISTINCT s.SupplierID as id, s.ShopName as name from [Supplier] as s\n"
                + "join  [Product] as p on p.SupplierID = s.SupplierID\n"
                + "join [OrderDetail] as od on od.ProductID = p.ProductID\n"
                + "join [Order] as o on o.OrderID = od.OrderID\n"
                + "where o.OrderID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                names.add(name);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return names;
    }
}

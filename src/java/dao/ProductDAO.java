package dao;

import dbconnect.DBConnect;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private final Connection connection;

    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveProduct(Product product) {
        int status = 0;
        String strInsert
                = "insert into "
                + "Product(SupplierID,SubCateID,CreatedDate,RequestCode,ProductName,"
                + "BarCode,ProductCertificate,Trademark,Smell,Color,Weight,Packing,Element,StatusID)"
                + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setInt(1, product.getSupplierId());
            ps.setInt(2, product.getSubCateId());
            ps.setString(3, product.getCreatedDate());
            ps.setString(4, product.getRequestCode());
            ps.setString(5, product.getProductName());
            ps.setString(6, product.getBarCode());
            ps.setString(7, product.getProductCertificate());
            ps.setString(8, product.getTrademark());
            ps.setString(9, product.getSmell());
            ps.setString(10, product.getColor());
            ps.setInt(11, product.getWeight());
            ps.setString(12, product.getPacking());
            ps.setString(13, product.getElement());
            ps.setInt(14, product.getStatusId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int updateProduct(Product product) {
        int status = 0;
        String strUpdate = "update Product set SupplierID=?, SubCateID=?, CreatedDate=?, "
                + "RequestCode=?, ProductName=?, BarCode=?, ProductCertificate=?, Trademark=?, Smell=?, "
                + "Color=?, Weight=?, Packing=?, Element=?, StatusID=? where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setInt(1, product.getSupplierId());
            ps.setInt(2, product.getSubCateId());
            ps.setString(3, product.getCreatedDate());
            ps.setString(4, product.getRequestCode());
            ps.setString(5, product.getProductName());
            ps.setString(6, product.getBarCode());
            ps.setString(7, product.getProductCertificate());
            ps.setString(8, product.getTrademark());
            ps.setString(9, product.getSmell());
            ps.setString(10, product.getColor());
            ps.setInt(11, product.getWeight());
            ps.setString(12, product.getPacking());
            ps.setString(13, product.getElement());
            ps.setInt(14, product.getStatusId());
            ps.setInt(15, product.getProductId());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteProduct(Product product) {
        int status = 0;
        String strDelete = "delete from Product where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, product.getProductId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        String strSelectAll = "select * from Product";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductID"));
                product.setSupplierId(rs.getInt("SupplierID"));
                product.setSubCateId(rs.getInt("SubCateID"));
                product.setCreatedDate(rs.getString("CreatedDate"));
                product.setRequestCode(rs.getString("RequestCode"));
                product.setProductName(rs.getString("ProductName"));
                product.setBarCode(rs.getString("BarCode"));
                product.setProductCertificate(rs.getString("ProductCertificate"));
                product.setTrademark(rs.getString("Trademark"));
                product.setSmell(rs.getString("Smell"));
                product.setColor(rs.getString("Color"));
                product.setWeight(rs.getInt("Weight"));
                product.setPacking(rs.getString("Packing"));
                product.setElement(rs.getString("Element"));
                product.setStatusId(rs.getInt("StatusID"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return products;
    }

    public Product getProductById(int id) {
        Product product = null;
        String strSelectById = "select * from Product where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setProductId(rs.getInt("ProductID"));
                product.setSupplierId(rs.getInt("SupplierID"));
                product.setSubCateId(rs.getInt("SubCateID"));
                product.setCreatedDate(rs.getString("CreatedDate"));
                product.setRequestCode(rs.getString("RequestCode"));
                product.setProductName(rs.getString("ProductName"));
                product.setBarCode(rs.getString("BarCode"));
                product.setProductCertificate(rs.getString("ProductCertificate"));
                product.setTrademark(rs.getString("Trademark"));
                product.setSmell(rs.getString("Smell"));
                product.setColor(rs.getString("Color"));
                product.setWeight(rs.getInt("Weight"));
                product.setPacking(rs.getString("Packing"));
                product.setElement(rs.getString("Element"));
                product.setStatusId(rs.getInt("StatusID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }
}

// lỗi phần update mãi đéo fixx đc cmnn

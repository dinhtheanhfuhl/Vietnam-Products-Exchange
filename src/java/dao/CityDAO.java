package dao;

import entity.City;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CityDAO {

    private final Connection connection;

    public CityDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveCity(City city) {
        int status = 0;
        String strInsert = "insert into City(CityName) values(?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setString(1, city.getCityName());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int updateCity(City city) {
        int status = 0;
        String strUpdate = "update City set CityName=? where CityID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, city.getCityName());
            ps.setInt(2, city.getCityId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int deleteCity(City city) {
        int status = 0;
        String strDelete = "delete from City where CityID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, city.getCityId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return status;
    }

    public List<City> getAllCity() {
        List<City> citys = new ArrayList<>();
        String strSelectAll = "select * from City";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                City city = new City();
                city.setCityId(rs.getInt("CityID"));
                city.setCityName(rs.getString("CityName"));
                citys.add(city);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return citys;
    }

    public City getCityById(int id) {
        City city = null;
        String strSelectById = "select * from City where CityID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                city = new City();
                city.setCityId(rs.getInt("CityID"));
                city.setCityName(rs.getString("CityName"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return city;
    }

    public List<City> getCitiesByProductId(int productId) {

        String strSelectAll = "select * from City INNER JOIN Supplier ON City.CityID = Supplier.CityID \n"
                + "INNER JOIN Product on Supplier.SupplierID = Product.SupplierID where Product.ProductID=?";

        List<City> productCities = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                City city = new City();
                city.setCityId(rs.getInt("CityID"));
                city.setCityName(rs.getString("CityName"));
                productCities.add(city);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productCities;
    }

}

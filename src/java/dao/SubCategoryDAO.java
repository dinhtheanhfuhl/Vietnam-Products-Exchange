/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.SubCategory;
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
public class SubCategoryDAO {

    private final Connection connection;

    public SubCategoryDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveSubCategory(SubCategory subCategory) {
        int status = 0;
        String strInsert = "insert into SubCategory(SubCateName, CateID) values(?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(strInsert);
            ps.setString(1, subCategory.getSubCateName());
            ps.setInt(2, subCategory.getCateId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int updateSubCategory(SubCategory subCategory) {
        int status = 0;
        String strUpdate = "update SubCategory set SubCateName=?, CateID=? where SubCateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, subCategory.getSubCateName());
            ps.setInt(2, subCategory.getCateId());
            ps.setInt(3, subCategory.getSubCateId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteSubCategory(SubCategory subCategory) {
        int status = 0;
        String strDelete = "delete from SubCategory where SubCateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, subCategory.getSubCateId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<SubCategory> getAllCategory() {
        List<SubCategory> subCategorys = new ArrayList<>();
        String strSelectAll = "select * from SubCategory";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubCategory subCategory = new SubCategory();
                subCategory.setSubCateId(rs.getInt("SubCateID"));
                subCategory.setSubCateName(rs.getString("SubCateName"));
                subCategory.setCateId(rs.getInt("CateID"));
                subCategorys.add(subCategory);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return subCategorys;
    }

    public SubCategory getSubCategoryById(int id) {
        SubCategory subCategory = null;
        String strSelectById = "select * from SubCategory where SubCateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                subCategory = new SubCategory();
                subCategory.setSubCateId(rs.getInt("SubCateID"));
                subCategory.setSubCateName(rs.getString("SubCateName"));
                subCategory.setCateId(rs.getInt("CateID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return subCategory;
    }
}
// chưa test dao

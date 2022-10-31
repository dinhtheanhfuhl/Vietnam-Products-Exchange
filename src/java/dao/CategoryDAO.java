
package dao;
import java.sql.*;
import entity.Category;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private final Connection connection;

    public CategoryDAO(Connection connection) {
        this.connection = connection;
    }
    
    public int saveCategory(Category category) {
        int status = 0;
        String strInsert = "insert into Category(CateName) values(?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setString(1, category.getCateName());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int updateCategory(Category category) {
        int status = 0;
        String strUpdate = "update Category set CateName=? where CateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, category.getCateName());
            ps.setInt(2, category.getCateId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteCategory(Category category) {
        int status = 0;
        String strDelete = "delete from Category where CateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, category.getCateId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        return status;
    }

    public List<Category> getAllCategory() {
        List<Category> categorys = new ArrayList<>();
        String strSelectAll = "select * from Category";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCateId(rs.getInt("CateID"));
                category.setCateName(rs.getString("CateName"));
                categorys.add(category);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return categorys;
    }

    public Category getCategoryById(int id) {
        Category category = null;
        String strSelectById = "select * from Category where CateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                category = new Category();
                category.setCateId(rs.getInt("CateID"));
                category.setCateName(rs.getString("CateName"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return category;
    }
}

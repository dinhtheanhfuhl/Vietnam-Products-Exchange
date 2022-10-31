package dao;

import dbconnect.DBConnect;
import entity.SystemManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SystemManagerDAO {
    private final Connection connection;

    public SystemManagerDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveSystemManager(SystemManager systemManager) {
        int status = 0;
        String strInsert
                = "insert into "
                + "SystemManager(Name,AccID,DateBirth,Gender,Email,Phone,AvartarImg)"
                + " values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps
                    = connection.prepareStatement(strInsert);
            ps.setString(1, systemManager.getName());
            ps.setInt(2, systemManager.getAccId());
            ps.setString(3, systemManager.getDateBirth());
            ps.setString(4, systemManager.getGender());
            ps.setString(5, systemManager.getEmail());
            ps.setString(6, systemManager.getPhone());
            ps.setString(7, systemManager.getAvartarImg());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int updateSystemManager(SystemManager systemManager) {
        int status = 0;
        String strUpdate
                = "update SystemManager set "
                + "Name=?, AccID=?, DateBirth=?, Gender=?, Email=?, Phone=?, AvartarImg=? where ID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, systemManager.getName());
            ps.setInt(2, systemManager.getAccId());
            ps.setString(3, systemManager.getDateBirth());
            ps.setString(4, systemManager.getGender());
            ps.setString(5, systemManager.getEmail());
            ps.setString(6, systemManager.getPhone());
            ps.setString(7, systemManager.getAvartarImg());
            ps.setInt(8, systemManager.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public int deleteSystemManager(SystemManager systemManager) {
        int status = 0;
        String strDelete = "delete from SystemManager where ID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strDelete);
            ps.setInt(1, systemManager.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public List<SystemManager> getAllSystemManager() {
        List<SystemManager> systemManagers = new ArrayList<>();
        String strSelectAll = "select * from SystemManager";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectAll);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SystemManager systemManager = new SystemManager();
                systemManager.setId(rs.getInt("ID"));
                systemManager.setName(rs.getString("Name"));
                systemManager.setAccId(rs.getInt("AccID"));
                systemManager.setDateBirth(rs.getString("DateBirth"));
                systemManager.setGender(rs.getString("Gender"));
                systemManager.setEmail(rs.getString("Email"));
                systemManager.setPhone(rs.getString("Phone"));
                systemManager.setAvartarImg(rs.getString("AvartarImg"));
                systemManagers.add(systemManager);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return systemManagers;
    }

    public SystemManager getSystemManagerById(int id) {
        SystemManager systemManager = null;
        String strSelectById = "select * from SystemManager where ID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(strSelectById);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                systemManager = new SystemManager();
                systemManager.setId(rs.getInt("ID"));
                systemManager.setName(rs.getString("Name"));
                systemManager.setAccId(rs.getInt("AccID"));
                systemManager.setDateBirth(rs.getString("DateBirth"));
                systemManager.setGender(rs.getString("Gender"));
                systemManager.setEmail(rs.getString("Email"));
                systemManager.setPhone(rs.getString("Phone"));
                systemManager.setAvartarImg(rs.getString("AvartarImg"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return systemManager;
    }
}
// chưa test dao
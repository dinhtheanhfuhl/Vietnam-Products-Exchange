package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

 
public class DBConnect {
    private static final String DB_URL = "jdbc:sqlserver://LAPTOP-AFFRQ6U2\\SQLEXPRESS:1433;"
            + "databaseName=vnprox;"
            + "encrypt=false";
    private static final String USER_NAME = "sa";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
            System.out.println("connect successfully!");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("connect failure!");
            ex.getMessage();
        }
        return conn;
    }
}

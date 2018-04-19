package model;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

    Connection conn;
    //netstat -an -P TCP
    public Connection getSQLServerConnection()
            throws SQLException, ClassNotFoundException {
        String hostName = "PS05671-Personal.mssql.somee.com";
        String sqlInstanceName = "SQL2008";
        String database = "PS05671-Personal";
        String userName = "Ps05671_SQLLogin_2";
        String password = "ugi6dnb52l";

        return getSQLServerConnection(hostName, sqlInstanceName, database, userName, password);
    }

    public Connection getSQLServerConnection(String hostName,
            String sqlInstanceName, String database, String userName,
            String password) {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            String connectionURL = "jdbc:sqlserver://" + hostName + ":1433" + ";instance=" + sqlInstanceName
                    + ";databaseName=" + database;

            conn = DriverManager.getConnection(connectionURL, userName, password);
//            System.out.println("thanh cong");
        } catch (Exception e) {
            System.out.println("that bai "+ e);
        }
        return conn;
    }

}

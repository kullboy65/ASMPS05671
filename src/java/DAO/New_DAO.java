/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Connect;

/**
 *
 * @author PC
 */
public class New_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public String getCountDB(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "SELECT Count FROM Staffs WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            String countDB = "";
            while (rs.next()) {
                countDB = rs.getString(1);
            }
            return countDB;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    public String getRecordNow(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "SELECT Count(Type)FROM Records WHERE StaffId = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            String resordnow = "";
            while (rs.next()) {
                resordnow = rs.getString(1);
            }
            return resordnow;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    public void updateCountDB(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Count(Type)FROM Records WHERE StaffId = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            int resordnow = 0;
            while (rs.next()) {
                resordnow = rs.getInt(1);
            }

            String sql2 = "UPDATE Staffs SET Count = ? WHERE Id = ?";
            stmt = conn.prepareStatement(sql2);
            //SET
            stmt.setInt(1, resordnow + 1);
            stmt.setString(2, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public String sosanh(String countDB, String Now) {
        int so1 = Integer.parseInt(countDB);
        int so2 = Integer.parseInt(Now);
        int sothongbao = 0;
        if (so2 > so1) {
            sothongbao = so2 - so1;
        }
        return "so thong bao moi la: " + String.valueOf(sothongbao);
    }



    public static void main(String[] args) {
        New_DAO dao = new New_DAO();
//        dao.updateCountDB("8");
        System.out.println(dao.sosanh(dao.getCountDB("6"), dao.getRecordNow("6")));
    }
}

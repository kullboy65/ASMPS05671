/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Connect;

/**
 *
 * @author PC
 */
public class DeptRecord_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public String countRecord(int type, String year, String id) {
        String count = "0";
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "SELECT COUNT(Records.Type)\n"
                    + "FROM Records INNER JOIN\n"
                    + "Staffs ON Records.StaffId = Staffs.Id INNER JOIN\n"
                    + "Departs ON Staffs.DepartId = Departs.Id\n"
                    + "WHERE Records.Type = ? AND YEAR(Records.Date)=? AND Departs.Id like ?\n"
                    + "GROUP BY Records.Type, Departs.Id";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, type);
            stmt.setString(2, year);
            stmt.setString(3, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import bean.Emp;
import bean.Record;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Connect;

/**
 *
 * @author PC
 */
public class Record_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public void insert(Record record) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "INSERT INTO Records values(?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);

            int danhgia;
            if (record.getLike()) {
                danhgia = 1;
            } else {
                danhgia = -1;
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date = new Date();

            stmt.setInt(1, danhgia);
            stmt.setString(2, record.getReason());
            stmt.setString(3, record.getDate());
            stmt.setString(4, record.getId());
            stmt.setString(5, dateFormat.format(date));
            stmt.setBoolean(6, false);
            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }


    public ArrayList<Record> getListRecord(String user, String dept) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT DISTINCT Staffs.Name, Staffs.Username, Records.StaffId, Departs.Name AS Expr1, Staffs.photo\n"
                    + "FROM Departs INNER JOIN\n"
                    + "Staffs ON Departs.Id = Staffs.DepartId INNER JOIN\n"
                    + "Records ON Staffs.Id = Records.StaffId\n"
                    + "WHERE (Staffs.Name like ? or Staffs.Username like ?) and Departs.Id like ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + user + "%");
            stmt.setString(2, "%" + user + "%");
            stmt.setString(3, "%" + dept + "%");
            rs = stmt.executeQuery();
            ArrayList<Record> list = new ArrayList<>();

            while (rs.next()) {
                Record rd = new Record();
                rd.setName(rs.getString(1));
                rd.setUsername(rs.getString(2));
                rd.setId(rs.getString(3));
                rd.setDepartment(rs.getString(4));
                rd.setPhoto(rs.getString(5));
                list.add(rd);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public String countRecord(int type, String StaffId, int year) {
        String count = "0";
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "SELECT COUNT(StaffId)\n"
                    + "FROM Records WHERE Type = ? AND StaffId = ? and YEAR(Date)= ?\n"
                    + "GROUP BY StaffId";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, type);
            stmt.setInt(3, year);
            stmt.setString(2, StaffId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public ArrayList<Record> recordUser(String StaffId, int year) {
        ArrayList<Record> list = new ArrayList<>();
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "SELECT Records.Id, Records.Date, Records.Reason, Records.Type, Staffs.Name\n"
                    + "FROM Records INNER JOIN\n"
                    + "Staffs ON Records.StaffId = Staffs.Id \n"
                    + "WHERE Records.StaffId = ? and YEAR(Records.Date)= ? ORDER BY Records.Date desc";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, StaffId);
            stmt.setInt(2, year);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Record rd = new Record();
                rd.setId(rs.getString(1));
                rd.setName(rs.getString(5));
                rd.setDate(rs.getString(2));
                rd.setReason(rs.getString(3));
                rd.setLike(rs.getString(4).equals("1"));
                list.add(rd);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public String getMinyear(String id) {
        String year = "";
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "SELECT TOP 1 YEAR(Date)FROM Records WHERE StaffId = ? ORDER BY YEAR(Date)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                year = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return year;
    }

    public static void main(String[] args) {
        try {
            Record_DAO record_dao = new Record_DAO();
//            Record r = new Record();
//            r.setId("8");
//            r.setDate("15-02-2017");
//            r.setReason("loi");
//            r.setLike(true);
//            record_dao.insert(r);

            List l = record_dao.getListRecord("", "");
            for (int i = 0; i < l.size(); i++) {
                Record p = (Record) l.get(i);
                System.out.println(p.getName());
            }
            
//            System.out.println(record_dao.countRecord(-1, "6"));
//            System.out.println(record_dao.getMinyear("8"));
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}

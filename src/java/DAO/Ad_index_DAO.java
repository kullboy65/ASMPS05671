/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import bean.Emp;
import bean.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Connect;
import model.function;

/**
 *
 * @author PC
 */
public class Ad_index_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public void Insert(Notification n) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "INSERT INTO Notification VALUES(?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, n.getSubject());
            stmt.setString(2, n.getDetail());
            stmt.setString(3, n.getIdStaff());
            stmt.setString(4, dateFormat.format(date));
            stmt.setBoolean(5, false);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void Delete(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Notification SET isdelete = 1 WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public ArrayList<Notification> getListNotification() {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Notification.Id, Notification.Subject, Notification.Detail, Notification.idStaffs, Staffs.Photo, CONVERT(VARCHAR(5),Notification.Date,108)+' '+ CONVERT(char(10), GetDate(),126)\n"
                    + "FROM Notification INNER JOIN\n"
                    + "Staffs ON Notification.idStaffs = Staffs.Id\n"
                    + "WHERE Notification.isdelete = 0 ORDER BY Notification.Date DESC";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            ArrayList<Notification> list = new ArrayList<>();

            while (rs.next()) {
                Notification noti = new Notification();
                noti.setId(rs.getString(1));
                noti.setSubject(rs.getString(2));
                noti.setDetail(rs.getString(3));
                noti.setIdStaff(rs.getString(4));
                noti.setPhoto(rs.getString(5));
                noti.setDate(rs.getString(6));
                list.add(noti);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        Notification n = new Notification();
        n.setSubject("sad");
        n.setDetail("sd");
        n.setIdStaff("8");
        Ad_index_DAO dao = new Ad_index_DAO();
        dao.Insert(n);
    }

}

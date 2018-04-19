/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import bean.Emp;
import bean.Facebook;
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
import model.function;

/**
 *
 * @author PC
 */
public class Facebook_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public void Insert(Facebook fb) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "INSERT INTO Facebook VALUES(?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, fb.getText());
            stmt.setString(2, fb.getImage());
            stmt.setString(3, fb.getMedia());
            stmt.setString(4, fb.getIdStaff());
            stmt.setBoolean(5, fb.getRole());
            stmt.setString(6, dateFormat.format(date));
            stmt.setBoolean(7, false);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public String getAvatar(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String avatar = "";
            String sql = "SELECT Avatar FROM Staffs WHERE isdelete = 0 AND Id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                avatar = rs.getString(1);
            }
            return avatar;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }

    }

    public ArrayList<Facebook> getNewFeed(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Facebook.id, Facebook.text, Facebook.image, Facebook.media, \n"
                    + "Staffs.Username, Facebook.role, Facebook.Date, Staffs.Id, Staffs.Avatar\n"
                    + "FROM Facebook INNER JOIN \n"
                    + "Staffs ON Facebook.idStaff = Staffs.Id\n"
                    + "WHERE (Facebook.idStaff = ? OR (Facebook.idStaff != ?  AND Facebook.role = 1)) AND (Facebook.isdelete = 0)\n"
                    + "ORDER BY Facebook.Date DESC";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, id);
            rs = stmt.executeQuery();
            ArrayList<Facebook> list = new ArrayList<>();

            while (rs.next()) {
                Facebook fb = new Facebook();
                fb.setId(rs.getString(1));
                fb.setText(rs.getString(2));
                fb.setImage(rs.getString(3));
                fb.setMedia(rs.getString(4));
                fb.setUsername(rs.getString(5));
                fb.setRole(rs.getBoolean(6));
                fb.setDate(rs.getString(7));
                fb.setIdStaff(rs.getString(8));
                fb.setAvatar(rs.getString(9));
                list.add(fb);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public void Delete(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Facebook SET isdelete = 1 WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public void seen(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Records SET See = 1 WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public String ChangePassword(String id, String oldpass, String newpass) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Staffs SET Password = ? WHERE Password = ? and Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, newpass);
            stmt.setString(2, oldpass);
            stmt.setString(3, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
        return newpass;
    }

    public static void main(String[] args) {
        Facebook_DAO fbdao = new Facebook_DAO();
//        List<Facebook> listnewfeed = fbdao.getNewFeed("3");
//        for (Facebook fb : listnewfeed) {
//            System.out.println(fb.getText());
//
//        }
        System.out.println(fbdao.getAvatar("3"));
    }
}

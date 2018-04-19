/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import bean.Emp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import model.Connect;

/**
 *
 * @author PC
 */
public class Login_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    // kiểm tra đăng nhập
    public Emp login(String username, String password) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "SELECT Id FROM Staffs WHERE Username = ? AND Password= ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Emp_DAO empdao = new Emp_DAO();
                Emp u = empdao.getEmp(rs.getString(1));
                return u;
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return null;
    }

    public String resetPassword(String username) {
        String newpass = this.Random();
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Staffs SET Password = ? WHERE Username = ? and isdelete = 0";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, newpass);
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
        return newpass;
    }

    public String Random() {
        Random rd = new Random();
        int a = rd.nextInt(1000);
        String str1 = String.valueOf(a);
        int b = rd.nextInt(1000);
        String str2 = String.valueOf(b);
        int c = rd.nextInt(1000);
        String random = (str1 + str2);
        return random;
    }

    public static void main(String[] args) {
        try {
//            Login_DAO dao = new Login_DAO();
//            Emp e = dao.login("admin", "admin");
//            System.out.println(e.getName());

            Emp_DAO empdao = new Emp_DAO();
            Emp u = empdao.getEmp("3");
            String gioitinh;
            if (u.getGender()) {
                gioitinh = "nam";
            } else {
                gioitinh = "nu";
            }
            System.out.println(gioitinh);
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}

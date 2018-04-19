/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import bean.Dept;
import bean.Emp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Connect;
import model.function;

/**
 *
 * @author PC
 */
public class Dept_DAO {
    
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;
    
    public ArrayList<Dept> getListDept() {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            
            String sql = "SELECT Id, Name FROM Departs WHERE isdelete=0";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            ArrayList<Dept> list = new ArrayList<>();
            
            while (rs.next()) {
                Dept dept = new Dept();
                dept.setId(rs.getString(1));
                dept.setName(rs.getString(2));
                list.add(dept);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }
//----------------------------------------------------

    public void insertDept(Dept dept) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "INSERT INTO Departs VALUES(?,?,?)";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, dept.getId());
            stmt.setString(2, dept.getName());
            stmt.setBoolean(3, false);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

//    public Emp Edit(String id) {
//        try {
//            Connect a = new Connect();
//            conn = a.getSQLServerConnection();
//
//            String sql = "SELECT userID, Name, mark, major FROM Emp WHERE userID = ?";
//            stmt = conn.prepareStatement(sql);
//            stmt.setString(1, id);
//            rs = stmt.executeQuery();
//            Emp emp = new Emp();
//
//            while (rs.next()) {
//                emp.setId(rs.getString(1));;
//            }
//            return emp;
//        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    public void updateDept(Dept dept) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Departs SET Name = ? WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, dept.getName());
            stmt.setString(2, dept.getId());

            //------------------------------
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }
    
    public void delDept(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Departs SET isDelete = 1 WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
    }
    
    public String idDept(String name) {
        try {
            String ln = "";
            String ten = function.Bodau(name).toLowerCase().trim();
            if (ten.contains("phong")) {
                ten = ten.replace("phong", " ");
            }
            String arr[] = ten.trim().split(" ");
            for (String arr1 : arr) {
                ln = ln + (arr1.substring(0, 1));
            }
            String user = ln;
            String username = user.toUpperCase();
            int i = 2;
            String username1 = username;
            while (true) {
                Connect a = new Connect();
                conn = a.getSQLServerConnection();
                String sql = "Select Id from Departs where Id like ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    username = username1 + String.valueOf(i);
                    i++;
                } else {
                    break;
                }
            }
            return username;
        } catch (Exception e) {
            System.out.println(e);
            return "";
        }
    }
    
    public static void main(String[] args) {
        Dept_DAO dao = new Dept_DAO();
//        System.out.println(dao.idDept("Quan He Cong Chúng"));
        dao.delDept("SX");
    }
}

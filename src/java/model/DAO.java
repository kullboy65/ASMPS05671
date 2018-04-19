///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package model;
//
//import bean.student;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
///**
// *
// * @author PC
// */
//public class DAO {
//
//    private Connection conn;
//    private ResultSet rs;
//    private PreparedStatement stmt;
//
//    public ArrayList<student> getListUsers() {
//        try {
//            Connect a = new Connect();
//            conn = a.getSQLServerConnection();
//
//            String sql = "SELECT userID, Name, mark, major FROM Emp WHERE isDelete = 0";
//            stmt = conn.prepareStatement(sql);
//            rs = stmt.executeQuery();
//            ArrayList<student> list = new ArrayList<>();
//
//            while (rs.next()) {
//                student users = new student();
//                users.setId(rs.getInt(1));
//                users.setName(rs.getString(2));
//                users.setMark(rs.getString(3));
//                users.setMajor(rs.getString(4));
//                list.add(users);
//            }
//            return list;
//        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public void Insert(String name, String mark, String major) {
//        try {
//            Connect a = new Connect();
//            conn = a.getSQLServerConnection();
//            String sql = "INSERT INTO Emp VALUES(?,?,?,?)";
//            stmt = conn.prepareStatement(sql);
//            //SET
//            stmt.setString(1, name);
//            stmt.setString(2, mark);
//            stmt.setString(3, major);
//            stmt.setBoolean(4, false);
//            stmt.executeUpdate();
//        } catch (SQLException | ClassNotFoundException e) {
//        }
//    }
//
//    public student Edit(String id) {
//        try {
//            Connect a = new Connect();
//            conn = a.getSQLServerConnection();
//
//            String sql = "SELECT userID, Name, mark, major FROM Emp WHERE userID = ?";
//            stmt = conn.prepareStatement(sql);
//            stmt.setString(1, id);
//            rs = stmt.executeQuery();
//            student users = new student();
//
//            while (rs.next()) {
//                users.setId(rs.getInt(1));
//                users.setName(rs.getString(2));
//                users.setMark(rs.getString(3));
//                users.setMajor(rs.getString(4));
//            }
//            return users;
//        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public void Update(int id, String name, String mark, String major) {
//        try {
//            Connect a = new Connect();
//            conn = a.getSQLServerConnection();
//            String sql = "UPDATE Emp SET Name = ?,mark = ?,major = ? WHERE userID = ?";
//            stmt = conn.prepareStatement(sql);
//            //SET
//            stmt.setString(1, name);
//            stmt.setString(2, mark);
//            stmt.setString(3, major);
//            stmt.setInt(4, id);
//            stmt.executeUpdate();
//        } catch (SQLException | ClassNotFoundException e) {
//        }
//    }
//
//    public void Delete(int id) {
//        try {
//            Connect a = new Connect();
//            conn = a.getSQLServerConnection();
//            String sql = "UPDATE Emp SET isDelete = 1 WHERE userID = ?";
//            stmt = conn.prepareStatement(sql);
//            //SET
//            stmt.setInt(1, id);
//            stmt.executeUpdate();
//        } catch (SQLException | ClassNotFoundException e) {
//        }
//    }
//}

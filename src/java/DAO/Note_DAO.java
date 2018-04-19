/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import bean.Note;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Connect;

/**
 *
 * @author PC
 */
public class Note_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public void insert(String idStaff, String note) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "INSERT INTO Notes values(?,?,?,?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, note);
            stmt.setString(2, "");
            stmt.setString(3, idStaff);
            stmt.setBoolean(4, false);

            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void Delete(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Notes SET isdelete = 1 WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public void Check(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "select Checked from Notes where Checked = 'checked' and Id = ? ";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                String sql_bocheck = "UPDATE Notes SET Checked = '' WHERE Id = ?";
                stmt = conn.prepareStatement(sql_bocheck);
                stmt.setString(1, id);
                stmt.executeUpdate();
            } else {
                String sql_check = "UPDATE Notes SET Checked = 'checked' WHERE Id = ?";
                stmt = conn.prepareStatement(sql_check);
                stmt.setString(1, id);
                stmt.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<Note> getListCheck() {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Id, Note, Checked, idStaff FROM Notes WHERE isdelete = 0";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            ArrayList<Note> list = new ArrayList<>();

            while (rs.next()) {
                Note n = new Note();
                n.setId(rs.getString(1));
                n.setNote(rs.getString(2));
                n.setChecked(rs.getString(3));
                n.setIdStaff(rs.getString(4));
                list.add(n);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        Note_DAO dao = new Note_DAO();
        dao.Check("4");
    }
}

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
import java.util.ArrayList;
import model.Connect;
import model.function;

/**
 *
 * @author PC
 */
public class Emp_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public ArrayList<Emp> getListEmp() {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Staffs.Id, Staffs.Name, Staffs.Gender, Staffs.Birthday, Staffs.Photo, Staffs.Email, Staffs.Phone, Staffs.Salary, Staffs.Username, Staffs.Password, Staffs.Role, \n"
                    + "Departs.Name AS Dept, Staffs.Notes\n"
                    + "FROM Departs INNER JOIN\n"
                    + "Staffs ON Departs.Id = Staffs.DepartId\n"
                    + "WHERE Staffs.isdelete=0 and Departs.isdelete=0";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            ArrayList<Emp> list = new ArrayList<>();

            while (rs.next()) {
                Emp emp = new Emp();
                emp.setId(rs.getString(1));
                emp.setName(rs.getString(2));
                emp.setGender(rs.getBoolean(3));
                emp.setBirthday(rs.getString(4));
                emp.setPhoto(rs.getString(5));
                emp.setEmail(rs.getString(6));
                emp.setPhone(rs.getString(7));
                emp.setSalary(rs.getInt(8));
                emp.setUsername(rs.getString(9));
                emp.setPassword(rs.getString(10));
                emp.setRole(rs.getString(11));
                emp.setDepartment(rs.getString(12));
                emp.setNotes(rs.getString(13));
                list.add(emp);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public Emp getEmp(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Staffs.Id, Staffs.Name, Staffs.Gender, Staffs.Birthday, Staffs.Photo, Staffs.Email, Staffs.Phone, Staffs.Salary, Staffs.Username, Staffs.Password, Staffs.Role, \n"
                    + "Departs.Name AS Dept, Staffs.Notes\n"
                    + "FROM Departs INNER JOIN\n"
                    + "Staffs ON Departs.Id = Staffs.DepartId\n"
                    + "WHERE Staffs.Id=? and Staffs.isdelete=0 and Departs.isdelete=0";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();

            Emp emp = new Emp();
            while (rs.next()) {
                emp.setId(rs.getString(1));
                emp.setName(rs.getString(2));
                emp.setGender(rs.getBoolean(3));
                emp.setBirthday(rs.getString(4));
                emp.setPhoto(rs.getString(5));
                emp.setEmail(rs.getString(6));
                emp.setPhone(rs.getString(7));
                emp.setSalary(rs.getInt(8));
                emp.setUsername(rs.getString(9));
                emp.setPassword(rs.getString(10));
                emp.setRole(rs.getString(11));
                emp.setDepartment(rs.getString(12));
                emp.setNotes(rs.getString(13));
            }
            return emp;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public void Insert(Emp emp) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "INSERT INTO Staffs VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, emp.getName());
            stmt.setBoolean(2, emp.getGender());
            stmt.setString(3, emp.getBirthday());
            stmt.setString(4, emp.getPhoto());
            stmt.setString(5, emp.getEmail());
            stmt.setString(6, emp.getPhone());
            stmt.setInt(7, emp.getSalary());
            stmt.setString(8, "");
            stmt.setString(9, emp.getDepartment());
            stmt.setString(10, emp.getUsername());
            stmt.setString(11, "123");
            stmt.setString(12, emp.getRole());
            stmt.setBoolean(13, false);
            stmt.setString(14, emp.getPhoto());
            stmt.setInt(15, 0);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
//----------------------------------------------------------

    public void Update(Emp emp) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Staffs SET Name =?, Birthday =?, Photo =?, Email =?, Phone =?, Salary =?, DepartId =?, Username =?, Role =?, Gender =? WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, emp.getName());
            stmt.setString(2, emp.getBirthday());
            stmt.setString(3, emp.getPhoto());
            stmt.setString(4, emp.getEmail());
            stmt.setString(5, emp.getPhone());
            stmt.setInt(6, emp.getSalary());
            stmt.setString(7, emp.getDepartment());
            stmt.setString(8, emp.getUsername());
            stmt.setString(9, emp.getRole());
            stmt.setBoolean(10, emp.getGender());

            //------------------------------
            stmt.setString(11, emp.getId());
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public void Delete(int id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Staffs SET isdelete = 1 WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public void updateAvatar(int id, String src) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Staffs SET Avatar = ? WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, src);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public void Note(String note, int id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();
            String sql = "UPDATE Staffs SET Notes = ? WHERE Id = ?";
            stmt = conn.prepareStatement(sql);
            //SET
            stmt.setString(1, note);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    public String User(String name) {
        try {
            String fn = null;
            String ln = "";
            String arr[] = function.Bodau(name.toLowerCase()).split(" ");
            for (String arr1 : arr) {
                ln = ln + (arr1.substring(0, 1));
                fn = arr1;
            }
            String user = fn + ln;
            String username = (user).substring(0, user.length() - 1);
            int i = 2;
            String username1 = username;
            while (true) {
                Connect a = new Connect();
                conn = a.getSQLServerConnection();
                String sql = "Select Username from Staffs where Username like ? AND isdelete=0";
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

    public ArrayList<Emp> getListEmpTOP10() {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Staffs.Id, Staffs.Name, Staffs.Gender, Staffs.Birthday, Staffs.Photo, Staffs.Email, Staffs.Phone, Staffs.Salary, Staffs.Username, Staffs.Password, Staffs.Role, \n"
                    + "Departs.Name AS Dept, Staffs.Notes\n"
                    + "FROM Departs INNER JOIN\n"
                    + "Staffs ON Departs.Id = Staffs.DepartId\n"
                    + "WHERE Staffs.isdelete=0 and Departs.isdelete=0";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            ArrayList<Emp> list = new ArrayList<>();

            while (rs.next()) {
                Emp emp = new Emp();
                emp.setId(rs.getString(1));
                emp.setName(rs.getString(2));
                emp.setGender(rs.getBoolean(3));
                emp.setBirthday(rs.getString(4));
                emp.setPhoto(rs.getString(5));
                emp.setEmail(rs.getString(6));
                emp.setPhone(rs.getString(7));
                emp.setSalary(rs.getInt(8));
                emp.setUsername(rs.getString(9));
                emp.setPassword(rs.getString(10));
                emp.setRole(rs.getString(11));
                emp.setDepartment(rs.getString(12));
                emp.setNotes(rs.getString(13));
                list.add(emp);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        Emp emp = new Emp();
//        emp.setName("fsdaf");
//        emp.setBirthday("12-01-1997");
//        emp.setEmail("asdS");
//        emp.setGender(true);
//        emp.setUsername("saf");
//        emp.setSalary(700000000);
//        emp.setDepartment("KD");
//        emp.setRole("dfasdf");
//        emp.setPhoto("fasdfasd");
//        emp.setPhone("01558");
//        Emp_DAO dao = new Emp_DAO();
//        List l = dao.getListEmp();
//        Collections.sort(l, get);
//        Emp emp = dao.getEmp("3");
//        System.out.println(emp.getEmail());
//        System.out.println(emp.getName());
//        try {
//            System.out.println(dao.User("phan phu kiet"));
//        } catch (Exception e) {
//            System.out.println(e);
//        }

    }
}

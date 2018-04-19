/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import bean.Dept;
import bean.DonutChart;
import bean.LineChart;
import bean.TasksPanel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Connect;
import model.function;

/**
 *
 * @author PC
 */
public class Chart_DAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public ArrayList getDonutChart() {
        String year = function.Date("yyyy");

        Dept_DAO dept_daochart = new Dept_DAO();
        DeptRecord_DAO deptrecord_dao = new DeptRecord_DAO();
        List l = dept_daochart.getListDept();

        ArrayList<DonutChart> list = new ArrayList<>();
        int total;
        for (int i = 0; i < l.size(); i++) {
            Dept p = (Dept) l.get(i);
            total = Integer.parseInt(deptrecord_dao.countRecord(1, year, p.getId())) - Integer.parseInt(deptrecord_dao.countRecord(-1, year, p.getId()));
            if (total >= 0) {
                DonutChart donutchart = new DonutChart();
                donutchart.setNamedept(p.getName());
                donutchart.setValue(total);
                list.add(donutchart);
            }
        }
        return list;
    }

    public ArrayList getLineChart() {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "Select Date, Count(Type) From dbo.Records where YEAR(Date) = YEAR(GETDATE()) group by Date";
            stmt = conn.prepareStatement(sql);

            rs = stmt.executeQuery();
            ArrayList<LineChart> list = new ArrayList<>();
            while (rs.next()) {
                LineChart lchart = new LineChart();
                lchart.setDate(rs.getString(1));
                lchart.setValue(rs.getString(2));
                list.add(lchart);
            }
            return list;
        } catch (Exception e) {
            return null;
        }
    }

    public ArrayList<TasksPanel> getListTask(String id) {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT Staffs.Id, Staffs.Name, Staffs.Username, Records.Type, DATEDIFF (minute, Records.Currenttime, GETDATE())as ct, Records.Reason ,Records.Date, Records.See, Records.Id\n"
                    + "FROM Records INNER JOIN Staffs ON Records.StaffId = Staffs.Id \n"
                    + "WHERE Staffs.Id = ? AND YEAR(Records.Date)= YEAR(GETDATE())\n"
                    + "ORDER BY ct";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            ArrayList<TasksPanel> list = new ArrayList<>();

            while (rs.next()) {
                TasksPanel task = new TasksPanel();
                task.setUserID(rs.getInt(1));
                task.setName(rs.getString(2));
                task.setUsername(rs.getString(3));
                task.setType(rs.getString(4));
                task.setDate(rs.getString(7));
                task.setCurrenttime(rs.getString(5));
                task.setReason(rs.getString(6));
                task.setSee(rs.getBoolean(8));
                task.setId(rs.getString(9));
                list.add(task);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<TasksPanel> getListTask() {
        try {
            Connect a = new Connect();
            conn = a.getSQLServerConnection();

            String sql = "SELECT TOP 10 Staffs.Id, Staffs.Name, Staffs.Username, Records.Type, DATEDIFF (minute, Records.Currenttime, GETDATE())as ct, CONVERT(char(10), Records.Currenttime,105)\n"
                    + "FROM Records INNER JOIN Staffs ON Records.StaffId = Staffs.Id ORDER BY ct";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            ArrayList<TasksPanel> list = new ArrayList<>();

            while (rs.next()) {
                TasksPanel task = new TasksPanel();
                task.setUserID(rs.getInt(1));
                task.setName(rs.getString(2));
                task.setUsername(rs.getString(3));
                task.setType(rs.getString(4));
                task.setDate(rs.getString(6));
                task.setCurrenttime(rs.getString(5));
                list.add(task);
            }
            return list;
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        Chart_DAO dao = new Chart_DAO();
        Chart_DAO chart_dao = new Chart_DAO();
//        List listvalue = chart_dao.getDonutChart();
//        for (int i = 0; i < listvalue.size(); i++) {
//            DonutChart d = (DonutChart) listvalue.get(i);
//            System.out.println(d.getNamedept());
//            System.out.println(d.getValue());
//        }
        List list = dao.getListTask();
        for (int i = 0; i < list.size(); i++) {
            TasksPanel d = (TasksPanel) list.get(i);
            System.out.println(d.getDate());
        }

//        List listvalue = chart_dao.getLineChart();
//        for (int i = 0; i < listvalue.size(); i++) {
//            LineChart d = (LineChart) listvalue.get(i);
//            System.out.println(d.getDate());
//            System.out.println(d.getValue());
//        }
    }
}

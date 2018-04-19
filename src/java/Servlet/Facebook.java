/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.Chart_DAO;
import DAO.Emp_DAO;
import DAO.Facebook_DAO;
import DAO.Record_DAO;
import bean.TasksPanel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class Facebook extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (action.equalsIgnoreCase("setAvatar")) {
            String src = request.getParameter("src");
            Emp_DAO dao = new Emp_DAO();
            dao.updateAvatar(Integer.parseInt(id), src);
        } else if (action.equalsIgnoreCase("delPost")) {
            Facebook_DAO fbdao = new Facebook_DAO();
            fbdao.Delete(id);
        } else if (action.equalsIgnoreCase("seen")) {
            Facebook_DAO fbdao = new Facebook_DAO();
            fbdao.seen(id);
        } else if (action.equalsIgnoreCase("countlike")) {
            Record_DAO record_dao = new Record_DAO();
            String Like = record_dao.countRecord(1, id, 2017);
            String DiskLike = record_dao.countRecord(-1, id, 2017);
            String value
                    = "                                    <span class=\"text-primary\" style=\"font-size: 18px; font-weight: bold;\">" + Like + " <span class=\"fa fa-thumbs-o-up\" style=\"font-size: 22px;\"></span></span>\n"
                    + "                                    <span class=\"text-danger\" style=\"font-size: 18px; font-weight: bold;\">" + DiskLike + " <span class=\"fa fa-thumbs-o-down\" style=\"font-size: 22px;\"></span></span>";
            out.print(value);
        } else if (action.equalsIgnoreCase("reload")) {
            Chart_DAO dao = new Chart_DAO();
            List<TasksPanel> list = dao.getListTask(id);
            String data = "";
            String seen;
            String color;
            for (TasksPanel task : list) {
                if (task.getSee() == false) {
                    seen = "<i class=\"fa fa-bell-o text-danger pull-right\" style=\"font-size:18px\"></i>";
                } else {
                    seen = "";
                }
                if (task.getType().equals("fa fa-thumbs-o-up text-primary")) {
                    color = "class=\"text-primary\"";
                } else {
                    color = "class=\"text-danger\"";
                }
                data = data
                        + "                                            <li class=\"dropdown\" style=\"list-style-type:none;\">\n"
                        + "                                                <a href=\"#\" class=\"dropdown-toggle list-group-item\" data-toggle=\"dropdown\" onclick=\"Seen(" + task.getId() + ")\">\n"
                        + "                                                    <i class=\"" + task.getType() + "\" style=\"font-size:20px\"></i> On day: " + task.getDate() + " <span class=\"badge\">" + task.getCurrenttime() + "</span>\n"
                        + "                                                    " + seen + "\n"
                        + "                                                </a>\n"
                        + "                                                <ul class=\"dropdown-menu\" style=\"width: 200px; padding: 20px; margin-left: 200px;\">\n"
                        + "                                                    <p style=\"word-wrap: break-word;\" " + color + " >" + task.getReason() + "</p>\n"
                        + "                                                </ul>\n"
                        + "                                            </li>";
            }
            out.print(data);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

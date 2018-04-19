/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.Emp_DAO;
import bean.Emp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class Del_emp extends HttpServlet {

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
        String id = request.getParameter("id");

        Emp_DAO dao = new Emp_DAO();
        Emp emp = dao.getEmp(id);
        String data = "                <div class=\"modal-header\">\n"
                + "                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">x</button>\n"
                + "                    <h4 class=\"modal-title custom_align\" id=\"Heading\">Delete this entry</h4>\n"
                + "                </div>\n"
                + "                <div class=\"modal-body\">\n"
                + "                    <div class=\"alert alert-danger\"><span class=\"glyphicon glyphicon-warning-sign\"></span> Are you sure you want to delete \""+emp.getName()+"\" ?</div>\n"
                + "                </div>\n"
                + "                <div class=\"modal-footer \">\n"
                + "                    <a href=\"delete_emp.htm?id="+emp.getId()+"\" class=\"btn btn-success\" ><span class=\"glyphicon glyphicon-ok-sign\"></span> Yes</a>\n"
                + "                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"><span class=\"glyphicon glyphicon-remove\"></span> No</button>\n"
                + "                </div>";
        response.getWriter().write(data);
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

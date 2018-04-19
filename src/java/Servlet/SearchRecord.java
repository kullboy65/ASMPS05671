/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.Dept_DAO;
import DAO.Record_DAO;
import bean.Dept;
import bean.Record;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class SearchRecord extends HttpServlet {

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
        Record_DAO record_dao = new Record_DAO();
        String id = request.getParameter("id");
        String year = request.getParameter("year");
        String name = "";
        
        List l = record_dao.recordUser(id, Integer.parseInt(year));
        String type;
        String data = "";
        for (int i = 0; i < l.size(); i++) {
            Record p = (Record) l.get(i);
            if (p.getLike()) {
                type = "<p class=\"text-primary\"><span class=\"fa fa-thumbs-o-up\" style=\"font-size: 20px;\"></span></p>";
            } else {
                type = "<p class=\"text-danger\"><span class=\"fa fa-thumbs-o-down\" style=\"font-size: 20px;\"></span></p>";
            }
            name = p.getName();
            //------------------------------------------------------
            data = data
                    + "                                <tr>\n"
                    + "                                    <td>" + p.getDate() + "</td>\n"
                    + "                                    <td>" + p.getReason() + "</td>\n"
                    + "                                    <td>" + type + "</td>\n"
                    + "                                </tr>";
            //------------------------------------------------------
        }

        String html
                = "                <div class=\"modal-header\">\n"
                + "                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\n"
                + "                    <h4 class=\"modal-title custom_align\" id=\"Heading\">"+name+" Detail</h4>\n"
                + "                </div>"
                + "                 <div class=\"modal-body \">\n"
                + "                    <div class=\"col-xs-6\">\n"
                + "                        <div class=\"range range-success\" style=\"margin-bottom: 20px;\">\n"
                + "                            <input id=\"txtSearch\" type=\"range\" name=\"range\" min=\""+record_dao.getMinyear(id)+"\" max=\"" + Calendar.getInstance().get(Calendar.YEAR) + "\" value=\"" + year + "\" onchange=\"viewDetail(" + id + ",-1);rangeSuccess.value = value\">\n"
                + "                            <output id=\"rangeSuccess\">" + year + "</output>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "                    <div style=\"padding-top: 20px;\">\n"
                + "                        <p class=\"text-primary\" style=\"float: left; margin-left: 50px; margin-right: 50px; font-size: 18px; font-weight: bold;\">" + record_dao.countRecord(1, id, Integer.parseInt(year)) + " <span class=\"fa fa-thumbs-o-up\" style=\"font-size: 25px;\"></span></p>\n"
                + "                        <p class=\"text-danger\" style=\"font-size: 18px; font-weight: bold;\">" + record_dao.countRecord(-1, id, Integer.parseInt(year)) + " <span class=\"fa fa-thumbs-o-down\" style=\"font-size: 25px;\"></span></p>\n"
                + "                    </div>\n"
                + "                        <table class=\"table table-hover\">\n"
                + "                            <thead>\n"
                + "                                <tr>\n"
                + "                                    <th>Operation date</th>\n"
                + "                                    <th>Reason</th>\n"
                + "                                    <th>Type</th>\n"
                + "                                </tr>\n"
                + "                            </thead>\n"
                + "                            <tbody>\n"
                + "                                " + data + "\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                     </div>";
        out.print(html);
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

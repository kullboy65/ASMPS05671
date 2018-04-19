/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.Note_DAO;
import bean.Note;
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
public class Check extends HttpServlet {

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

        Note_DAO checkdao = new Note_DAO();
        if (action.equalsIgnoreCase("insert")) {
            String idStaff = request.getParameter("id");
            String note = request.getParameter("note");
            checkdao.insert(idStaff, note);
        } else if (action.equalsIgnoreCase("delete")) {
            String idNote = request.getParameter("id");
            checkdao.Delete(idNote);
        } else if (action.equalsIgnoreCase("checked")) {
            String idNote = request.getParameter("id");
            checkdao.Check(idNote);
            return;
        }

        String data = "";
        List<Note> list = checkdao.getListCheck();
        for (Note note : list) {
            data = data
                    + "                        <tr>\n"
                    + "                            <td>\n"
                    + "                                <label>\n"
                    + "                                    <input style=\"width: 18px; height: 18px;\" type=\"checkbox\" value=\"12\" id=\"check\"  " + note.getChecked() + " onchange=\"checkedNote(" + note.getId() + ")\">\n"
                    + "                                </label>\n"
                    + "                            </td>\n"
                    + "                            <td>" + note.getNote() + "</td>\n"
                    + "                            <td class=\"td-actions text-right\">\n"
                    + "                                <button type=\"button\" rel=\"tooltip\" title=\"Remove\" class=\"btn btn-danger btn-simple btn-xs\" onclick=\"deleteNote(" + note.getId() + ")\" >\n"
                    + "                                    <i class=\"fa fa-times\"></i>\n"
                    + "                                </button>\n"
                    + "                            </td>\n"
                    + "                        </tr>\n";
        }

//        data = data + "<script src=\"assets/js/bootstrap-checkbox-radio-switch.js\"></script>";

        
        out.print(data);
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

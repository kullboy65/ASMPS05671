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
import model.function;

/**
 *
 * @author PC
 */
public class ViewDetailServlet extends HttpServlet {

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
        String id = request.getParameter("id");
        Emp_DAO dao = new Emp_DAO();
        Emp emp = dao.getEmp(id);
        String gender;
        if (emp.getGender()) {
            gender = "male";
        } else {
            gender = "female";
        }
        String data
                = "<script type=\"text/javascript\" charset=\"utf-8\">\n"
                + "      $(document).ready(function () {\n"
                + "           var x_timer;\n"
                + "           $(\"#note\").keyup(function (e) {\n"
                + "                clearTimeout(x_timer);\n"
                + "                var note = $(\"#note\").val();\n"
                //                + "                var user_name1 = $(\"#note\").val();\n"
                + "                x_timer = setTimeout(function () {\n"
                + "                    check_username_ajax(note," + emp.getId() + ");\n"
                + "                }, 0);\n"
                + "                });\n"
                + " \n"
                + "           function check_username_ajax(note,id) {\n"
                //                + "//                $(\"#user-result\").html('<img src=\"resources/img/ajax-loader.gif\" />');\n"
                + "                $.post('NoteServlet', {'note': note,'id': id}, function (data) {\n"
                //                + "                    $(\"#user-result\").html(data);\n"
                + "                 });\n"
                + "           }\n"
                + "       });\n"
                + "</script>\n"
                + "<div class=\"row\">\n"
                + "                        <div class=\"col-sm-12 col-md-12 user-details\">\n"
                + "                            <div class=\"user-image\">\n"
                + "                                <img src=\"" + emp.getPhoto() + "\" width=\"110px\" height=\"110px\" title=\"Avatar\" class=\"img-circle\">\n"
                + "                            </div>\n"
                + "                            <div class=\"user-info-block\">\n"
                + "                                <div class=\"user-heading\">\n"
                + "                                    <h3>" + emp.getName() + " (" + emp.getRole() + ")</h3>\n"
                + "                                    <span class=\"help-block\">" + emp.getDepartment() + "</span>\n"
                + "                                </div>\n"
                + "                                <ul class=\"navigation\">\n"
                + "                                    <li class=\"active\">\n"
                + "                                        <a data-toggle=\"tab\" href=\"#information\">\n"
                + "                                            <span class=\"glyphicon glyphicon-user\"></span>\n"
                + "                                        </a>\n"
                + "                                    </li>\n"
                + "                                    <li>\n"
                + "                                        <a data-toggle=\"tab\" href=\"#settings\">\n"
                + "                                            <span class=\"glyphicon glyphicon-cog\"></span>\n"
                + "                                        </a>\n"
                + "                                    </li>\n"
                + "                                    <li>\n"
                + "                                        <a data-toggle=\"tab\" href=\"#email\">\n"
                + "                                            <span class=\"glyphicon glyphicon-envelope\"></span>\n"
                + "                                        </a>\n"
                + "                                    </li>\n"
                + "                                    <li>\n"
                + "                                        <a data-toggle=\"tab\" href=\"#events\">\n"
                + "                                            <span class=\"glyphicon glyphicon-star-empty\"></span>\n"
                + "                                        </a>\n"
                + "                                    </li>\n"
                + "                                </ul>\n"
                + "                                <div class=\"user-body\">\n"
                + "                                    <div class=\"tab-content\">\n"
                + "                                        <div id=\"information\" class=\"tab-pane active\">\n"
                + "                                            <div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">\n"
                + "                                                <h4>Send Message</h4>\n"
                + "                                                <dd><abbr title=\"Username\"><strong>Username</strong></abbr>: " + emp.getUsername() + "</dd>\n"
                + "                                                <dd><abbr title=\"Email\"><strong>Email</strong></abbr>: " + emp.getEmail() + "</dd>\n"
                + "                                                <dd><abbr title=\"Birthday\"><strong>Birthday</strong></abbr>: " + emp.getBirthday() + "</dd>\n"
                + "                                                <dd><abbr title=\"Gender\"><strong>Gender</strong></abbr>: " + gender + "</dd>\n"
                + "                                                <dd><abbr title=\"Phone\"><strong>Phone</strong></abbr>: " + emp.getPhone() + "</dd>\n"
                + "                                                <dd><abbr title=\"Salary\"><strong>Salary</strong></abbr>: " + emp.getSalary() + "</dd>\n"
                + "                                            </div>\n"
                + "                                        </div>\n"
                + "                                        <div id=\"settings\" class=\"tab-pane\">\n"
                + "                                            <h4>Notes</h4>\n"
                //                + "                                            <input type=\"hidden\" id=\"id_user\" value=\""+emp.getId()+"\"/>\n"
                //                + "                                            <input name=\"username\" type=\"text\" id=\"username\" maxlength=\"50\"> <span id=\"user-result\"></span>\n"
                + "                                            <textarea id=\"note\" name=\"note\" rows=\"4\" cols=\"50\" class=\"form-control\" placeholder=\"Notes...\">" + emp.getNotes() + "</textarea><span id=\"user-result\"></span>\n"
                + "                                        </div>\n"
                + "                                        <div id=\"email\" class=\"tab-pane\">\n"
                + "                                            <h4>Send Message</h4>\n"
                + "                                            <form action=\"email.htm\" method=\"get\">\n"
                + "                                                <input type=\"hidden\" name=\"to\" value=\"" + emp.getEmail() + "\"/>\n"
                + "                                            <div class=\"form-group\">\n"
                + "                                                <input class=\"form-control\" name=\"subject\" type=\"text\" placeholder=\"Subject...\">\n"
                + "                                            </div>\n"
                + "                                            <div class=\"form-group\">\n"
                + "                                                <textarea rows=\"4\" cols=\"50\" name=\"content\" class=\"form-control\" placeholder=\"Email Content...\"></textarea>\n"
                + "                                            </div>\n"
                + "                                                <button type=\"submit\" class=\"btn btn-warning btn-sm pull-right\" style=\"width: 30%;\"><span class=\"glyphicon glyphicon-ok-sign\"></span> Update</button>\n"
                + "                                            </form>\n"
                + "                                        </div>\n"
                + "                                        <div id=\"events\" class=\"tab-pane\">\n"
                + "                                            <h4>Feedback</h4>\n"
                + "                                            <form action=\"femp.htm\" method=\"get\">\n"
                + "                                                <input type=\"hidden\" name=\"id\" value=\"" + emp.getId() + "\"/>\n"
                + "                                                <input type=\"hidden\" name=\"email\" value=\"" + emp.getEmail() + "\"/>\n"
                + "                                            <div class=\"form-group\">\n"
                + "                                                <input class=\"form-control\" type=\"date\" name=\"date\" value=\"" + function.Date("yyyy-MM-dd") + "\" max=\"" + function.Date("yyyy-MM-dd") + "\">\n"
                + "                                            </div>\n"
                + "                                            <div class=\"form-group\">\n"
                + "                                                <textarea rows=\"4\" cols=\"50\" name=\"reason\" class=\"form-control\" placeholder=\"Reason...\"></textarea>\n"
                + "                                            </div>\n"
                + "                                            <div class=\"form-group\">\n"
                + "                                                <p class=\"text-primary\" style=\"float: left; margin-right: 20px;\">\n"
                + "                                                    <input name=\"like\" type=\"radio\" value=\"true\" checked=\"checked\"/> <span class=\"fa fa-thumbs-o-up danger\" style=\"font-size: 30px;\"></span></p>\n"
                + "                                                \n"
                + "                                                <p class=\"text-danger\">\n"
                + "                                                    <input name=\"like\" type=\"radio\" value=\"false\"/> <span class=\"fa fa-thumbs-o-down\" style=\"font-size: 30px;\"></span></p>\n"
                + "                                            </div>\n"
                + "                                            <button type=\"submit\" class=\"btn btn-warning btn-sm pull-right\" style=\"width: 30%;\"><span class=\"glyphicon glyphicon-ok-sign\"></span> Submit</button>\n"
                + "                                            </form>"
                + "                                        </div>\n"
                + "                                    </div>\n"
                + "                                </div>\n"
                + "                            </div>\n"
                + "                        </div>\n"
                + "                    </div>";
//        response.getWriter().write(data);
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

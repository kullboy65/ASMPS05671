<%-- 
    Document   : export
    Created on : Feb 26, 2017, 1:11:42 AM
    Author     : PC
--%>

<%@page import="java.util.Calendar"%>
<%@page import="DAO.Record_DAO"%>
<%@page import="java.io.File"%>
<%@page import="model.function"%>
<%@page import="java.util.List"%>
<%@page import="bean.Record"%>
<%@page import="DAO.Record_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String export = request.getParameter("export");
    if (export.equals("1")) {
        String formName = "";
        formName = "Report " + function.Date("dd-MM-yyyy") + ".xls";
        File filepath = new File(formName);
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "inline; filename=" + filepath);
    }
    if (export.equals("2")) {
        String formName = "";
        formName = "Report " + function.Date("dd-MM-yyyy") + ".doc";
//        formName = "Report " + function.Date("dd-MM-yyyy") + ".pdf";
        File filepath = new File(formName);
        response.setContentType("application/vnd.ms-word");
        response.setHeader("Content-Disposition", "inline; filename=" + filepath);
    }
%>
<%
    Record_DAO record_dao1 = new Record_DAO();
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <base href="${pageContext.servletContext.contextPath}/">
        <!-- Bootstrap Core CSS -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">

        <!--Morris Charts CSS--> 
        <link href="resources/css/plugins/morris.css" rel="stylesheet">

        <!--Custom Fonts--> 
        <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- jQuery -->
        <script src="resources/js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="resources/js/bootstrap.min.js"></script>

        <script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">

        <script>
            $(document).ready(function () {
                $('#datatable').dataTable();

                $("[data-toggle=tooltip]").tooltip();

            });
        </script>

    </head>
    <body>
        <div align="center" style="margin-top: 50px; margin-bottom: 50px;">
            <a href="ad_index.htm?fee-emp&page=fee-emp" style="margin-left: 20px; font-size: 35px; color: #cccccc" data-toggle="tooltip" title="Black"><i class="fa fa-arrow-circle-o-left"></i></a>
            <a href="export_emp.htm?export=1" style="margin-left: 20px; font-size: 35px;" data-toggle="tooltip" title="MS-Excel"><i class="fa fa-file-excel-o text-success"></i></a>
            <a href="export_emp.htm?export=2" style="margin-left: 20px; font-size: 35px;" data-toggle="tooltip" title="MS-Word"><i class="fa fa-file-word-o text-primary"></i></a>
        </div>



        <div id="page-wrapper">

            <div class="container-fluid">

                <div class="row">

                    <div class="col-md-12">
                        <table id="" class="table table-striped table-bordered" cellspacing="0" width="100%" >
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Username</th>
                                    <th>Department</th>
                                    <th>Like <span class="fa fa-thumbs-o-up text-primary" style="font-size: 25px;"></span></th>
                                    <th>Dislike <span class="fa fa-thumbs-o-down text-danger" style="font-size: 25px;"></span></th>
                                    <th>Total</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%int year = Calendar.getInstance().get(Calendar.YEAR);%>
                                <c:forEach var="rd" items="${list_record}">
                                    <c:set var="id" value="${rd.id}"></c:set>
                                    <%String id = String.valueOf(pageContext.getAttribute("id"));%>
                                    <tr style="border: #cccccc solid 1px;">
                                        <td>${rd.name}</td>
                                        <td>${rd.username}</td>
                                        <td>${rd.department}</td>
                                        <td><%= record_dao1.countRecord(1, id, year)%></td>
                                        <td><%= record_dao1.countRecord(-1, id, year)%></td>
                                        <% int total = Integer.parseInt(record_dao1.countRecord(1, id, year)) - Integer.parseInt(record_dao1.countRecord(-1, id, year));%>
                                        <td style="font-weight: bold;"
                                            <%
                                                if (total > 0) {
                                            %>
                                            class="text-primary" 
                                            <%
                                            } else {
                                            %>
                                            class="text-danger"
                                            <%
                                                }
                                            %>
                                            ><%= total%></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>



        </div>
        <%//response.sendRedirect("HoadonServlet?btn=getBill&status=&date=");%>
    </body>
</html>
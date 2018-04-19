<%-- 
    Document   : export_dept
    Created on : Feb 26, 2017, 2:55:32 AM
    Author     : PC
--%>
<%@page import="DAO.DeptRecord_DAO"%>
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
        File filepath = new File(formName);
        response.setContentType("application/vnd.ms-word");
        response.setHeader("Content-Disposition", "inline; filename=" + filepath);
    }
%>
<!DOCTYPE html>
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
        <style>
            .filterable {
                margin-top: 15px;
            }
            .filterable .panel-heading .pull-right {
                margin-top: -20px;
            }
            .filterable .filters input[disabled] {
                background-color: transparent;
                border: none;
                cursor: auto;
                box-shadow: none;
                padding: 0;
                height: auto;
            }
            .filterable .filters input[disabled]::-webkit-input-placeholder {
                color: #333;
            }
            .filterable .filters input[disabled]::-moz-placeholder {
                color: #333;
            }
            .filterable .filters input[disabled]:-ms-input-placeholder {
                color: #333;
            }

            @import url(http://fonts.googleapis.com/css?family=Roboto:400,300);
            @import url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

            .range {
                display: table;
                position: relative;
                height: 25px;
                margin-top: 20px;
                background-color: rgb(245, 245, 245);
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
                box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
                cursor: pointer;
            }

            .range input[type="range"] {
                -webkit-appearance: none !important;
                -moz-appearance: none !important;
                -ms-appearance: none !important;
                -o-appearance: none !important;
                appearance: none !important;

                display: table-cell;
                width: 100%;
                background-color: transparent;
                height: 25px;
                cursor: pointer;
            }
            .range input[type="range"]::-webkit-slider-thumb {
                -webkit-appearance: none !important;
                -moz-appearance: none !important;
                -ms-appearance: none !important;
                -o-appearance: none !important;
                appearance: none !important;

                width: 11px;
                height: 25px;
                color: rgb(255, 255, 255);
                text-align: center;
                white-space: nowrap;
                vertical-align: baseline;
                border-radius: 0px;
                background-color: rgb(153, 153, 153);
            }

            .range input[type="range"]::-moz-slider-thumb {
                -webkit-appearance: none !important;
                -moz-appearance: none !important;
                -ms-appearance: none !important;
                -o-appearance: none !important;
                appearance: none !important;

                width: 11px;
                height: 25px;
                color: rgb(255, 255, 255);
                text-align: center;
                white-space: nowrap;
                vertical-align: baseline;
                border-radius: 0px;
                background-color: rgb(153, 153, 153);
            }

            .range output {
                display: table-cell;
                padding: 3px 5px 2px;
                min-width: 40px;
                color: rgb(255, 255, 255);
                background-color: rgb(153, 153, 153);
                text-align: center;
                text-decoration: none;
                border-radius: 4px;
                border-bottom-left-radius: 0;
                border-top-left-radius: 0;
                width: 1%;
                white-space: nowrap;
                vertical-align: middle;

                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                -ms-transition: all 0.5s ease;
                transition: all 0.5s ease;

                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: -moz-none;
                -o-user-select: none;
                user-select: none;
            }
            .range input[type="range"] {
                outline: none;
            }

            .range.range-primary input[type="range"]::-webkit-slider-thumb {
                background-color: rgb(66, 139, 202);
            }
            .range.range-primary input[type="range"]::-moz-slider-thumb {
                background-color: rgb(66, 139, 202);
            }
            .range.range-primary output {
                background-color: rgb(66, 139, 202);
            }
            .range.range-primary input[type="range"] {
                outline-color: rgb(66, 139, 202);
            }

            .range.range-success input[type="range"]::-webkit-slider-thumb {
                background-color: rgb(92, 184, 92);
            }
            .range.range-success input[type="range"]::-moz-slider-thumb {
                background-color: rgb(92, 184, 92);
            }
            .range.range-success output {
                background-color: rgb(92, 184, 92);
            }
            .range.range-success input[type="range"] {
                outline-color: rgb(92, 184, 92);
            }

            .range.range-info input[type="range"]::-webkit-slider-thumb {
                background-color: rgb(91, 192, 222);
            }
            .range.range-info input[type="range"]::-moz-slider-thumb {
                background-color: rgb(91, 192, 222);
            }
            .range.range-info output {
                background-color: rgb(91, 192, 222);
            }
            .range.range-info input[type="range"] {
                outline-color: rgb(91, 192, 222);
            }

            .range.range-warning input[type="range"]::-webkit-slider-thumb {
                background-color: rgb(240, 173, 78);
            }
            .range.range-warning input[type="range"]::-moz-slider-thumb {
                background-color: rgb(240, 173, 78);
            }
            .range.range-warning output {
                background-color: rgb(240, 173, 78);
            }
            .range.range-warning input[type="range"] {
                outline-color: rgb(240, 173, 78);
            }

            .range.range-danger input[type="range"]::-webkit-slider-thumb {
                background-color: rgb(217, 83, 79);
            }
            .range.range-danger input[type="range"]::-moz-slider-thumb {
                background-color: rgb(217, 83, 79);
            }
            .range.range-danger output {
                background-color: rgb(217, 83, 79);
            }
            .range.range-danger input[type="range"] {
                outline-color: rgb(217, 83, 79);
            }

        </style>

        <script>
            function viewDetail() {
                var year = document.getElementById('txtSearch').value;
                window.location.replace("export_dept.htm?export=0&year=" + year);
            }
            function excel() {
                var year = document.getElementById('txtSearch').value;
                window.location.replace("export_dept.htm?export=1&year=" + year);
            }
            function word() {
                var year = document.getElementById('txtSearch').value;
                window.location.replace("export_dept.htm?export=2&year=" + year);
            }
            $(document).ready(function () {
                $('#datatable').dataTable();

                $("[data-toggle=tooltip]").tooltip();

            });
        </script>
    </head>
    <body>
        <div class="container">
            <div align="center" style="margin-top: 50px; margin-bottom: 20px;">
                <a href="ad_index.htm?feedback-dept&page=feedback-dept&year=<%= function.Date("yyyy")%>" style="margin-left: 20px; font-size: 35px; color: #cccccc" data-toggle="tooltip" title="Black"><i class="fa fa-arrow-circle-o-left"></i></a>
                <a onclick="excel()" style="margin-left: 20px; font-size: 35px;" data-toggle="tooltip" title="MS-Excel"><i class="fa fa-file-excel-o text-success"></i></a>
                <a onclick="word()" style="margin-left: 20px; font-size: 35px;" data-toggle="tooltip" title="MS-Word"><i class="fa fa-file-word-o text-primary"></i></a>
            </div>
            <div class="row">
                <div class="panel panel-primary filterable col-sm-12">
                    <div class="panel-heading">
                        <h3 class="panel-title">Deparment</h3>
                    </div>
                    <div class="range range-primary" style="width: 30%; margin-bottom: 20px;">
                        <input id="txtSearch" type="range" name="range" min="2010" max="${now}" value="${setyear}" onchange="viewDetail();rangePrimary.value = value">
                        <output id="rangePrimary">${setyear}</output>
                    </div>

                    <table id="" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Department</th>
                                <th>Like <span class="fa fa-thumbs-o-up text-primary" style="font-size: 25px;"></span></th>
                                <th>Dislike <span class="fa fa-thumbs-o-down text-danger" style="font-size: 25px;"></span></th>
                                <th>Total</th>
                            </tr>
                        </thead>

                        <c:set var="setyear" value="${setyear}"></c:set>
                        <%String setyear = String.valueOf(pageContext.getAttribute("setyear"));%>

                        <tbody class="detail">
                            <%DeptRecord_DAO deptrecord_dao = new DeptRecord_DAO();%>
                            <c:forEach var="row" items="${list}">
                                <c:set var="id" value="${row.id}"></c:set>
                                <%String id = String.valueOf(pageContext.getAttribute("id"));%>
                                <%int total = Integer.parseInt(deptrecord_dao.countRecord(1, setyear, id)) - Integer.parseInt(deptrecord_dao.countRecord(-1, setyear, id));%>
                                <tr style="border: #999999 solid 1px;">
                                    <td>${row.name}</td>
                                    <td><%= deptrecord_dao.countRecord(1, setyear, id)%></td>
                                    <td><%= deptrecord_dao.countRecord(-1, setyear, id)%></td>
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
    </body>
</html>

<%-- 
    Document   : fee-emp
    Created on : Feb 16, 2017, 1:02:58 AM
    Author     : PC
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="bean.Record"%>
<%@page import="DAO.Record_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    Record_DAO record_dao1 = new Record_DAO();
%>
<script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">



<style>
    .btn {
        display: inline-block;
        padding: 6px 12px !important;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.42857143;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        background-image: none;
        border: 1px solid transparent;
        border-radius: 4px;
    }
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
    $(document).ready(function () {
        $('#datatable').dataTable();

        $("[data-toggle=tooltip]").tooltip();

    });

    function viewDetail(id, flag) {
        var year;
        if (flag > 0) {
            year = new Date().getFullYear();
        } else {
            year = document.getElementById('txtSearch').value;
        }

        $.post('SearchRecord', {'id': id, 'year': year}, function (html) {
            $(".detail").html(html);
        });
    }
</script>

<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Dashboard <small>Statistics Overview</small>
                </h1>
                <ol class="breadcrumb">
                    <li class="active">
                        <i class="fa fa-dashboard"></i> Dashboard
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->




        <div class="row">
            <a href="export_emp.htm?export=0" style="margin-bottom: 20px;; margin-right: 20px; font-size: 35px;" class="pull-right" data-toggle="tooltip" title="Print"><i class="fa fa-print text-info"></i></a>
            <div class="col-md-12">
                <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Department</th>
                            <th><span class="fa fa-thumbs-o-up text-primary" style="font-size: 25px;"></span></th>
                            <th><span class="fa fa-thumbs-o-down text-danger" style="font-size: 25px;"></span></th>
                            <th>Total</th>
                            <th>Detail</th>
                        </tr>
                    </thead>

                    <tfoot>

                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Department</th>
                            <th><span class="fa fa-thumbs-o-up text-primary" style="font-size: 25px; "></span></th>
                            <th><span class="fa fa-thumbs-o-down text-danger" style="font-size: 25px;"></span></th>
                            <th>Total</th>
                            <th>Detail</th>
                        </tr>
                    </tfoot>

                    <tbody>
                        <%int year = Calendar.getInstance().get(Calendar.YEAR);%>
                        <c:forEach var="rd" items="${list_record}">
                            <c:set var="id" value="${rd.id}"></c:set>
                            <%String id = String.valueOf(pageContext.getAttribute("id"));%>
                            <tr>
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
                                <td><p data-placement="top"  title="Edit"><button class="btn btn-primary btn-xs" onclick="viewDetail(${rd.id}, 1)" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>

    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                    
                    <div class="detail">


                    </div>

                <div class="modal-footer ">
                </div>
            </div>
            <!-- /.modal-content --> 
        </div>
        <!-- /.modal-dialog --> 
    </div>



    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
                </div>
                <div class="modal-body">

                    <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>

                </div>
                <div class="modal-footer ">
                    <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
                </div>
            </div>
            <!-- /.modal-content --> 
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
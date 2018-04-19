<%@page import="java.util.List"%>
<%@page import="bean.Record"%>
<%@page import="DAO.Record_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function searchCB() {
        var e = document.getElementById("selectBox");
        var cb = e.options[e.selectedIndex].value;
        var name = $("#selecttext").val();
        window.location.replace("index.htm");
    }
</script>
<%
    Record_DAO record_dao = new Record_DAO();
%>
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

            <div class="col-xs-10 col-md-offset-1">
                <form action="searchRecord.htm" method="get">
                <div class="form-group input-group col-xs-4">
                    <input id="selecttext" name="txtSearch" value="" type="text" class="form-control">
                        <span class="input-group-btn"><button style="padding: 9px;" class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                    
                </div>
                </form>
                <!--                <div class="form-group col-xs-4" style="float: right;">
                
                                </div>-->
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            Accounts and transactions report
                        </h2>
                    </div>
                    <div class="panel-body">
                        <h3>
                            JONES Alexander
                        </h3>
                    </div>
                    <ul class="list-group">
                        <c:forEach var="rd" items="${list_record}">
                            <li class="list-group-item">
                                <h4 style="float: left;"><i><b>Username:</b></i> ${rd.username}(${rd.name}) - ${rd.department}</h4>
                                            <c:set var="id" value="${rd.id}"></c:set>
                                            <%String id = String.valueOf(pageContext.getAttribute("id"));%>
                                <p class="text-primary" style="float: left; margin-left: 50px; margin-right: 50px; font-size: 18px; font-weight: bold;"><%= record_dao.countRecord(1, id,2017)%> <span class="fa fa-thumbs-o-up" style="font-size: 25px;"></span></p>
                                <p class="text-danger" style="font-size: 18px; font-weight: bold;"><%= record_dao.countRecord(-1, id,2017)%> <span class="fa fa-thumbs-o-down" style="font-size: 25px;"></span></p>
                                <p style="text-align: right; font-size: 15px;"><a href="#" >see more</a></p>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Operation date</th>
                                            <th>Reason</th>
                                            <th>Type</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%List l = record_dao.recordUser(id,2017);%>
                                        <%
                                            String type;
                                            for (int i = 0; i < l.size(); i++) {
                                                Record p = (Record) l.get(i);
                                                if (p.getLike()) {
                                                    type = "<p class=\"text-primary\"><span class=\"fa fa-thumbs-o-up\" style=\"font-size: 18px;\"></span></p>";
                                                } else {
                                                    type = "<p class=\"text-danger\"><span class=\"fa fa-thumbs-o-down\" style=\"font-size: 18px;\"></span></p>";
                                                }
                                        %>

                                        <tr>
                                            <td><%= p.getDate()%></td>
                                            <td><%= p.getReason()%></td>
                                            <td><%= type%></td>
                                        </tr>      

                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>

<%-- 
    Document   : post
    Created on : Feb 20, 2017, 10:46:22 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="col-md-7">
    <!--post-->
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="fa fa-newspaper-o"></span> Chat
        </div>
        <div class="panel-body">
            <ul class="chat" style="height: 500px; overflow-y: auto;">
                <%int i = 1;%>
                <c:forEach var="row" items="${list_post}">
                    <li class="left clearfix" style="padding: 10px;"><span class="chat-img pull-left">
                            <img src="${row.photo}" width="50px" height="50px" alt="User Avatar" class="img-circle" />
                        </span>
                        <div class="chat-body clearfix">
                            <div class="header">
                                <strong class="primary-font">${row.subject}</strong> <small class="pull-right text-muted">
                                    <span class="fa fa-clock-o"></span>${row.date}</small>
                            </div>
                            <p>
                                ${row.detail}
                            </p>
                        </div>
                    </li> 
                    <% i++;%>
                </c:forEach>
            </ul>
        </div>

    </div>
    <!--post-->
    <!--timeline-->

    <!--timeline-->
</div>

<%-- 
    Document   : leftbar
    Created on : Feb 20, 2017, 9:25:13 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>   
<!DOCTYPE html>
<div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">
    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="home.htm" class="simple-text">
                <i class="fa fa-apple"></i> ABC Company</a>
            </a>
        </div>

        <ul class="nav">
            <li>
                <a href="home.htm">
                    <i class="pe-7s-graph"></i>
                    <p><s:message code="home.menu.dashboard"/></p>
                </a>
            </li>
            <li>
                <a href="user.htm">
                    <i class="pe-7s-user"></i>
                    <p><s:message code="home.menu.user"/></p>
                </a>
            </li>
<!--            <li>
                <a href="user.htm">
                    <i class="pe-7s-note2"></i>
                    <p>User</p>
                </a>
            </li>-->
            <li>
                <a href="top10.htm">
                    <i class="pe-7s-news-paper"></i>
                    <p><s:message code="home.menu.top"/></p>
                </a>
            </li>

            <li class="active-pro">
                <a href="logout.htm">
                    <i class="pe-7s-rocket"></i>
                    <p><s:message code="home.menu.signout"/></p>
                </a>
            </li>
        </ul>
    </div>
</div>

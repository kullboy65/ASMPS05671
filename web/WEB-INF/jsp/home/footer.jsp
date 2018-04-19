<%-- 
    Document   : footer
    Created on : Feb 20, 2017, 10:47:16 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<footer class="footer">
    <div class="container-fluid">
        <nav class="pull-left">
            <ul>
                <li>
                    <a href="home.htm">
                        <s:message code="home.menu.dashboard"/>
                    </a>
                </li>
                <li>
                    <a href="user.htm">
                        <s:message code="home.menu.user"/>
                    </a>
                </li>
                <li>
                    <a href="top10.htm">
                        <s:message code="home.menu.top"/>
                    </a>
                </li>
            </ul>
        </nav>
        <p class="copyright pull-right">
            &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
        </p>
    </div>
</footer>

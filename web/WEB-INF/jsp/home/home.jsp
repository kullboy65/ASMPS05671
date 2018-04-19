<%-- 
    Document   : home
    Created on : Feb 20, 2017, 6:12:57 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username = (String) request.getSession().getAttribute("user");
    String top10 = (String) request.getAttribute("top10");
    if (username == null) {
        response.sendRedirect("index.htm");
    } else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <base href="${pageContext.servletContext.contextPath}/">
        <link rel="stylesheet" href="resources/css/mycss/personal.css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">



        <!--<link rel="stylesheet" href="resources/css/sb-admin-2.css" />-->
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
        <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!--   Core JS Files   -->
        <!--  Google Maps Plugin    -->
        <script src="resources/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>



        <!--  Checkbox, Radio & Switch Plugins -->
        <script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

        <!--  Charts Plugin -->
        <script src="assets/js/chartist.min.js"></script>

        <!--  Notifications Plugin    -->
        <script src="assets/js/bootstrap-notify.js"></script>

        <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
        <script src="assets/js/light-bootstrap-dashboard.js"></script>

        <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
        <script src="assets/js/demo.js"></script>

        <script>
            $(function () {
                $("a[data-lang]").click(function () {
                    var lang = $(this).attr("data-lang");
                    $.get("home.htm?language=" + lang, function () {
                        location.reload();
                    });
                    return false;
                });
            }
            );
        </script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="leftbar.jsp" %>

            <div class="main-panel">
                <%@include file="menutop.jsp" %>


                <!--j-->
                <%                    if (top10.equals("true")) {
                %>
                <div class="content">
                    <div class="container-fluid">
                        <div class="col-md-12">
                            <%@include file="top10.jsp" %>
                        </div>
                    </div>
                    <%@include file="footer.jsp" %>
                </div>
                <%
                } else if (top10.equals("false")) {
                %>
                <div class="content" style="background: white;">
                    <div class="container-fluid">
                        <div class="col-md-12">
                            <%@include file="windows8.jsp" %>
                            <div class="row">
                                <%@include file="post.jsp" %>
                                <%@include file="check.jsp" %>
                            </div>
                        </div>
                    </div>
                    <%@include file="footer.jsp" %>
                </div>
                <%
                } else {
                %>
                <%@include file="test.jsp" %>
                <%
                    }
                %>


                <!--j-->
            </div>
        </div>

    </body>
</html>
<%    }
%>
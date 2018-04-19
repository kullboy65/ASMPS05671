<%-- 
    Document   : top10
    Created on : Feb 20, 2017, 10:40:38 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--img-->
<link rel="stylesheet" type="text/css" href="assets/css/demo_1.css" />
<link rel="stylesheet" type="text/css" href="assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="assets/css/style2.css" />
<link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="assets/js/modernizr.custom.79639.js"></script> 
<base href="${pageContext.servletContext.contextPath}/">
<!--img-->
<div class="col-md-12">

    <header>

        <h1><strong>Circle</strong> Hover Effects</h1>
        <h2>Pretty hover effects on circles with CSS Transitions</h2>



        <div class="support-note"><!-- let's check browser support with modernizr -->
            <!--span class="no-cssanimations">CSS animations are not supported in your browser</span-->
            <span class="no-csstransforms">CSS transforms are not supported in your browser</span>
            <!--span class="no-csstransforms3d">CSS 3D transforms are not supported in your browser</span-->
            <span class="no-csstransitions">CSS transitions are not supported in your browser</span>
            <span class="note-ie">Sorry, only modern browsers.</span>
        </div>

    </header>

    <section class="main">

        <ul class="ch-grid">
            <!--            <li>
                            <div class="ch-item ch-img-1">
                                <div class="ch-info">
                                    <h3>Brainiac</h3>
                                    <p>by Daniel Nyari <a href="http://drbl.in/eODP">View on Dribbble</a></p>
                                </div>
                            </div>
                        </li>-->
            <!--        </ul>
                    <ul class="ch-grid">-->
            <%int i = 0;%>
            <c:forEach items="${listTOP}" var="row">

                <li>
                    <div class="ch-item ch-img-2" style="background: url(${row.photo});background-size: 220px 220px;background-repeat: no-repeat;">
                        <div class="ch-info">
                            <h3>${row.username}</h3>
                            <p style="font-weight: bold; font-size: 20px;">${row.name} <a href="http://drbl.in/eNXW">${row.department}</a></p>
                        </div>
                    </div>
                </li>  
                <%
                    if (i == 0) {
                %>
            </ul>
            <ul class="ch-grid">
                <%
                    }
                %>
                <%i++;%>
            </c:forEach>


        </ul>

    </section>

</div>

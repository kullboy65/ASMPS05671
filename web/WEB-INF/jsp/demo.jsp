<%-- 
    Document   : demo
    Created on : Feb 2, 2017, 10:52:47 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | E-Shopper</title>

        <base href="${pageContext.servletContext.contextPath}/">

    </head><!--/head-->

    <body>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">

        <link href="resources/css/range/price-range.css" rel="stylesheet">
        <link href="resources/css/range/mainEshopper.css" rel="stylesheet">
        <div class="price-range"><!--price-range-->
            <h2>Price Range</h2>
            <div class="well">
                <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                <b>$ 0</b> <b class="pull-right">$ 600</b>
            </div>
        </div><!--/price-range-->

        <script src="resources/js/range/jquery.js"></script>
        <script src="resources/js/range/price-range.js"></script>
        <script src="resources/js/range/bootstrap.min.js"></script>
        <script src="resources/js/range/mainEshopper.js"></script>
        
        <p>${fb.role}</p>
        <p>${fb.image}</p>
        <p>${fb.text}</p>
        <p>${fb.media}</p>
        <p>${fb.idStaff}</p>
    </body>
</html>




<%-- 
    Document   : personal
    Created on : Feb 2, 2017, 10:26:44 PM
    Author     : PC
--%>

<%@page import="DAO.Record_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<%
    Record_DAO record_dao = new Record_DAO();
    String id = (String) request.getSession().getAttribute("id");
%>
<html>
    <head>
        <title>Strata by HTML5 UP</title> 
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/main.css" />
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/sb-admin-2.css" />
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/sb-admin-2.min.css" />
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/mycss/personal.css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <!--Scripts--> 


        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.poptrox.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/skel.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/util.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.js" type="text/javascript"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>

        <style>

        </style>
    </head>
    <body id="top" style="background: none;">

        <!-- Header -->
        <header id="header">
            <div class="inner">
                <img src="${sessionScope.photo}" alt="" width="150px" height="150px" class="img-circle"/>
                <h1><strong>I am ${sessionScope.name}</strong>( ${sessionScope.user} )<br />
                    ${sessionScope.email}<br />
                    Deparment: <a href="#">${sessionScope.deparment}</a></h1>
            </div>
        </header>

        <!-- Main -->
        <div id="main">

            <!-- One -->
            <section id="one">
                <header class="major">
                    <h2>Ipsum lorem dolor aliquam ante commodo<br />
                        magna sed accumsan arcu neque.</h2>
                </header>
                <p>Accumsan orci faucibus id eu lorem semper. Eu ac iaculis ac nunc nisi lorem vulputate lorem neque cubilia ac in adipiscing in curae lobortis tortor primis integer massa adipiscing id nisi accumsan pellentesque commodo blandit enim arcu non at amet id arcu magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem vulputate lorem neque cubilia.</p>
                <ul class="actions">
                    <li><a href="#" class="button">Learn More</a></li>
                </ul>
            </section>


            <!-- Three -->
<!--            <section id="three">
                <h2>Get In Touch</h2>
                <p>Accumsan pellentesque commodo blandit enim arcu non at amet id arcu magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem vulputate lorem neque lorem ipsum dolor.</p>
                <div class="row">
                    <div class="8u 12u(small)">
                        <form method="post" action="#">
                            <div class="row uniform 50%">
                                <div class="6u 12u(xsmall)"><input type="text" name="name" id="name" placeholder="Name" /></div>
                                <div class="6u 12u(xsmall)"><input type="email" name="email" id="email" placeholder="Email" /></div>
                                <div class="12u"><textarea name="message" id="message" placeholder="Message" rows="4"></textarea></div>
                            </div>
                        </form>
                        <ul class="actions">
                            <li><input type="submit" value="Send Message" /></li>
                        </ul>
                    </div>
                    <div class="4u 12u(small)">
                        <ul class="labeled-icons">
                            <li>
                                <h3 class="icon fa-home"><span class="label">Address</span></h3>
                                1234 Somewhere Rd.<br />
                                Nashville, TN 00000<br />
                                United States
                            </li>
                            <li>
                                <h3 class="icon fa-mobile"><span class="label">Phone</span></h3>
                                000-000-0000
                            </li>
                            <li>
                                <h3 class="icon fa-envelope-o"><span class="label">Email</span></h3>
                                <a href="#">hello@untitled.tld</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>-->

            <!-- Four -->



<!--            <section>
                <h4>Table</h4>
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Item One</td>
                                <td>Ante turpis integer aliquet porttitor.</td>
                                <td>29.99</td>
                            </tr>
                            <tr>
                                <td>Item Two</td>
                                <td>Vis ac commodo adipiscing arcu aliquet.</td>
                                <td>19.99</td>
                            </tr>
                            <tr>
                                <td>Item Three</td>
                                <td> Morbi faucibus arcu accumsan lorem.</td>
                                <td>29.99</td>
                            </tr>
                            <tr>
                                <td>Item Four</td>
                                <td>Vitae integer tempus condimentum.</td>
                                <td>19.99</td>
                            </tr>
                            <tr>
                                <td>Item Five</td>
                                <td>Ante turpis integer aliquet porttitor.</td>
                                <td>29.99</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2"></td>
                                <td>100.00</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </section>-->

            <!--                metro
                            <div class="row">
                                
                                <div class="page">
                                    <div class="metr">
                                        <a class="metrostyle orgmetro" style="cursor: pointer" href="../UserGUI/Users_List.aspx">
            
                                            <span class="fa fa-users" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px;float:left"></span>
                                            <span style="color: white; font-size: 1.1em; float: right; margin-top: 5px; padding-right: 0.2em">7</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:80px">User List </span>
                                        </a>
                                        <a class="metrostyle eenmetro" style="cursor: pointer" href="">
            
                                            <span class="fa fa-cogs" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">71</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px ;margin-right:50px">User Logging </span>
            
                                        </a>
                                        <a style="cursor: pointer" class="metrostyle metrostylelarge  boometro" href="../Medical/Hospitals_List.aspx">
                                            <span class="fa fa-hospital-o" style="font-size:2em;color:white;padding-left:0.3em;margin-top:3px;float:left"></span>
                                            <span style="color:white;font-size: 1.1em;float:right;margin-top:5px;padding-right:0.2em">37</span>   
                                            <span style="color:white;float:left;margin-top:35px;margin-left:10px;margin-right:180px">Hospitals </span>
                                        </a>
                                        <a class="metrostyle reemetro" style="cursor: pointer" href="../Medical/Branchs_List.aspx">
                                            <span class="fa fa-medkit" style="font-size: 2em; color: white; padding-left: 0.3em ; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">27</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:80px">Branches </span>
                                        </a>
                                        <a class="metrostyle yoometro" style="cursor: pointer" href="../Medical/Clinics_List.aspx">
            
                                            <span class="fa fa-stethoscope" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">17</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:80px">Clinics</span>
                                        </a>
                                    </div>
                                    <div class="metr">
            
                                        <a style="cursor: pointer" class="metrostyle  reemetro" href="">
            
                                            <span class="fa fa-globe" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">7</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:100px">Cities</span>
                                        </a>
                                        <a style="cursor: pointer" class="metrostyle metrostylelarge  toometro"href="../ExaminationGUI/ReciptionGUI/Reservation.aspx">
                                            <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">7</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Reservation Type</span>
                                        </a>
                                        <a style="cursor: pointer" class="metrostyle yoometro" href="../Admin/VisitType.aspx">
            
                                            <span class="fa fa-vimeo-square" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">7</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:70px">Visit Type</span>
                                        </a>
            
                                        <a style="cursor: pointer" class="metrostyle  toometro" href="../Admin/MedicalLab_List.aspx">
                                            <span class="fa fa-flask" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">27</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px ;margin-right:100px">Labs</span>
                                        </a>
                                                                        <a style="cursor: pointer" class="metrostyle  orgmetro"  href="../Admin/MedicalRad_List.aspx">
                                                                            <span class="fa fa-bookmark" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">47</span>
                                                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:180px">Rads</span>
                                                                        </a>
                                    </div>
                                    <div class="metr">                          
                                        <a style="cursor: pointer" class="metrostyle eenmetro" href="../Admin/Sample_List.aspx">
                                            <span class="fa fa-heartbeat" style="font-size:2em;color:white;padding-left:0.3em;margin-top:3px ;float:left"></span>
                                            <span style="color:white;font-size: 1.1em;float:right;margin-top:5px;padding-right:0.2em">7</span>   
                                            <span style="color:white;float:left;margin-top:35px;margin-left:10px;margin-right:180px">Samples</span>
                                        </a>
                                        <a class="metrostyle yoometro" style="cursor: pointer" href="../UserGUI/Users_List.aspx">
                                            <span class="fa fa-plus-square-o" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">87</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:80px">Drugs </span>
                                        </a>
                                        <a class="metrostyle eenmetro" style="cursor: pointer" href="">
            
                                            <span class="fa fa-glass" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">342</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:80px">Dose</span>
                                        </a>
                                        <a class="metrostyle metrostylelarge reemetro" style="cursor: pointer" href="../Admin/Diseases.aspx">
                                            <span class="fa fa-bed" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">8</span>
                                            <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:180px">Diseases </span>
                                        </a>
                                                                        <a class="metrostyle orgmetro" style="cursor: pointer" href="../Admin/UnaidedVA_List.aspx">
                                                                            <span class="fa fa-map-marker" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                                                                            <span style="color: white; font-size:  1.1em; float: right; margin-top: 5px; padding-right: 0.2em">13</span>
                                                                            <span style="color: white; float: left; margin-top: 35px;margin-right:80px ;margin-bottom:20px;margin-left:10px">Unaided</span>
                                                                        </a>
                                    </div>
                                    <div class="metr">          
                                        <a style="cursor: pointer" class="metrostyle metrostylelarge  boometro">
                                            <span class="fa fa-eye" style="font-size:2em;color:white;padding-left:0.3em;margin-top:3px ;float:left"></span>
                                            <span style="color:white;font-size: 1.1em;float:right;margin-top:5px;padding-right:0.2em">47</span>   
                                            <span style="color:white;float:left;margin-top:35px;margin-left:10px;margin-right:100px">Slit Lamb Diseases </span>
                                        </a>
                                    </div>
                                </div> 
                            </div>
                            metro-->

            <!--timeline-->
            <div class="panel panel-success" >
                <div class="panel-heading">
                    <i class="fa fa-clock-o fa-fw"></i>Responsive Timeline 
                    <span class="text-primary" style=" margin-left: 400px; margin-right: 20px; font-size: 20px; font-weight: bold;"><%= record_dao.countRecord(1, id,2017)%> <span class="fa fa-thumbs-o-up" style="font-size: 25px;"></span></span>
                    <span class="text-danger" style="font-size: 20px; font-weight: bold;"><%= record_dao.countRecord(-1, id,2017)%> <span class="fa fa-thumbs-o-down" style="font-size: 25px;"></span></span>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body" >
                    
                    <ul class="timeline">
                        <c:forEach items="${listRecord}" var="row">
                            <c:set var="type" value="${row.type}"></c:set>
                            <%
                                String type = String.valueOf(pageContext.getAttribute("type"));
                                if (type == "fa fa-thumbs-o-up text-primary") {
                            %>
                            <li>
                                <div class="timeline-badge" style="background: white"><i class="${row.type}" style="font-size:30px"></i>
                                </div>
                                <%
                                } else {
                                %>
                            <li class="timeline-inverted">
                                <div class="timeline-badge" style="background: white"><i class="${row.type}" style="font-size:30px"></i>
                                </div>
                                <%
                                    }
                                %>


                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">${row.username}(${row.name})</h4>
                                        <p><small class="text-muted"><i class="fa fa-clock-o"></i> ${row.currenttime}</small>
                                        </p>
                                    </div>
                                    <div class="timeline-body">

                                        <p>${row.reason}</p>
                                        <p class="text-mute">On day: ${row.date}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </li>

                    </ul>
                </div>
                <!--timeline-->


            </div>

            <!-- Footer -->
            <footer id="footer">
                <div class="inner">
                    <ul class="icons">
                        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
                        <li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
                        <li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
                    </ul>
                    <ul class="copyright">
                        <li>&copy; Untitled</li><li>Design: <a href="#">kietppps04803</a></li>
                    </ul>
                </div>
            </footer>

    </body>
</html>
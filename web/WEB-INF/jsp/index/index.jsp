<%-- 
    Document   : index
    Created on : Feb 1, 2017, 1:57:33 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username = (String) request.getSession().getAttribute("user");
    if (username != null) {
        response.sendRedirect("home.htm");
    } else {
%>
<html lang="en">
    <head>
        <title>Company ABC</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <!-- jQuery -->
        <script src="resources/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/java_script.js"></script>
        <!-- Bootstrap Core CSS -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="resources/css/landing-page.css" rel="stylesheet">
        <link href="resources/css/landing-page2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        
        <style>
            #login .checkbox {
                margin-bottom: 20px;
                position: relative;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                -o-user-select: none;
                user-select: none;
            }
            #login .checkbox.show:before {
                content: '\e013';
                color: #1fa67b;
                font-size: 17px;
                margin: 1px 0 0 3px;
                position: absolute;
                pointer-events: none;
                font-family: 'Glyphicons Halflings';
            }
            #login .checkbox .character-checkbox {
                width: 25px;
                height: 25px;
                cursor: pointer;
                border-radius: 3px;
                border: 1px solid #ccc;
                vertical-align: middle;
                display: inline-block;
            }
            #login .checkbox .label {
                color: #6d6d6d;
                font-size: 13px;
                font-weight: normal;
            }
        </style>
    </head>

    <body>
        <!-- Navigation -->
        <%@include file="header.jsp" %>
        <!-- Header -->
        <a name="about"></a>
        <div class="intro-header">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="intro-message">
                            <h1><i class="fa fa-apple"></i> Company ABC</h1>
                            <h3>Business Latest Bootstrap template</h3>
                            <hr class="intro-divider">
                            <ul class="list-inline intro-social-buttons">
                                <li>
                                    <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                                </li>
                                <li>
                                    <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>
        <!-- /.intro-header -->

        <!-- Page Content -->

        <a  name="services"></a>
        <div class="content-section-a">

            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-sm-6">
                        <hr class="section-heading-spacer">
                        <div class="clearfix"></div>
                        <h2 class="section-heading">Social Media</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu libero scelerisque ligula sagittis faucibus eget quis lacus.Lorem ipsum </p>
                    </div>
                    <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                        <img class="img-responsive" src="${pageContext.servletContext.contextPath}/resources/img/ipad.png" alt="">
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>
        <!-- /.content-section-a -->

        <div class="content-section-b">

            <div class="container">

                <div class="row">
                    <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                        <hr class="section-heading-spacer">
                        <div class="clearfix"></div>
                        <h2 class="section-heading">Creative One</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et  dolore.</p>
                    </div>
                    <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                        <img class="img-responsive" src="${pageContext.servletContext.contextPath}/resources/img/dog.png" alt="">
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>
        <!-- /.content-section-b -->

        <div class="content-section-a">

            <div class="container">

                <div class="row">
                    <div class="col-lg-5 col-sm-6">
                        <hr class="section-heading-spacer">
                        <div class="clearfix"></div>
                        <h2 class="section-heading">Best Solution</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                    </div>
                    <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                        <img class="img-responsive" src="${pageContext.servletContext.contextPath}/resources/img/phones.jpg" alt="">
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>
        <!-- /.content-section-a -->

        <a  name="contact"></a>
        <div class="banner">

            <div class="container">

                <div class="row">
                    <div class="col-lg-6">
                        <h2>Connect to Start Bootstrap:</h2>
                    </div>
                    <div class="col-lg-6">
                        <ul class="list-inline banner-social-buttons">
                            <li>
                                <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                            </li>
                            <li>
                                <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                            </li>
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>
        <!-- /.banner -->



        <div class="modal fade forget-modal" tabindex="-1" role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title">Recovery password</h4>
                    </div>
                    <form method="get" action="resetpass.htm">
                        <div class="modal-body">
                            <p>Type your username account</p>
                            <input type="tel" name="username" id="recovery-email" class="form-control" autocomplete="off">
                        </div>
                        <div class="modal-body">
                            <p>Type your email account</p>
                            <input type="email" name="email" id="recovery-email" class="form-control" autocomplete="off">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-custom">Recovery</button>
                        </div>
                    </form>
                </div> <!-- /.modal-content -->
            </div> <!-- /.modal-dialog -->
        </div> <!-- /.modal -->



        <!-- Footer -->
        <%@include file="footer.jsp" %>

    </body>
</html>
<%
    }
%>

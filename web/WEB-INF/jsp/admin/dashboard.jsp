<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    function dongho() {
        $.post('TaskPanel', function (html) {
            $(".servlet").html(html);
        });
    }

    var t = setInterval(function () {
        dongho();
    }, 1000);

//    function rename() {
//        document.getElementById("morris-donut-chart").id = "div_top2";
//    }
//    function rename2() {
//        document.getElementById("div_top2").id = "morris-donut-chart";
//    }


</script>
<style>
    body .no-padding {
        padding: 0;
    }
    .widget-area {
        background-color: #fff;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        -ms-border-radius: 4px;
        -o-border-radius: 4px;
        border-radius: 4px;
        -webkit-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
        -moz-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
        -ms-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
        -o-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
        box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
        float: left;
        margin-top: 30px;
        padding: 25px 30px;
        position: relative;
        width: 100%;
    }
    .status-upload {
        background: none repeat scroll 0 0 #f5f5f5;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        -ms-border-radius: 4px;
        -o-border-radius: 4px;
        border-radius: 4px;
        float: left;
        width: 100%;
    }
    .status-upload form {
        float: left;
        width: 100%;
    }
    .status-upload form textarea {
        background: none repeat scroll 0 0 #fff;
        border: medium none;
        -webkit-border-radius: 4px 4px 0 0;
        -moz-border-radius: 4px 4px 0 0;
        -ms-border-radius: 4px 4px 0 0;
        -o-border-radius: 4px 4px 0 0;
        border-radius: 4px 4px 0 0;
        color: #777777;
        float: left;
        font-family: Lato;
        font-size: 14px;
        height: 142px;
        letter-spacing: 0.3px;
        padding: 20px;
        width: 100%;
        resize:vertical;
        outline:none;
        border: 1px solid #F2F2F2;
    }

    .status-upload ul {
        float: left;
        list-style: none outside none;
        margin: 0;
        padding: 0 0 0 15px;
        width: auto;
    }
    .status-upload ul > li {
        float: left;
    }
    .status-upload ul > li > a {
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        -ms-border-radius: 4px;
        -o-border-radius: 4px;
        border-radius: 4px;
        color: #777777;
        float: left;
        font-size: 14px;
        height: 30px;
        line-height: 30px;
        margin: 10px 0 10px 10px;
        text-align: center;
        -webkit-transition: all 0.4s ease 0s;
        -moz-transition: all 0.4s ease 0s;
        -ms-transition: all 0.4s ease 0s;
        -o-transition: all 0.4s ease 0s;
        transition: all 0.4s ease 0s;
        width: 30px;
        cursor: pointer;
    }
    .status-upload ul > li > a:hover {
        background: none repeat scroll 0 0 #606060;
        color: #fff;
    }
    .status-upload form button {
        border: medium none;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        -ms-border-radius: 4px;
        -o-border-radius: 4px;
        border-radius: 4px;
        color: #fff;
        float: right;
        font-family: Lato;
        font-size: 14px;
        letter-spacing: 0.3px;
        margin-right: 9px;
        margin-top: 9px;
        padding: 6px 15px;
    }
    .dropdown > a > span.green:before {
        border-left-color: #2dcb73;
    }
    .status-upload form button > i {
        margin-right: 7px;
    }
</style>
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
            <div class="col-lg-12">
                <div class="alert alert-info alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <i class="fa fa-info-circle"></i>  <strong>Like SB Admin?</strong> Try out <a href="http://startbootstrap.com/template-overviews/sb-admin-2" class="alert-link">SB Admin 2</a> for additional features!
                </div>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">26</div>
                                <div>New Comments!</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">12</div>
                                <div>New Tasks!</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-shopping-cart fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">124</div>
                                <div>New Orders!</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-support fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">13</div>
                                <div>Support Tickets!</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <div class="row" style="display: none;">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Area Chart</h3>
                    </div>
                    <div class="panel-body">
                        <div id="morris-area-chart"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-8">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> Line Graph Example with Tooltips</h3>
                        </div>
                        <div class="panel-body">
                            <div class="widget-area no-padding blank">
                                <form action="del_notification.htm" method="get">
                                    <button class="btn btn-default">Del</button>
                                    <div style="overflow-y: auto; height: 200px;">
                                        <c:forEach items="${list_noti}" var="row">
                                            <div style="padding: 5px; padding-left: 10px; border-radius: 5px;">
                                                <p class="text-mute" style="font-size: 13px; color: #999999" >
                                                    <input type="checkbox" name="id" value="${row.id}"/>
                                                    ${row.date}</p>
                                                <h4 class="text-info">${row.subject}</h4>
                                                <p>${row.detail}</p>
                                            </div>  
                                            <hr>
                                        </c:forEach>
                                        </form>
                                    </div>

                                    <div class="status-upload">
                                        <form action="post_notification.htm" method="get">
                                            <input type="text" name="subject" placeholder="Subject" class="form-control"/> 
                                            <input type="hidden" name="idStaff" value="${sessionScope.id}"/> 
                                            <textarea name="detail" placeholder="What are you doing right now?" ></textarea>
                                            <button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> Post</button>
                                        </form>
                                    </div><!-- Status Upload  -->
                            </div><!-- Widget Area -->
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Donut Chart</h3>
                        </div>
                        <div class="panel-body" >
                            <div id="morris-donut-chart"></div>
                            <div class="text-right">
                                <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> Line Graph Example with Tooltips</h3>
                        </div>
                        <div class="panel-body">
                            <div id="morris-line-chart"></div>
                            <div class="text-right">
                                <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Tasks Panel</h3>
                    </div>
                    <div class="panel-body">
                        <div class="list-group servlet">

                        </div>
                        <div class="text-right">
                            <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->



    <!-- /.row -->
</div>
<!-- /.container-fluid -->

</div>

<!--Morris Charts JavaScript--> 
<script src="resources/js/plugins/morris/raphael.min.js"></script>
<script src="resources/js/plugins/morris/morris.min.js"></script>
<!--<script src="resources/js/plugins/morris/morris-data.js"></script>-->

<jsp:include page="morris-data.jsp" />
<!--Flot Charts JavaScript--> 
<!--<script src="resources/js/plugins/flot/jquery.flot.js"></script>-->
<!--<script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>-->
<!--<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>-->
<!--<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>-->
<!--<script src="resources/js/plugins/flot/flot-data.js"></script>-->

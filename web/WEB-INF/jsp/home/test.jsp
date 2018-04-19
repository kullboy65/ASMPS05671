<%-- 
    Document   : test
    Created on : Feb 26, 2017, 4:22:28 AM
    Author     : PC
--%>

<%@page import="DAO.Record_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--demo-->
<%
    Record_DAO record_dao = new Record_DAO();
    String id = (String) request.getSession().getAttribute("id");
%>
<link href="resources/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
    function BrowseServer(startupPath, functionData) {
        var finder = new CKFinder();
        finder.basePath = 'ckfinder/'; //Đường path nơi đặt ckfinder
        finder.startupPath = startupPath; //Đường path hiện sẵn cho user chọn file
        finder.selectActionFunction = SetFileField; // hàm sẽ được gọi khi 1 file được chọn
        finder.selectActionData = functionData; //id của text field cần hiện địa chỉ hình
        //finder.selectThumbnailActionFunction = ShowThumbnails; //hàm sẽ được gọi khi 1 file thumnail được chọn	
        finder.popup(); // Bật cửa sổ CKFinder
    }



    function SetFileField(fileUrl, data) {
//        document.getElementById(data["selectActionData"]).value = fileUrl;
        $("#anhdaidien").attr('src', fileUrl);
    }

    function BrowseServer2(startupPath, functionData) {
        var finder = new CKFinder();
        finder.basePath = 'ckfinder/'; //Đường path nơi đặt ckfinder
        finder.startupPath = startupPath; //Đường path hiện sẵn cho user chọn file
        finder.selectActionFunction = SetFileField2; // hàm sẽ được gọi khi 1 file được chọn
        finder.selectActionData = functionData; //id của text field cần hiện địa chỉ hình
        //finder.selectThumbnailActionFunction = ShowThumbnails; //hàm sẽ được gọi khi 1 file thumnail được chọn	
        finder.popup(); // Bật cửa sổ CKFinder
    }

    function SetFileField2(fileUrl, data) {
        document.getElementById(data["selectActionData"]).value = fileUrl;
        $("#img").attr('src', fileUrl);
        $("#img").show();
        $("#del").show();
        document.getElementById("media").value = "";
        $("#media").hide();
    }

    function ShowThumbnails(fileUrl, data) {
        var sFileName = this.getSelectedFile().name; // this = CKFinderAPI
        document.getElementById('thumbnails').innerHTML +=
                '<div class="thumb">' +
                '<img src="' + fileUrl + '" />' +
                '<div class="caption">' +
                '<a href="' + data["fileUrl"] + '" target="_blank">' + sFileName + '</a> (' + data["fileSize"] + 'KB)' +
                '</div>' +
                '</div>';
        document.getElementById('preview').style.display = "";
        return false; // nếu là true thì ckfinder sẽ tự đóng lại khi 1 file thumnail được chọn
    }


    function setAvatar(id) {
        var src = document.getElementById("anhdaidien").src;
        $.post('Facebook', {'action': 'setAvatar', 'id': id, 'src': src}, function (html1) {
            $.post('ChangeAvatar', {'action': 'post', 'id': id, 'src': src}, function (html2) {
                location.reload();
            });
        });
    }


    $(document).ready(function () {
        $("#btnmedia").click(function () {
            $("#media").toggle();
            document.getElementById("urlHinh").value = "";
            $("#img").hide();
            $("#del").hide();
        });
    });

    function delImg() {
        document.getElementById("urlHinh").value = "";
        $("#img").hide();
        $("#del").hide();
    }

    window.onload = function () {
        $("#img").hide();
        $("#del").hide();
        $("#media").hide();
        $("#changepass").hide();
    };

    function deletepost(id) {
        $.post('Facebook', {'action': 'delPost', 'id': id}, function (html) {
            location.reload();
        });
    }

    function Seen(id) {
        $.post('Facebook', {'action': 'seen', 'id': id}, function (html) {
        });
    }

    var t;
    function donghofb() {
        var id = document.getElementById("idStaff").value;
        $.post('Facebook', {'action': 'reload', 'id': id}, function (html) {
            $(".reload").html(html);
        });

        $.post('Facebook', {'action': 'countlike', 'id': id}, function (html) {
            $(".countlike").html(html);
        });
    }

    t = setInterval(function () {
        donghofb();
    }, 1000);

    function stop() {
        clearInterval(t);
    }

    function tieptuc() {
        t = setInterval(function () {
            donghofb();
        }, 1000);
    }

    function checkpass() {
        var newpass = document.getElementById("newpass").value;
        var confirm = document.getElementById("confirm").value;

        if (newpass === confirm) {
            $("#changepass").show();
        } else {
            $("#changepass").hide();
        }
    }
</script>
<script type="text/javascript">
    CKEDITOR.replace("content", {
        filebrowserBrowseUrl: 'ckfinder/ckfinder.html',
        filebrowserImageBrowseUrl: 'ckfinder/ckfinder.html?type=Images',
        filebrowserFlashBrowseUrl: 'ckfinder/ckfinder.html?type=Flash',
        filebrowserUploadUrl: 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
        filebrowserImageUploadUrl: 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
        filebrowserFlashUploadUrl: 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
    });
</script>
<div class="content">
    <div class="container-fluid">
        <!--<div class="col-md-12">-->
        <div class="column col-md-12" id="main">
            <div class="padding">
                <div class="full col-sm-9">

                    <!-- content -->                      
                    <div class="row">

                        <!-- main col left --> 
                        <div class="col-sm-5">

                            <div class="panel panel-default">
                                <div class="panel-thumbnail"><center><img id="anhdaidien" src="${avatar}" width="200px" height="200px" style="border-radius: 300px; margin-top: 20px;"></center></div>
                                <div class="panel-body">
                                    <input type="button" class="btn btn-sm btn-default" name="btn-choose" id="btn-choose" value="Chọn File" onclick="BrowseServer('Images:/', 'urlHinh')">
                                    <input type="button" class="btn btn-sm btn-default" value="Submit" onclick="setAvatar(${sessionScope.id})">
                                    <p>45 Followers, 13 Posts</p>

                                    <p>
                                        <img src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s28" width="28px" height="28px">
                                    </p>
                                </div>
                            </div>


                            <div class="panel panel-default">
                                <div class="panel-heading"><a href="#" class="pull-right">View all</a> 
                                    <h4>Bootstrap Examples</h4>
                                    <div class="countlike">

                                    </div>
                                </div>
                                <div class="panel-body" onmouseover="stop()" onmouseout="tieptuc()">
                                    <div class="list-group reload">
                                        <!--reload-->

                                        <!--reload-->
                                    </div>
                                </div>
                            </div>


                            <div class="panel panel-default">
                                <div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>Profile</h4></div>
                                <div class="panel-body">

                                    <img src="${sessionScope.photo}" class="img-circle pull-right"> <a href="user.htm">${sessionScope.name} (${sessionScope.user})</a>
                                    <div class="clearfix"></div>
                                    There a load of new free Bootstrap 3 ready templates at Bootply. All of these templates are free and don't require extensive customization to the Bootstrap baseline.
                                    <hr>

                                    <ul class="list-unstyled">
                                        <li><p><b>Depart:</b> ${sessionScope.deparment}</p></li>
                                        <li><p><b>Gender:</b> ${sessionScope.gender=='nam'?'<i class="fa fa-venus text-danger"></i>':'<i class="fa fa-mars text-danger"></i>'}</p></li>
                                        <li><p><b>Email:</b> ${sessionScope.email}</p>
                                        <li><p><b>Role:</b> ${sessionScope.role}</p></li>
                                        
                                    </ul>

                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>Reset Password</h4></div>
                                <div class="panel-body">
                                    <form method="get" action="changepass.htm">
                                        <input type="password" class="form-control" style="margin-bottom: 10px;" name="old" placeholder="Old password" required=""/>
                                        <input type="password" class="form-control" style="margin-bottom: 10px;" name="new" placeholder="New password" id="newpass" required=""/>
                                        <input type="password" class="form-control" style="margin-bottom: 10px;" placeholder="Confirm" id="confirm" required="" onkeyup="checkpass()"/>
                                        <input type="hidden" value="${sessionScope.id}" name="id"/>
                                        <button class="btn btn-primary" type="submit" id="changepass">Change Password</button>
                                    </form>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading"><h4>What Is Bootstrap?</h4></div>
                                <div class="panel-body">
                                    Bootstrap is front end frameworkto build custom web applications that are fast, responsive &amp; intuitive. It consist of CSS and HTML for typography, forms, buttons, tables, grids, and navigation along with custom-built jQuery plug-ins and support for responsive layouts. With dozens of reusable components for navigation, pagination, labels, alerts etc..                          </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-thumbnail"><img src="/assets/example/bg_4.jpg" class="img-responsive"></div>
                                <div class="panel-body">
                                    <p class="lead">Social Good</p>
                                    <p>1,200 Followers, 83 Posts</p>
                                    <p>
                                        <img src="https://lh6.googleusercontent.com/-5cTTMHjjnzs/AAAAAAAAAAI/AAAAAAAAAFk/vgza68M4p2s/s28-c-k-no/photo.jpg" width="28px" height="28px">
                                        <img src="https://lh4.googleusercontent.com/-6aFMDiaLg5M/AAAAAAAAAAI/AAAAAAAABdM/XjnG8z60Ug0/s28-c-k-no/photo.jpg" width="28px" height="28px">
                                        <img src="https://lh4.googleusercontent.com/-9Yw2jNffJlE/AAAAAAAAAAI/AAAAAAAAAAA/u3WcFXvK-g8/s28-c-k-no/photo.jpg" width="28px" height="28px">
                                    </p>
                                </div>
                            </div>


                        </div>

                        <!-- main col right -->
                        <div class="col-sm-7">

                            <div class="well"> 
                                <!--form-->
                                <form class="form-horizontal" role="form" action="btnpost.htm">
                                    <h4>What's New</h4>
                                    <select class="" name="role">
                                        <option  value="true" selected="selected">Public</option>  
                                        <option  value="false">Private</option>  
                                    </select>

                                    <div class="form-group" style="padding:10px; padding-bottom: 0px;">
                                        <textarea class="form-control" rows="4" placeholder="Update your status" name="text" required=""></textarea>
                                    </div>
                                    <div class="form-group" style="padding:10px; padding-top: 0px;">
                                        <input type="text" class="form-control" value="" placeholder="Media" name="media" id="media"/>
                                        <input type="hidden" name="image" id="urlHinh"/>
                                        <input type="hidden" name="idStaff" id="idStaff" value="${sessionScope.id}" />
                                    </div>
                                    <button class="btn btn-primary pull-right" type="submit">Post</button>
                                    <ul class="list-inline">
                                        <li>
                                            <a id="btnmedia">
                                                <i class="fa fa-play-circle"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="BrowseServer2('Images:/', 'urlHinh')">
                                                <i class="fa fa-camera"></i>
                                            </a>
                                        </li>
                                        <li style="margin-left: 50px; position: relative;">
                                            <i class="fa fa-times text-danger" id="del" style="font-size: 10px; position: absolute; left: 50px; top:-10px;" onclick="delImg()"></i>
                                            <img src="//placehold.it/150x150" width="50px" height="50px" class="img-thumbnail" id="img"/>
                                        </li>
                                    </ul>
                                </form>
                                <!--form-->
                            </div>
                            <!--newfeed-->
                            <c:forEach var="newfeed" items="${listnewfeed}">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="height: 70px;"><img src="${newfeed.avatar}" width="50px" height="50px" style="border-radius: 50px;"/> 
                                        <a href="#">${newfeed.username}</a>
                                        <i class="${newfeed.role?'fa fa-globe':'fa fa-user'}" style="font-size: 16px;"></i>
                                        <c:set var="this_id" value="${sessionScope.id}"></c:set>
                                        <c:set var="idstaff" value="${newfeed.idStaff}"></c:set>
                                        <%
                                            String this_id = String.valueOf(pageContext.getAttribute("this_id"));
                                            String idstaff = String.valueOf(pageContext.getAttribute("idstaff"));
                                            if (this_id.equals(idstaff)) {
                                        %>
                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs pull-right" onclick="deletepost(${newfeed.id})" >
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <%
                                            }
                                        %>


                                    </div>
                                    <div class="panel-body">
                                        <p class="text-muted" style="font-size: 12px;"><i class="fa fa-clock-o text-mute" style="font-size: 15px;"></i> ${newfeed.date}</p>

                                        <c:set var="newimage" value="${newfeed.image}"></c:set>
                                        <c:set var="newmedia" value="${newfeed.media}"></c:set>



                                        <%
                                            String newimage = String.valueOf(pageContext.getAttribute("newimage"));
                                            String newmedia = String.valueOf(pageContext.getAttribute("newmedia"));
                                            if (newimage.length() > 0) {
                                        %>
                                        <img src="${newfeed.image}" width="100%"/>
                                        <div class="clearfix"></div>
                                        <hr>
                                        <%
                                        } else if (newmedia.contains("www.youtube.com")) {
                                        %>
                                        <iframe class="phim" width="100%" height="280" src="${newfeed.media}" frameborder="0" allowfullscreen></iframe>
                                        <div class="clearfix"></div>
                                        <hr>
                                        <%
                                        } else if (newmedia.contains("mp3.zing.vn")) {
                                        %>
                                        <iframe class="phim" width="100%" src="${newfeed.media}" frameborder="0" scrolling="no" allowfullscreen></iframe>
                                        <div class="clearfix"></div>
                                        <hr>      
                                        <%
                                            }
                                        %>


                                        ${newfeed.text}
                                    </div>
                                </div>
                            </c:forEach>
                            <!--newfeed-->





                        </div>
                    </div><!--/row-->

                    <div class="row">
                        <!--                        <div class="col-sm-6">
                                                    <a href="#">Twitter</a> <small class="text-muted">|</small> <a href="#">Facebook</a> <small class="text-muted">|</small> <a href="#">Google+</a>
                                                </div>-->
                    </div>

                    <div class="row" id="footer">    
                        <!--                        <div class="col-sm-6">
                        
                                                </div>
                                                <div class="col-sm-6">
                                                    <p>
                                                        <a href="#" class="pull-right">©Copyright 2013</a>
                                                    </p>
                                                </div>-->
                    </div>

                    <hr>

                    <h4 class="text-center">
                        <!--<a href="http://bootply.com/96266" target="ext">Download this Template @Bootply</a>-->
                    </h4>

                    <hr>


                </div><!-- /col-9 -->
            </div><!-- /padding -->
        </div>
    </div>
</div>

<!--demo-->

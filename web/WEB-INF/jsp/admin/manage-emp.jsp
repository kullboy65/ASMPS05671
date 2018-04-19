<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fc" %> 

<!-- online -->
<script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<style>
    .btn {
        display: inline-block;
        padding: 6px 12px !important;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.42857143;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        background-image: none;
        border: 1px solid transparent;
        border-radius: 4px;
    }

    .user-details {position: relative; padding: 0;}
    .user-details .user-image {position: relative;  z-index: 1; width: 100%; text-align: center;}
    .user-image img { clear: both; margin: auto; position: relative;}

    .user-details .user-info-block {width: 100%; position: absolute; top: 55px; background: rgb(255, 255, 255); z-index: 0; padding-top: 35px;}
    .user-info-block .user-heading {width: 100%; text-align: center; margin: 10px 0 0;}
    .user-info-block .navigation {float: left; width: 100%; margin: 0; padding: 0; list-style: none; border-bottom: 1px solid #428BCA; border-top: 1px solid #428BCA;}
    .navigation li {float: left; margin: 0; padding: 0;}
    .navigation li a {padding: 20px 30px; float: left;}
    .navigation li.active a {background: #428BCA; color: #fff;}
    .user-info-block .user-body {float: left; padding: 5%; width: 90%;}
    .user-body .tab-content > div {float: left; width: 100%;}
    .user-body .tab-content h4 {width: 100%; margin: 10px 0; color: #333;}
</style>
<script>
    $(document).ready(function () {
        $('#datatable').dataTable();

        $("[data-toggle=tooltip]").tooltip();

    });
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
        document.getElementById(data["selectActionData"]).value = fileUrl;
        $("#anhdaidien").attr('src', fileUrl);
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
</script>


<script type="text/javascript">

    function viewDetail(id) {
        $.post('ViewDetailServlet', {'id': id}, function (data) {
            $(".modal-body").html(data);
        });
    }

    function deleteEmp(id) {
        $.post('Del_emp', {'id': id}, function (data) {
            $(".confirm").html(data);
        });
    }

    function getUsername() {
        var name = $("#name").val();
        $.post('Username', {'name': name}, function (data) {
            $("#username").val(data);
            $("#email_input").val(data + "@gmail.com");
        });
    }

    function Inhoa() {
        var name = $("#name").val();
        $.post('Inhoa', {'name': name}, function (data) {
            $("#name").val(data);
        });
    }



</script>


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
            <div class="col-md-12 col-md-offset-0">
                <h3 class="text-center"><b>NHÂN VIÊN</b></h3>
                <form action="insert_emp.htm" method="post" accept-charset="ISO-8859-1">
                    <div class="col-md-4 col-md-offset-0">
                        <input class="form-control" type="hidden" name="id" value="${emp_edit.id}"></input>
                        <div class="form-group">
                            <label for="">Ho va ten</label>
                            <input class="form-control" type="text" id="name" name="name" onkeyup="Inhoa(), getUsername()" value="${emp_edit.name}" required=""></input>
                        </div>

                        <div class="form-group">
                            <label for="">Ngay Sinh</label> 
                            <input class="form-control" type="date" name="birthday" value="${emp_edit.birthday}" max="1999-12-31" min="1968-01-01" required="">
                        </div>

                        <div class="form-group">
                            <label for="">Giới Tính</label> <br>
                            <p class="text-primary">
                                <input name="gender" type="radio" value="true" checked="checked"/> Male</p>
                            <p class="text-primary">
                                <input name="gender" type="radio" value="false"
                                       <c:choose><c:when test="${emp_edit.gender == 'false'}">checked="checked"</c:when></c:choose>/>
                                           Female</p>
                                </div>
                            </div>  

                            <div class="col-md-4 col-md-offset-0">
                                <div class="form-group">
                                    <label for="">Email</label>
                                    <input class="form-control" type="text" name="email" id="email_input" readonly="true" value="${emp_edit.email}"></input>
                        </div>

                        <div class="form-group">
                            <label for="">Username</label> 
                            <input class="form-control" type="text" id="username"  name="username" readonly="true" value="${emp_edit.username}"></input> 
                        </div>

                        <div class="form-group">
                            <label for="">Lương</label> 
                            <input class="form-control" type="number" name="salary" value="${emp_edit.salary}" required=""></input> 
                        </div>




                    </div> 

                    <div class="col-md-4 col-md-offset-0">

                        <div class="form-group">
                            <label for="">Phòng Ban</label> 
                            <select class="form-control" name="department">
                                <c:forEach items="${list_dept}" var="dept">
                                    <option  value="${dept.id}" <c:choose><c:when test="${emp_edit.department == dept.name}">selected="selected"</c:when></c:choose>>${dept.name}</option>  
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="">Phân Quyền</label> 
                            <select class="form-control" name="role">
                                <option value="member">Member</option>  
                                <option value="admin" <c:choose><c:when test="${emp_edit.role == 'admin'}">selected="selected"</c:when></c:choose>>Admin</option>  
                                    </select>

                                </div>
                                <div class="form-group">
                                    <label for="">Điện Thoại</label> 
                                    <input class="form-control" type="number" name="phone" value="${emp_edit.phone}" required=""></input> 
                        </div>
                        <div class="form-group">
                            <label for="">Ảnh Đại Diện</label><br>
                            <img id="anhdaidien" src="${emp_edit.photo}" width="70px" height="70px" class="img-circle" style="float: left; margin: 10px;"/>
                            <input class="form-control" type="hidden" style="width:71%; margin: 10px;" name="photo" id="urlHinh" value="${emp_edit.photo}">
                            <input type="button" class="btn btn-warning" name="btn-choose" id="btn-choose" value="Chọn File" onclick="BrowseServer('Images:/', 'urlHinh')">
                        </div>
                    </div> 

                    <p class="text-danger">${msg}</p>
                    <button name="btnInsert" class="btn btn-primary btn-sm" <c:choose><c:when test="${emp_edit.id > 0}">disabled="disabled"</c:when></c:choose> >Thêm</button>  
                    <button name="btnUpdate" class="btn btn-success btn-sm" <c:choose><c:when test="${emp_edit.id == null}">disabled="disabled"</c:when></c:choose>>Cập nhật</button>  
                            <a href="ad_index.htm?manage-emp&page=manage-emp"  class="btn btn-default btn-sm" >Nhập lại</a>
                        </form>
                    </div>

                    <div class="row col-md-12 col-md-offset-0 custyle">
                        <hr>
                ${message} 

            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->


    <div class="row">

        <div class="col-md-12">


            <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Department</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Salary</th>
                        <th>Role</th>

                        <th>View</th>
                        <th>Action</th>
                        <!--<th>Delete</th>-->
                    </tr>
                </thead>

                <tfoot>
                    <tr>
                        <th>Full Name</th>
                        <th>Department</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Salary</th>
                        <th>Role</th>

                        <th>View</th>
                        <th>Action</th>
                        <!--<th>Delete</th>-->
                    </tr>
                </tfoot>

                <tbody>
                    <c:forEach items="${list_empt}" var="emp">
                        <tr>
                            <td>${emp.name}</td>
                            <td>${emp.department}</td>
                            <td>${emp.username}</td>
                            <td>${emp.email}</td>
                            <td>${emp.phone}</td>
                            <td><fc:formatNumber value="${emp.salary}" type="currency" /></td>
                            <td>${emp.role}</td>
                            <td><p data-placement="top"  title="Detail"><button class="btn btn-primary btn-xs" data-title="Detail" data-toggle="modal" data-target="#edit" onclick="viewDetail(${emp.id})"><span class="glyphicon glyphicon-search" ></span> Detail</button></p></td>
                            <td>
                                <a class='btn btn-info btn-xs' href="ad_index.htm?lnkEdit&id=${emp.id}"><span class="glyphicon glyphicon-edit" style="padding: 3px;"></span></a>
                                <p data-placement="top" data-toggle="tooltip" title="Delete" style="float: right;"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" onclick="deleteEmp(${emp.id})"><span class="glyphicon glyphicon-trash" style="padding: 3px;"></span></button></p>
                            </td>
                        </tr>     
                    </c:forEach>

                </tbody>
            </table>


        </div>
    </div>

    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title custom_align" id="Heading">View Detail</h4>
                </div>
                <div class="modal-body">


                    <!--                    <div class="row">
                                            <div class="col-sm-12 col-md-12 user-details">
                                                <div class="user-image">
                                                    <img src="http://www.gravatar.com/avatar/2ab7b2009d27ec37bffee791819a090c?s=100&d=mm&r=g" alt="Karan Singh Sisodia" title="Karan Singh Sisodia" class="img-circle">
                                                </div>
                                                <div class="user-info-block">
                                                    <div class="user-heading">
                                                        <h3>Phan Phu Kiet</h3>
                                                        <span class="help-block">kietpp</span>
                                                    </div>
                                                    <ul class="navigation">
                                                        <li class="active">
                                                            <a data-toggle="tab" href="#information">
                                                                <span class="glyphicon glyphicon-user"></span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="tab" href="#settings">
                                                                <span class="glyphicon glyphicon-cog"></span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="tab" href="#email">
                                                                <span class="glyphicon glyphicon-envelope"></span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="tab" href="#events">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <div class="user-body">
                                                        <div class="tab-content">
                                                            <div id="information" class="tab-pane active">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <h4>Send Message</h4>
                                                                    <dd><abbr title="Username"><strong>Username</strong></abbr>: Preparing Form 1040 and other federal forms</dd>
                                                                    <dd><abbr title="Email"><strong>Email</strong></abbr>: Group Live</dd>
                                                                    <dd><abbr title="Birthday"><strong>Birthday</strong></abbr>: Update </dd>
                                                                    <dd><abbr title="Gender"><strong>Gender</strong></abbr>: Taxes – 8CPE </dd>
                                                                    <dd><abbr title="Password"><strong>Password</strong></abbr>: None</dd>
                                                                    <dd><abbr title="Salary"><strong>Salary</strong></abbr>: None</dd>
                                                                </div>============(./col-lg7)====================
                                                            </div>
                                                            <div id="settings" class="tab-pane">
                                                                <h4>Notes</h4>
                                                                <textarea rows="4" cols="50" class="form-control" placeholder="Email Content...">At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies.</textarea>
                                                            </div>
                                                            <div id="email" class="tab-pane">
                                                                <h4>Send Message</h4>
                                                                <form action="ad_index.htm?manage-emp&page=manage-emp" method="post">
                                                                    <input type="hidden" name="from" value=""/>
                                                                    <input type="hidden" name="to" value=""/>
                                                                    <div class="form-group">
                                                                        <input class="form-control" name="subject" type="text" placeholder="Subject...">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <textarea rows="4" cols="50" name="content" class="form-control" placeholder="Email Content...">At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies.</textarea>
                                                                    </div>
                                                                    <button type="submit" class="btn btn-warning btn-sm pull-right" style="width: 30%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                                                                </form>
                                                            </div>
                                                            <div id="events" class="tab-pane">
                                                                <h4>Feedback</h4>
                                                                <form action="femp.htm" method="post" accept-charset="ISO-8859-1">
                                                                    <input type="hidden" name="id" value="123"/>
                                                                <div class="form-group">
                                                                    <input class="form-control" type="date" name="date" value="" max="1999-12-31">
                                                                </div>
                                                                <div class="form-group">
                                                                    <textarea rows="4" cols="50" name="reason" class="form-control" placeholder="Reason..."></textarea>
                                                                </div>
                                                                <div class="form-group">
                                                                    <p class="text-primary" style="float: left; margin-right: 20px;">
                                                                        <input name="like" type="radio" value="true" checked="checked"/> <span class="fa fa-thumbs-o-up danger" style="font-size: 30px;"></span></p>
                                                                    
                                                                    <p class="text-danger">
                                                                        <input name="like" type="radio" value="false"/> <span class="fa fa-thumbs-o-down" style="font-size: 30px;"></span></p>
                                                                </div>
                                                                <button type="submit" class="btn btn-warning btn-sm pull-right" style="width: 30%;"><span class="glyphicon glyphicon-ok-sign"></span> Submit</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->


                </div>
                <!--                    <div class="modal-footer ">
                                        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                                    </div>-->
            </div>
            <!-- /.modal-content --> 
        </div>
        <!-- /.modal-dialog --> 
    </div>

    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content confirm">
                <!--                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
                                </div>
                                <div class="modal-body">
                
                                    <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
                
                                </div>
                                <div class="modal-footer ">
                                    <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
                                </div>-->
            </div>
            <!-- /.modal-content --> 
        </div>
        <!-- /.modal-dialog --> 
    </div>

</div>

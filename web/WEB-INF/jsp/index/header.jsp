<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>        
<script>
    $(function () {
        $("a[data-lang]").click(function () {
            var lang = $(this).attr("data-lang");
            $.get("index.htm?language=" + lang, function () {
                location.reload();
            });
            return false;
        });
    }
    );
</script>
<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
    <div class="container topnav">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand topnav" href="#"><i class="fa fa-apple"></i> Company ABC</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#about"><s:message code="global.menu.about"/></a>
                </li>
                <li>
                    <a href="#services"><s:message code="global.menu.service"/></a>
                </li>
                <li>
                    <a href="#contact"><s:message code="global.menu.contact"/></a>
                </li>
                <li>
                    <a href="#" data-lang="en">English</a>
                </li>
                <li>
                    <a href="#" data-lang="vi">Tiếng Việt</a>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b><s:message code="global.menu.login"/></b> <span class="caret"></span></a>
                    <ul id="login-dp" class="dropdown-menu">
                        <li>
                            <div class="row">
                                <div class="col-md-12">
                                    <s:message code="global.menu.signin"/>
                                    <div class="social-buttons">
                                        <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                                        <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
                                    </div>
                                    <s:message code="global.menu.or"/>
                                    <form class="form" role="form" method="post" action="login.htm" accept-charset="UTF-8" id="login-nav">
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                            <input type="text" name="username" class="form-control" id="exampleInputEmail2" placeholder="Username" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                                            <input type="password" name="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
                                            <div class="help-block text-right"><a href="javascript:;" class="forget" data-toggle="modal" data-target=".forget-modal"><s:message code="global.menu.forgetpass"/></a></div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block"><s:message code="global.menu.signin"/></button>
                                        </div>

                                        <div class="checkbox">
<!--                                            <label>
                                                <input type="checkbox"> keep me logged-in
                                            </label>-->
                                        </div>
                                    </form>
                                </div>
                                <div class="bottom text-center">
                                    <a href="#"><b><i class="fa fa-apple"></i> Company ABC </b></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->





    </div>
    <!-- /.container -->
</nav>

<%-- 
    Document   : windows8
    Created on : Feb 20, 2017, 9:28:33 PM
    Author     : PC
--%>

<%@page import="model.function"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    //windows
    $(document).ready(function () {
        $(".tile").height($("#tile1").width());
        $(".carousel").height($("#tile1").width());
        $(".item").height($("#tile1").width());

        $(window).resize(function () {

            if (this.resizeTO)
                clearTimeout(this.resizeTO);
            this.resizeTO = setTimeout(function () {
                $(this).trigger('resizeEnd');

            }, 10);
        });

        $(window).bind('resizeEnd', function () {
            $(".tile").height($("#tile1").width());
            $(".carousel").height($("#tile1").width());
            $(".item").height($("#tile1").width());

        });


//        $(window).on("load", function () {
//            $("#day").html("Hello World");
//        });

        setInterval(function () {
            var now = new Date(Date.now());
            var hours = now.getHours(), minutes = now.getMinutes();

            var seconds = now.getSeconds();

            if (hours < 10) {
                hours = "0" + now.getHours();
            }
            if (minutes < 10) {
                minutes = "0" + now.getMinutes();
            }
            if (seconds < 10) {
                seconds = "0" + now.getSeconds();
            }
            var formatted = hours + ":" + minutes;
                    $("#day").html(formatted);
                    $("#seconds").html(seconds);
        }, 1000);
        
        
        
        
        
    });


</script>

<!DOCTYPE html>
<div class="dynamicTile" style="background: url('resources/img/banner-bg.jpg'); margin-bottom: 10px;"> 
    <div class="row ">
        <div class="col-sm-2 col-xs-4">
            <div id="tile1" class="tile">
                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/twitter1.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/twitter2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile2" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/hot.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/hot2.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/hot3.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile3" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/weather2.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/weather.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile4" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <a href="https://www.facebook.com/" target="_blank"><img src="http://handsontek.net/demoimages/tiles/facebook3.png" class="img-responsive"/></a>
                        </div>
                        <div class="item">
                            <a href="https://www.facebook.com/" target="_blank"><img src="http://handsontek.net/demoimages/tiles/facebook2.png" class="img-responsive"/></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile5" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!--Wrapper for slides--> 
                    <div class="carousel-inner">
                        <div class="item active">
                            <a href="http://news.zing.vn/" target="_blank"><img src="http://handsontek.net/demoimages/tiles/neews.png" class="img-responsive"/></a>
                        </div>
                        <div class="item">
                            <a href="http://news.zing.vn/" target="_blank"><img src="http://handsontek.net/demoimages/tiles/neews2.png" class="img-responsive"/></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile6" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/skype.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/skype2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-xs-8">
            <div id="tile7" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/gallery.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/gallery2.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/gallery3.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile8" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!--Wrapper for slides--> 
                    <div class="carousel-inner">
                        <div class="item active">
                            <a href="http://mp3.zing.vn/bang-xep-hang/bai-hat-Viet-Nam/IWZ9Z08I.html" target="_blank"><img src="http://handsontek.net/demoimages/tiles/music.png" class="img-responsive"/></a>
                        </div>
                        <div class="item">
                            <a href="http://mp3.zing.vn/bang-xep-hang/bai-hat-Viet-Nam/IWZ9Z08I.html" target="_blank"><img src="http://handsontek.net/demoimages/tiles/music2.png" class="img-responsive"/></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile9" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h1 style="margin-top: 0px; margin-bottom: 0px; font-size: 80px; color: white;"><%= function.Date("dd")%></h1>
                            <p style="margin-top: 0px; margin-left: 10px; font-size: 20px; color: white;"><%= function.Date("MMMMM")%></p>
                        </div>

                        <div class="item">
                            <h1 id="day" style="margin:10px; font-size: 60px; color: white;"></h1>
                            <p style="margin-top: 0px; margin-left: 10px; font-size: 30px; color: white;" id="seconds"></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div id="" class="tile" style="background: url(resources/img/1.png)">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-child fa-4x"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Customize your tiles</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Text, Icons, Images</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Combine them and create your metro style</h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

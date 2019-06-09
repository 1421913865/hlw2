<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>   
<html xmlns="http://www.w3.org/1999/xhtml">   
    <head>   
            <title></title>   
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
             <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen, projection">
            <link rel="stylesheet" type="text/css" href="css/buttons.css" />
            <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />

    <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript">
            function checkUsernameExit(){
                if ($("#uname").val() == "") {
                    $("#tishi").text("用户名不能为空");
                } else {
                    var username=$("#uname").val();
                    $("#tishi").text("");
                    $.ajax({
                        type : "post",
                        dataType : "json",
                        url: "/user/checkexit",
                        cache: false,
                        data:{"uname":username},
                        success : function(result) {
                            console.log(result);
                            if(result.check==0){
                                $("#tishi").text("用户名不存在");
                            }
                            else{
                                $("#tishi").text("");
                            }

                        }
                    });
                }
            }

            function  checkIsSame() {
                var password=$("#registerupassword").val();
                var password2=$("#registerupassword2").val();
                if (password==password2){
                    $("#tishi4").text("");
                }
                if (password!=password2){
                    $("#tishi4").text("俩次输入密码不一样");
                }
            }
            function checkUsernameExit2(){
                if ($("#registeruname").val() == "") {
                    $("#tishi3").text("用户名不能为空");
                } else {
                    var username=$("#registeruname").val();
                    $("#tishi3").text("");
                    $.ajax({
                        type : "post",
                        dataType : "json",
                        url: "/user/checkexit",
                        cache: false,
                        data:{"uname":username},
                        success : function(result) {
                            console.log(result);
                            if(result.check==1){
                                $("#tishi3").text("用户名已存在");
                            }
                            else{
                                $("#tishi3").text("");
                            }

                        }
                    });
                }
            }
            function checkUserpasswordExit(){
                if ($("#upassword").val() == "") {
                    $("#tishi2").text("密码不能为空");
                } else {
                    var username=$("#uname").val();
                    var userpassword=$("#upassword").val();
                    $("#tishi2").text("");
                    $.ajax({
                        type : "post",
                        dataType : "json",
                        url: "/user/checkpasswordexit",
                        cache: false,
                        data:{"uname":username,"upassword":userpassword},
                        success : function(result) {
                            console.log(result);
                            if(result.check==0){
                                $("#tishi2").text("密码错误");
                            }
                            else{
                                $("#tishi2").text("");
                            }

                        }
                    });
                }
            }
            function checklogin() {
                var username=$("#uname").val();
                var userpassword=$("#upassword").val();
                $.ajax({
                    type : "post",
                    dataType : "json",
                    url: "/user/checkpasswordexit",
                    cache: false,
                    data:{"uname":username,"upassword":userpassword},
                    success : function(result) {
                        console.log(result);
                        if(result.check==0){
                           alert("密码错误");
                        }
                        else{
                            window.location.href="/user/login/"+username;
                        }

                    }
                });
            }
        </script>


        </head>   
   
    <body>   
  <div id="wrapper">
    <h3 id="sign-in-tab" class="active">Sign In</h3>
    <h3 id="register-tab">Register</h3>
    <!-- BEGIN FORM SECTION -->
    <ul id="form-section">
        <!-- BEGIN SIGN IN FORM -->
        <form class="sign-in-form" action="" method="post">
            <p><span class="register-numbering">1</span><span class="register-numbering-text">Login by Account</span></p>

            <li>
                <label>
                    <span>用户名</span>
                    <input placeholder="Please enter your username" onblur="checkUsernameExit()" id="uname" name="uname" pattern="[a-zA-Z0-9]{6,}" type="text" tabindex="1" title="It must contain the username that you have chosen at registration" required autofocus>
                </label>
            </li>
            <li id="tishi"></li>
            <li>
                <label>
                    <span>密码</span>
                    <input placeholder="Please enter your password" onblur="checkUserpasswordExit()" id="upassword"  name="upassword" pattern=".{6,}" type="password" tabindex="2" title="It must contain the password that you have chosen at registration" required>
                </label>
            </li>
            <li id="tishi2"></li>
            <li>
                <button name="sign-in-submit" type="submit" onclick="checklogin()" id="sign-in-submit">Sign In</button>
            </li>
            <%--<li>
                <label class="left-column">
                    <input type="button" id="facelogin" onclick="tofacelogin()"   class="facebook-login" value="Login with Face">
                </label>

            </li>--%>

            <div style="clear: both;"></div>
        </form><!-- END OF SIGN IN FORM -->

        <!-- BEGIN REGISTER FORM -->
        <form class="register-form" action="/user/save" method="post">
            <div style="clear: both;"></div>
            <p><span class="register-numbering">1</span><span class="register-numbering-text">Account credentials</span></p>
            <li>
                <label>
                    <span>用户名</span>
                    <input type="text" id="registeruname" onblur="checkUsernameExit2()" name="username" tabindex="8" pattern="[a-zA-Z0-9]{6,}"  placeholder="Please enter your username" title="It must contain alphanumeric characters and a length of minimum 6 characters !" required>
                </label>
            </li>
            <li id="tishi3"></li>
            <li>
                <label>
                    <span>密码</span>
                    <input type="password" id="registerupassword" onblur="checkIsSame()" name="password" tabindex="9" pattern=".{6,}"  placeholder="Please enter your password" title="It can contain all types of characters and a length of minimum 6 characters!" required>
                </label>
            </li>
            <li>
                <label>
                    <span>确认密码</span>
                    <input type="password" id="registerupassword2" onblur="checkIsSame()" name="password2" tabindex="9" pattern=".{6,}"  placeholder="Please enter your password" title="It can contain all types of characters and a length of minimum 6 characters!" required>
                </label>
            </li>
            <li id="tishi4"></li>
            <li>
                <label>
                    <span>上传照片</span>
                <canvas style="display:block" id="canvas2" width="200" height="150" style="float:left;margin-left: 50px;margin-top: 30px;"></canvas>
                </label>
            </li>
            <div style="clear: both;"></div>
            <li>
                <button name="submit" tabindex="11" type="submit" onclick="photoregist()" id="create-account-submit">创建账号</button>
            </li>
        </form><!-- END OF REGISTER FORM -->


        <div id="contentHolder" style="margin: 5px 0;">
            <div style="text-align:center;clear:both">
            </div>
            <p><span class="register-numbering">2</span><span class="register-numbering-text">Login by Face</span></p>

                <video  id="video" width="200" height="150" style="margin-left: -19px;"  autoplay></video>
               
            <a  id="picture" style="margin-top: -100px;" class="button button-3d button-caution"><i class="fa fa-camera"></i> Go</a>

              <canvas style="display:block" id="canvas" width="200" height="150" style="float:left;margin-left: 50px;margin-top: 30px;"></canvas>
                <%--<button id="sc" style="display:block" >上传</button>--%>
            <a  id="sc" class="button button-3d button-action button-pill" style="margin-top: -120px;margin-left: 200px;" ><i class="fa fa-telegram" aria-hidden="true"></i>上传</a>

        </div>

    </ul><!-- END OF FORM SECTION -->
</div><!-- END OF WRAPPER DIV -->
<div style="text-align:center;clear:both"><br>
</div>

<script>

    navigator.getUserMedia = navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia;
    if (navigator.getUserMedia) {
        navigator.getUserMedia({ audio: true, video: { width: 200, height: 150 } },
            function(stream) {
                var video = document.getElementById("video");
                video.src = window.URL.createObjectURL(stream);
                video.onloadedmetadata = function(e) {
                    console.log('nihao44eee4aaaaddda');
                    video.play();
                };
            },
            function(err) {
                console.log("The following error occurred: " + err.name);
            }
        );
    } else {
        console.log("getUserMedia not supported");
    }


    document.getElementById("picture").addEventListener("click", function () {
        debugger;
        var context = document.getElementById("canvas").getContext("2d");
        var context2 = document.getElementById("canvas2").getContext("2d");
        context.drawImage(video, 0, 0, 200, 150);
        context2.drawImage(video, 0, 0, 200, 150);
    });
    document.getElementById("sc").addEventListener("click", function () {
        var imgData=document.getElementById("canvas").toDataURL("image/png");
                var data2=imgData.substr(22);
                debugger;
                console.log(data2);
                $.ajax({
                    url:"/sc",
                    contentType:"application/json;charset=utf-8",
                    data:{"sj":data2},
                    datatype:"json",
                    type:"post",
                    success:function (data) {
                if (data.msg==1){
                    window.location.href="/user/login/"+data.username;}
                if (data.msg==0){
                    alert("请对准人脸!");
                    }

            }

        })

    });
    function photoregist() {
        var imgData=document.getElementById("canvas2").toDataURL("image/png");
        var data2=imgData.substr(22);
        debugger;
        console.log(data2);
        $.ajax({
            url:"/user/sc2",
            contentType:"application/json;charset=utf-8",
            data:{"sj":data2},
            datatype:"json",
            type:"post",
            success:function (data) {
                window.location.href="login.jsp";

            }

        })
    }
</script>

    </body>   
</html>  

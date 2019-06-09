<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/4
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>HLWLOGS</title>
    <!--js-->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>

    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jquery1.min.js"></script>
    <script type="text/javascript" src="/js/chatjs1.js"></script>
    <script type="text/javascript" src="/js/css3-mediaqueries.js"></script>
    <script type="text/javascript" src="/js/chat.js"></script>
    <script type="text/javascript" src="/js/jquery-form.js"></script>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/buttons.css" />
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="/css/zerogrid.css">
    <link rel="stylesheet" href="/css/index.style.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <script type="text/javascript">
        function jiazai() {
            if (${user.uname!=null}){
                $("#dl").css("display","block");
                $("#zy").css("display","block");
                $("#pl").css("display","block");
                $("#gl").css("display","block");
                $("#bk").css("display","block");
                $("#wdl").css("display","none");
            }
            else {
                $("#wdl").css("display","block");
                $("#bk").css("display","none");
                $("#dl").css("display","none");
                $("#zy").css("display","none");
                $("#pl").css("display","none");
                $("#gl").css("display","none");
            }
        }


    </script>

</head>
<body onload="jiazai()">
<!--------------Header--------------->
<header>
    <div class="wrap-header zerogrid">
        <div id="logo"><a href="#"><img src="/img/hlwbolgs3.png"/></a></div>
        <nav>
            <div class="wrap-nav">
                <div class="menu">
                    <ul>
                        <li id="zy"><a href="index.html">主页</a></li>
                        <li id="bk"><a href="#">博客</a></li>
                        <li id="gl"><a href="#">管理</a></li>
                        <li id="pl"><a href="#">评论</a></li>
                        <li id="ds"><a href="/dashang.html">打赏</a></li>
                        <li id="wdl" style="display: none;"><a href="/login.jsp">登录/注册</a></li>
                        <li id="dl" ><a  data-toggle="modal" data-target="#register" href=""><img id="tx2" src="/userimage/${user.userimage}" style="border-radius: 50%; width: 40px; height: 40px; margin-top: -10px;"/><span style="margin-left:8px; margin-top:-20px;line-height:15px; font-size: 15px;color:#CCCCCC;">${user.uname}</span></a>

                        </li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>
</header>
<div class="copyrights">Collect from <a href="#" >Website Template</a></div>

<!--------------Content--------------->
<section id="content">
    <div class="wrap-content zerogrid">
        <div class="row block">

            <div id="main-content" class="col-2-3">

                <div class="wrap-col">

                    <article >
                    </article>
                    <article>
                        <div class="heading">
                            <h2><a href="#">today is a good day</a></h2>

                        </div>
                        <div class="content">
                            <img src="/img/python.jpg" width="150px" height="150px"/>
                            <div class="div2">

                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec dictum. Proin non enim odio. Proin vitae turpis libero, eget feugiat enim. Sed fringilla facilisis convallis.-->
                                    React.js
                                </p>
                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;name &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-10-14</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 216</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> 4</a>
                            </p>
                            <p class="more"><a class="button" href="#">Read more</a></p>
                        </div>
                    </article>
                    <article>
                        <div class="heading">
                            <h2><a href="#">Sed accumsan libero quis mi commodo et suscipit</a></h2>

                        </div>
                        <div class="content">
                            <img src="/img/js.jpg" width="150px" height="150px"/>
                            <div class="div2">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec dictum. Proin non enim odio. Proin vitae turpis libero, eget feugiat enim. Sed fringilla facilisis convallis.

                                    Aliquam viverra convallis auctor. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec dictum. Proin non enim odio. </p>
                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;name &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-10-14</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 216</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> 4</a>
                            </p>
                            <p class="more"><a class="button" href="#">Read more</a></p>
                        </div>
                    </article>
                    <article>
                        <div class="heading">
                            <h2><a href="#">Sed accumsan libero quis mi commodo et suscipit</a></h2>
                        </div>
                        <div class="content">
                            <img src="/img/python.jpg" width="150px" height="150px"/>
                            <div class="div2">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et suscipit enim lacinia.
                                    Aliquam viverra convallis auctor. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec dictum. Proin non enim odio.</p>
                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;name &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-10-14</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 216</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> 4</a>
                            </p>
                            <p class="more"><a class="button" href="#">Read more</a></p>
                        </div>
                    </article>
                    <article>
                        <div class="heading">
                            <h2><a href="#">Sed accumsan libero quis mi commodo et suscipit</a></h2>

                        </div>
                        <div class="content">
                            <img src="/img/php.jpg" width="150px" height="150px"/>
                            <div class="div2">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et suscipit enim lacinia.
                                    Aliquam viverra convallis auctor. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec dictum. Proin non enim odio.</p>
                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;name &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-10-14</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 216</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> 4</a>
                            </p>
                            <p class="more"><a class="button" href="#">Read more</a></p>
                        </div>
                    </article>
                    <article>
                        <ul id="pagi">
                            <li><a class="current" href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">next</a></li>
                        </ul>
                    </article>
                </div>
            </div>

            <div id="sidebar" class="col-1-3">
                <div class="wrap-col">
                    <div class="box">

                        <div class="heading"><h2>博客专家</h2></div>
                        <div class="content">
                            <div class="post">
                                <a href="#"><img src="/img/1_liumiaocn.jpg" width="50px" height="50px"/></a>
                                <h4><a href="#">liumiaocn</a></h4>
                                <p>中年汉子一枚，精通JAVA,C,已秃顶</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <a href="#"><img src="/img/t3.jpg" width="50px" height="50px"/></a>
                                <h4><a href="#">嘟嘟</a></h4>
                                <p>软妹子一枚，精通卖萌，嘤嘤嘤</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <a href="#"><img src="/img/pic2.jpeg" width="50px" height="50px"/></a>
                                <h4><a href="#">丢丢</a></h4>
                                <p>从事编程12年，各种精通</p>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="heading"><h2>分类</h2></div>
                        <div class="content">
                            <ul>
                                <li><a href="#">JAVA</a></li>
                                <li><a href="#">C++</a></li>
                                <li><a href="#">Javascript</a></li>
                                <li><a href="#">PHP</a></li>
                                <li><a href="#">算法</a></li>
                                <li><a href="#">数据结构</a></li>
                                <li><a href="#">操作系统</a></li>
                                <li><a href="#">计算机网络</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="box">
                        <div class="heading"><h2>推荐</h2></div>
                        <div class="content">
                            <div class="post">
                                <img src="/img/t3.jpg"width="50px" height="50px"/>
                                <h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
                                <p>November 11 ,2012</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <img src="/img/t4.jpg"width="50px" height="50px"/>
                                <h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
                                <p>November 11 ,2012</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <img src="/img/g6.jpg"width="50px" height="50px"/>
                                <h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
                                <p>November 11 ,2012</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--------------Footer--------------->
<footer>
    <div class="wrap-footer zerogrid">
        <div class="row">
            <div class="col-1-6">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>Page</h2></div>
                        <div class="content">
                            <p><ul>
                            <a href="index.html">主页</a>
                            <a href="#">博客</a>
                            <a href="#">管理</a>
                            <a href="#">评论</a>
                            <a href="dashang.html">打赏</a>

                        </ul></p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2-6">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>最新博客</h2></div>
                        <div class="content">
                            <div class="div3">
                                <a href="#"> 一个牛人给JAVA初学者的建议 </a>
                                <p><a href="#"> rutrum vulputate est sed faucibus. Nulla sed nisl mauris, id tristique tortor. </a></p>
                                <p><a href="#"> Sed iaculis dapibus urna nec dictum. Proin non enim odio.</a></p>
                                <p><a href="#"> Proin vitae turpis libero, eget feugiat enim.</a></p>
                                <p><a href="#"> Sed fringilla facilisis convallis.</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3-6">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>智能小图</h2></div>
                        <div class="content">
                            <div class="RightCont">
                                <!--<textarea id="dope" type="text" style="width: 99%;height: 75px; border: solid;outline: none;"></textarea>-->
                                <textarea id="dope" type="text" class="form-control"  rows="3"style="width: 99%;height: 75px; border: solid;outline: none;"></textarea>
                            </div>
                            <p>&nbsp;</p>
                            <input id="msg" type="text"  style="color: #000000;" />


                            <button type="button" class="btn btn-primary" onclick="aa()">发送</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="copyright">
        <p>Blog © 2019-  by fourterm</p>
    </div>
</footer>
<%--模态框--%>

<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">修改个人信息</h1>
            </div>
            <div class="modal-body">

                    <div class="form-group">
                        <label>用户名</label>
                        <input class="form-control" id="uname2"  readonly="true" type="text" placeholder="${user.uname}" value="${user.uname}">
                    </div>
                    <div class="form-group">
                        <label>新的密码</label>
                        <input class="form-control" id="newpassword" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>再次输入新的密码</label>
                        <input class="form-control" id="newpassword2" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                    <label>请输入个人简介</label>
                    <input class="form-control" id="userprofile2" type="text" placeholder="请输入个人简介" value="${user.userprofile}">
                    </div>
                   <%-- <label>请上传头像</label>
                    <input class="form-group">
                <form  id="jvForm" action="/user/updateuserinfo" method="post" enctype="multipart/form-data">
                        <input type="file" name="userimage2" id="file2"  >--%>
                <!-- 原生上传控件 -->
                <input type="file" name="" id="chooseImage" class="hidden" accept=".jpg,.jpeg,.png">
                <!-- 自定义上传按钮 -->
                <a  id="putImg" onclick="changeImg()" class="button button-3d button-action button-pill" ><i class="fa fa-telegram" aria-hidden="true"></i>&nbsp;上传头像</a>
                <a  onclick="deleteimg()" class="button button-3d button-action button-pill" ><i class="glyphicon glyphicon-trash" ></i></span>&nbsp;删除</a>
                <img id="showImg"  width="150" height="200">

                    <div class="text-right">
                        <button class="btn btn-primary" type="submit" onclick="updateuserinfo()" >提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var dataURL;
    //自定义上传按钮的点击事件
    function changeImg(){

        $('#chooseImage').trigger('click');//触发原生上传控件
    }

    $('#chooseImage').on('change',function(e){
        // 检查是否是图片
        var filePath = $(this).val(),
            fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();//获取文件后缀名
        //检查后缀名
        if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
            showError('文件格式必须为：png/jpg/jpeg');//showError是另外写的一个显示错误信息的function
            return;
        }

        //获取并记录图片的base64编码
        var reader = new FileReader();
        reader.readAsDataURL(e.target.files[0]); // 读出 base64
        reader.onloadend = function () {
            // 图片的 base64 格式, 可以直接当成 img 的 src 属性值
             dataURL = reader.result;//base64
            // 显示图片
            $('#showImg').attr('src',dataURL);
        };
    });
    function deleteimg(){
        dataURL=null;
        $('#showImg').attr('src',dataURL);
    }
    function updateuserinfo() {
        var uname=$("#uname2").val();
        var upassword=$("#newpassword2").val();
        var upassword2=$("#newpassword").val();
        var userprofile=$("#userprofile2").val();
        if (upassword!=upassword2){
            alert("俩次密码不一样请重新输入");
            return false;
        }
        if (dataURL==null){
            $.ajax({
                url:"/user/upload2",
                contentType:"application/json;charset=utf-8",
                data:{"touxiang":uname,"upassword":upassword2,"userprofile":userprofile},
                datatype:"json",
                type:"post",
                success:function (data) {
                    if (data.aa==1){
                        alert("上传成功");
                        $('#tx2').attr('src',dataURL);
                    }
                    if (data.aa==0){
                        alert("上传失败!");
                    }

                }

            })
        }
        else{

            $.ajax({
                url:"/user/upload",
                contentType:"application/json;charset=utf-8",
                data:{"uname":uname,"upassword":upassword2,"userprofile":userprofile,"touxiang":dataURL},
                datatype:"json",
                type:"post",
                success:function (data) {
                    if (data.aa==1){
                        alert("上传成功");
                        $('#tx2').attr('src',dataURL);
                    }
                    if (data.aa==0){
                        alert("上传失败!");
                    }

                }

            })
        }
    }

</script>
</body>
</html>

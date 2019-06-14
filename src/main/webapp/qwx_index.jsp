<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/10
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/qwxstyles.css" rel="stylesheet" type="text/css">
    <link href="/css/qwxstyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/zerogrid.css" type="text/css">
    <link rel="stylesheet" href="/css/index.style.css" type="text/css">
    <link rel="stylesheet" href="/css/responsive.css" type="text/css">
    <script src="/js/jquery-3.2.1.min.js"></script>

    <script type="text/javascript" src="/js/jquery1.min.js"></script>
    <script type="text/javascript">
        function jiazai() {
            if (${user.uname!=null}){
                $("#dl").css("display","block");
                $("#zy").css("display","block");

                $("#bk").css("display","block");
                $("#wdl").css("display","none");
                $("#zy2").css("display","none");
                $("#tc").css("display","block");
            }
            else {
                $("#wdl").css("display","block");
                $("#zy2").css("display","block");
                $("#bk").css("display","none");
                $("#dl").css("display","none");
                $("#zy").css("display","none");

                $("#tc").css("display","none");
            }
        }
        function exit() {

            $.ajax({
                type : "post",
                dataType : "json",
                url: "/user/tuichu",
                cache: false,
                data:{},
                success : function(result) {
                    alert("退出成功");
                    window.location.href="/user/nologin";
                }
            });
        }


    </script>
</head>
<body onload="jiazai()">
<header>
    <div class="wrap-header zerogrid">
        <div id="logo"><a href="#"><img src="/img/hlwbolgs3.png"/></a></div>
        <nav>
            <div class="wrap-nav">
                <div class="menu">
                    <ul>
                        <li id="zy"><a href="/user/login/${user.uname}">主页</a></li>
                        <li id="zy2"><a href="/user/nologin">主页</a> </li>
                        <li id="bk"><a href="/bkglindex/${user.uid}">博客管理</a></li>

                        <li id="ds"><a href="/dashang.html">打赏</a></li>
                        <li id="wdl" style="display: none;"><a href="/login.jsp">登录/注册</a></li>
                        <li id="dl" ><a  data-toggle="modal" data-target="#register" href=""><img id="tx2" src="/userimage/${user.userimage}" style="border-radius: 50%; width: 40px; height: 40px; margin-top: -10px;"/><span style="margin-left:8px; margin-top:-20px;line-height:15px; font-size: 15px;color:#CCCCCC;">${user.uname}</span></a>

                        </li>
                        <li id="tc"><a style="cursor:pointer;" onclick="exit()">退出</a> </li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>

</header>
<div class="mainContent">
    <aside>
        <div class="content">
            <p>
                <a href="/rhy_index?uid=${qwxuser.uid}&page=1&method=1&userid=${user.uid}" ><img src="/userimage/${qwxuser.userimage}" style="border-radius: 50%; width: 60px; height: 60px; margin: 30px;"/></a>
                <span style="line-height:100px; font-size: 25px; color: #000000;"><b>${qwxuser.uname}</b></span>
            </p>
            <ul>
                <li style="margin: 10px; color:#000000; padding-left: 33px;">文章总数：${articleTotal}</li>
                <li style="margin: 10px; color:#000000;padding-left: 33px;">浏览总量：${browseTotal}</li>
                <li style="margin: 10px; color:#000000;padding-left: 33px;">最近更新：${lastUpdateTime} </li>
            </ul>
        </div>


        <section class="taglist">
            <h2>个人简介</h2>
            <ul>
                <li><a href="/">${qwxuser.userprofile}</a></li>
            </ul>
        </section>
    </aside>
    <div class="blogitem">
        <article class="w-e-text">
            <h2 class="title"><a href="/">${article.artitle}</a></h2>
            <p style="text-align: right; margin-right: 20px;"><b>最新更新于：${lastUpdateTime}</b></p>
            <ul class="text">
                <p>
                    ${article.arcontent}
                </p>


            </ul>

        </article>

        <article id="article">
            <a name="miao"></a>
            <h2 class="title"><a href="/">评论区</a></h2>
            <ul class="text">
                <textarea style="width:650px;height:100px;border: solid 1px;" placeholder="请输入评论内容"></textarea>

                <p style="text-align: right;"><input type="button" onclick="commentSubmit()" value="发表"  style="width: 65px; height: 30px; " class="btn btn-primary-alt"></p>
            </ul>

            <c:forEach var="item" items="${userCommentList}">
                <ul class="text ul-text">
                    <span style="float: left;"><img src="/userimage/${item.user.userimage}"  style="border-radius: 50%; width: 60px; height: 60px; margin-right: 15px; "></span>
                    <p>
                        <span style="line-height:20px; font-size: 15px; color: #000000;"><b>${item.user.uname}</b></span>
                    </p>
                    <p>${item.comment.cocontent}</p>
                </ul>
                <p align="right" style="margin-right: 20px; margin-top: 10px; margin-bottom: 10px;"><a href="#miao" ><input data-uid="${item.user.uid}" type="button" value="回复" class="article-text btn btn-radius btn-success dropdown-toggle" style="width: 10%;"> </a></p>
            </c:forEach>


        </article>

        <article>
            <h2 class="title"><a href="/">推荐文章</a></h2>
            <c:forEach var="item" items="${articleList}">
                <ul class="text">

                    <a href="/qwx_index?arid=${item.arid}&userid=${user.uid}"><h2 style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${item.artitle}</h2></a>
                    <img src="/img/${item.caid}.jpg" style="height: 150px;width: 150px;" /><p style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${item.arcontent}</p>
                </ul>
                <hr>
            </c:forEach>
        </article>

    </div>
</div>
<footer>
    <div class="Copyright">
        <ul>
            <a href="/">联系我们</a><a href="/">我的博客</a><a href="/">客服电话</a><a href="/">邮箱地址</a>
        </ul>
        <p>Design by Ashiors</p>
    </div>
</footer>

<script type="text/javascript">
    function GetQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    var index = -1;
    function commentSubmit() {
        var arid=GetQueryString("arid");
        var uid = 0;
        if(index != -1){
            var uid = $(".article-text").eq(index).data("uid");
        }
        $.ajax({
            type:"POST",
            url:"/insertcomment",
            data:{content:$("textarea").val(), arid:arid, uid: uid},
            success:function (data) {
                if(data.code == 200){
                    alert("请先登录");

                    return;
                }
                if(index == -1){
                    var html = "<ul class=\"text ul-text\">"+
                        " <span style=\"float: left;\"><img src='"+"/userimage/"+data.user.userimage+"'  style=\"border-radius: 50%; width: 60px; height: 60px; margin-right: 15px; \"></span>"+
                        "<p>"+
                        "<span style=\"line-height:20px; font-size: 15px; color: #000000;\"><b>"+data.user.uname+"</b></span>"+
                        "</p><p>"+
                        data.content+
                        "</p></ul>"+
                        "<p align=\"right\" style=\"margin-right: 20px; margin-top: 10px; margin-bottom: 10px;\"><a href=\"#miao\" ><input data-uid=\"${item.user.uid}\" type=\"button\" value=\"回复\" class=\"article-text btn btn-radius btn-success dropdown-toggle\" style=\"width: 10%;\"> </a></p>"
                    $("#article").append(html);
                }else{
                    var html = "<p>"+data.content+"</p>";
                    $(".ul-text").eq(index).append(html);
                }
                index = -1;
                $("textarea").val("");
            }
        })
    }

    $(document).on("click",".article-text",function(){
        index = $(".article-text").index(this);
        console.log(index+"----");
    })
</script>
</body>
</html>

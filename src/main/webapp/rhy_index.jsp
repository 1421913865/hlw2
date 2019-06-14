<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>HLWBlogs</title>
	<meta name="description" content="Free Html5 Templates and Free Responsive Themes Designed by Kimmy | zerotheme.com">
	<meta name="author" content="www.zerotheme.com">


	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="css/rhy_zerogrid.css">
	<link rel="stylesheet" href="css/rhy_style.css">
	<link rel="stylesheet" href="css/rhy_responsive.css">

	<!--[if lt IE 8]>
	<div style=' clear: both; text-align:center; position: relative;'>
		<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
			<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
		</a>
	</div>
	<![endif]-->
	<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->

	<link href='./images/favicon.ico' rel='icon' type='image/x-icon'/>
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
<!--------------Header--------------->
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
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >Website Template</a></div>

<!--------------Content--------------->
<section id="content">
	<div class="wrap-content zerogrid">
		<div class="row block">
			<div id="sidebar" class="col-1-3">
				<div class="wrap-col">
					<div class="box">
						<div class="content">
							<p>
								<a href="#" ><img src="/userimage/${otheruser.userimage}" style="border-radius: 50%; width: 50px; height: 50px; margin: 10px;"/></a>
								<span style="line-height:68px; font-size: 25px;">${otheruser.uname}</span>
							</p>
							<ul>
								<li>文章总数：${articleTotal}</li>
								<li>浏览总量：${browseTotal}</li>
								<li>最近更新：${lastUpdateTime} </li>
							</ul>
						</div>
					</div>
					<div class="box">
						<div class="heading"><h2>分类</h2></div>
						<div class="content">
							<ul>
								<c:forEach var="item" items="${categoryList}">
									<li><a href="/rhy_index?uid=${uid}&page=1&method=1&caid=${item.caid}">${item.caname}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="box">
						<div class="heading"><h2>推荐</h2></div>
						<div class="content">
							<div class="post">
								<img src="/img/${RecommendImg1}" style="width: 50px; height: 50px;"/>
								<h4><a href="/qwx_index?arid=${RecommendArticle1.arid}&userid=${user.uid}">${RecommendArticle1.artitle}</a></h4>
								<p>${RecommendDate1}</p>
							</div>
							<!--<p>&nbsp;</p>-->
							<div class="post">
								<img src="/img/${RecommendImg2}" style="width: 50px; height: 50px;"/>
								<h4><a href="/qwx_index?arid=${RecommendArticle2.arid}&userid=${user.uid}">${RecommendArticle2.artitle}</a></h4>
								<p>${RecommendDate2}</p>
							</div>
							<!--<p>&nbsp;</p>-->
							<div class="post">
								<img src="/img/${RecommendImg3}" style="width: 50px; height: 50px;"/>
								<h4><a href="/qwx_index?arid=${RecommendArticle3.arid}&userid=${user.uid}">${RecommendArticle3.artitle}</a></h4>
								<p>${RecommendDate3}</p>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div id="main-content" class="col-2-3">
				<div class="search_by">
					<ul class="list">
						<li><a class="y_select" href="/rhy_index?uid=${uid}&page=1&method=3">按更新时间</a></li>
						<li><a class="y_select" href="/rhy_index?uid=${uid}&page=1&method=2">按访客量</a></li>
						<li><a class="y_select" href="/rhy_index?uid=${uid}&page=1&method=1">默认</a> </li>
					</ul>
				</div>
				<div class="wrap-col">
					<c:forEach var="item" items="${articleDateList}">
						<article>
							<div class="heading">
								<h2><a href="/qwx_index?arid=${item.article.arid}&userid=${user.uid}">${item.article.artitle}</a></h2>
							</div>
							<div class="content">
								<a href="/qwx_index?arid=${item.article.arid}&userid=${user.uid}">${item.article.arcontent}</a>
							</div>
							<div class="crt">
								<ul>
									<li>评论数：${item.article.arcommentnum}</li>
									<li>阅读量：${item.article.arbrowsenum}</li>
									<li>时间：${item.updatetime}</li>
								</ul>
							</div>
						</article>
						<br />
						<hr />
					</c:forEach>
					<ul id="pagi">
						<%--<li><a class="current" href="#">1</a></li>--%>
						<%--<li><a href="#">2</a></li>--%>
						<%--<li><a href="#">3</a></li>--%>
						<%--<li><a href="#">4</a></li>--%>
						<c:forEach var="item" items="${pageList}">
							<li><a class="page" href="/rhy_index?uid=${item.uid}&page=${item.num}&method=${item.method}" >${item.num}</a></li>
						</c:forEach>
					</ul>

				</div>
			</div>

		</div>
	</div>
</section>


<script type="text/javascript">
	$(function () {
	    $(".page").removeClass("current");
        function GetQueryString(name){
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
        }
        var page=GetQueryString("page");
        $(".page").eq(page-1).addClass("current");

        var method = GetQueryString("method");
        if(method == 1){
            $(".y_select").eq(2).css("color", "red");
		}else if(method == 2){
            $(".y_select").eq(1).css("color", "red");
		}else{
            $(".y_select").eq(0).css("color", "red");
		}


    })


</script>
</body></html>
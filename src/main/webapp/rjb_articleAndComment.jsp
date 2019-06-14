<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
	<head>

		<!-- Basic Page Needs
  ================================================== -->
		<meta charset="utf-8">
		<title>HLWLOGS</title>
		<meta name="description" content="Free Html5 Templates and Free Responsive Themes Designed by Kimmy | zerotheme.com">
		<meta name="author" content="www.zerotheme.com">

		<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/toastr.css" />
		<script src="../js/jquery.min.js" type="text/javascript"></script>
		<script src="../js/bootstrap.min.js" type="text/javascript"></script>
		<script src="../js/toastr.min.js"></script>
		<!-- Mobile Specific Metas
  ================================================== -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

		<!-- CSS
  ================================================== -->
		<link rel="stylesheet" href="../css/zerogrid.css">
		<link rel="stylesheet" href="../css/style3.css">
		<link rel="stylesheet" href="../css/rjb_style.css">
		<link rel="stylesheet" href="../css/responsive.css">
		<link rel="stylesheet" href="../css/rjb_comment.css">

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

		<link href='../images/favicon.ico' rel='icon' type='image/x-icon' />
		<script>
            function jiazai() {
                if (${user.uname!=null}){
                    $("#dl").css("display","block");
                    $("#zy").css("display","block");
                    $("#pl").css("display","block");
                    $("#bk").css("display","block");
                    $("#tc").css("display","block");
                }
                else {

                    $("#bk").css("display","none");
                    $("#dl").css("display","none");
                    $("#zy").css("display","none");
                    $("#pl").css("display","none");
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

	<body>
		<!--------------Header--------------->
		<header>
			<div class="wrap-header zerogrid">
				<div id="logo">
					<a href="#"><img src="../img/hlwbolgs3.png" /></a>
				</div>
				<nav>
					<div class="wrap-nav">
						<div class="menu">
							<ul>
								<li id="zy"><a href="/user/login/${user.uname}">主页</a></li>
								<li id="bk"><a href="/bkglindex/${user.uid}">博客管理</a></li>
								<li id="ds"><a href="/dashang.html">打赏</a></li>

								<li id="dl" ><a  data-toggle="modal" data-target="#register" href=""><img id="tx2" src="/userimage/${user.userimage}" style="border-radius: 50%; width: 40px; height: 40px; margin-top: -10px;"/><span style="margin-left:8px; margin-top:-20px;line-height:15px; font-size: 15px;color:#CCCCCC;">${user.uname}</span></a>

								</li>
								<li id="tc"><a style="cursor:pointer;" onclick="exit()">退出</a> </li>
							</ul>
						</div>

						<div class="minimenu">
							<div>MENU</div>
							<select onChange="location=this.value">
								<option></option>
								<option value="index.html">主页</option>
								<option value="#">博客</option>
								<option value="#">展示</option>
								<option value="#">关于</option>
								<option value="#">联系方式</option>
							</select>

						</div>

					</div>
				</nav>
			</div>
		</header>
		<div class="copyrights">Collect from
			<a href="http://www.cssmoban.com/">Website Template</a>
		</div>

		<!--------------Content--------------->

		<section id="content">
			<div class="wrap-content zerogrid">
				<div class="row block">
					<div id="sidebar" class="col-1-3">
						<div class="wrap-col">

							<div class="box">
								<div class="heading">
									<h2>您的博客管理中心</h2></div>
								<div class="content">
									<a href="" target="_blank"><img src="../userimage/${user.userimage}" style="height:200px;width:200px;border:none;" /></a>
									<!--<p>乱七八糟的东西
										<a href="" target="_blank" style="color: #DA251D;">莫名其妙的链接</a>
										乱七八糟的话</p>-->
								</div>
							</div>

							<div class="box">
								<div class="heading">
									<h2>内容</h2></div>
								<div class="content">
									<ul class="nav nav-pills nav-stacked">
										<li class="nav-item active">
											<a href="#artice" data-toggle="tab">文章管理</a>
										</li>
										<li class="nav-item">
											<a href="#commit" data-toggle="tab" id="commentManage">评论管理</a>
										</li>
										<%--<li class="nav-item">
											<a href="#column" data-toggle="tab">个人专栏</a>
										</li>
										<li class="nav-item">
											<a href="#otherSetting" data-toggle="tab">其他</a>
										</li>--%>
									</ul>
								</div>
							</div>
							<div class="box">
								<div class="heading">
									<h2>推荐</h2></div>
								<div class="content">
									<div class="post">
										<img src="../img/java.jpg" style="width:50px;height: 50px"/>
										<h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
										<p>November 11 ,2012</p>
									</div>
									<div class="post">
										<img src="../img/php.jpg" style="width:50px;height: 50px" />
										<h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
										<p>November 11 ,2012</p>
									</div>
									<div class="post">
										<img src="../img/czxt.jpg" style="width:50px;height: 50px"/>
										<h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
										<p>November 11 ,2012</p>
									</div>
							
								</div>
							</div>
						</div>
					</div>

					<div id="main-content" class="col-2-3">

						<div class="wrap-col">
							<!-- Nav tabs -->
							<div class="tab-content">
								<!--文章管理详情页按钮与内容-->
								<div id="artice" class="tab-pane   fade in active ">
									<!--按钮-->
									<ul class="nav nav-tabs">
										<li class="nav-item active">
											<a href="#all" id="showAll" data-toggle="tab">全部</a>
										</li>
										<li class="nav-item">
											<a href="#public"  id="showPublic" data-toggle="tab">公开</a>
										</li>
										<li class="nav-item">
											<a href="#private"id="showPrivate" data-toggle="tab">私密</a>
										</li>
										<li class="nav-item">
											<a href="#draft" id="showDraft" data-toggle="tab">草稿</a>
										</li>
										<a href="javascript:;" id="writeBlogs">
											<button id="btn-writeBlogs" class="btn btn-default">写博客</button>
										</a>
									</ul>
									<!--内容-->
									<div class="tab-content py-3">
										<!--all显示全部文章,-->
										<div id="all" class="tab-pane fade in active">

										</div>
										<div id="public" class="tab-pane  fade">
											
										</div>
										<div id="private" class="tab-pane  fade">
											
										</div>
										<div id="draft" class="tab-pane  fade">
											
										</div>

									</div>
								</div>
								<!--文章管理详情页按钮与内容---end-->
								<!--评论管理详情页按钮与内容---start-->
								<div id="commit" class="tab-pane  fade ">
									<!--按钮-->
									<ul class="nav nav-tabs">
										<li class="nav-item active">
											<a href="#commentForMe" id="showCommentForMe" data-toggle="tab">我的文章评论</a>
										</li>
										<li class="nav-item">
											<a href="#myComment" id="showMyComment" data-toggle="tab">我发表的评论</a>
										</li>
									</ul>
									<!--内容-->
									<div class="tab-content py-3">
										<div id="commentForMe" class="tab-pane  fade active">
											<!--评论列表---start-->
											<ul class="comment-list ">

											</ul>

											<!--评论列表---end-->
										</div>

										<div id="myComment" class="tab-pane  fade">
											<ul class="comment-list ">

											</ul>
										</div>
									</div>
								</div>

								<!--个人专栏详情页按钮与内容-->
								<div id="column" class="tab-pane fade ">
									<!--其他管理详情页按钮与内容-->
								</div>
								<div id="otherSetting" class="tab-pane  fade ">

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
		<div class="confirm-box"  id="confirm" style="display: none;">
			<p class="confirm-title">一旦删除，不可恢复。确定要删除吗？</p>
			<div class="confirm-button-box">
				<div class="confirm-button false" id="quxiao">取消</div>
				<div class="confirm-button true" id="queding">确定</div>
			</div>
		</div>
		<div class="confirm-box"  id="confirm-public" style="display: none;">
			<p class="confirm-title">确认发表该博客吗?</p>
			<div class="confirm-button-box">
				<div class="confirm-button false" id="quxiao-public">取消</div>
				<div class="confirm-button true" id="queding-public">确定</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(document).ready(function() {
            $.ajax({
                url: "/showall",
                type: "GET",
                success: function (data) {
                    var articleDateList = data.articleDateList;
                    articleDateList.map(function (item, index) {
                        var $div = $("<div class=\"article-list-item\"> " +
                            "<div class=\"list-item-title\">" +
                            "<span class=\"article-list-item-tag\"> " + "原创" + "</span>" +
                            "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                            "</div>" +
                            "<div class=\"article-list-item-info\">" +
                            "<div class=\"item-info-left\">" +
                            "<span> " + "日期 " + item.updatetime + "</span>" +
                            "<span>" + "阅读数 " + item.article.arbrowsenum + "</span>" +
                            "<span>" + "评论数 " + item.article.arcommentnum + "</span> " +
                            "</div>" +
                            "<div class=\"item-info-oper\">" +
                            "<a href='/qwx_index?arid=" + item.article.arid + "'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                            "<a href=\"javascript:del("+item.article.arid+", 1);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                        $("#all").append($div);
                    })
                }
            });

        });

			//全部文章显示
			$("#showAll").click(function() {
				    $.ajax({
						url:"/showall",
						type:"GET",
						success:function (data) {
                            $("#all").empty();
							var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "原创" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> " + "日期 " + item.updatetime +"</span>" +
                                    "<span>" + "阅读数 " + item.article.arbrowsenum + "</span>" +
                                    "<span>" + "评论数 " + item.article.arcommentnum + "</span> " +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 1);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#all").append($div);
							})


                        }
					});

			})
			//显示公开文章
			$("#showPublic").click(function() {
                        $.ajax({
                            url:"/showpublic",
                            type:"GET",
                            success:function (data) {
                                $("#public").empty();
                                var articleDateList = data.articleDateList;
                                articleDateList.map(function (item, index) {
                                    var $div = $("<div class=\"article-list-item\"> " +
                                        "<div class=\"list-item-title\">" +
                                        "<span class=\"article-list-item-tag\"> " + "公开" + "</span>" +
                                        "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                        "</div>" +
                                        "<div class=\"article-list-item-info\">" +
                                        "<div class=\"item-info-left\">" +
                                        "<span> " + "日期 " + item.updatetime +"</span>" +
                                        "</div>" +
                                        "<div class=\"item-info-oper\">" +
                                        "<a  onclick=\"topArticle("+item.article.arid+")\"><span class=\" \">置顶<!--置顶--></span></a>" +
                                        "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                        "<a href=\"javascript:del("+item.article.arid+", 2);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                        "</div>" +
                                        "</div>" +
                                        "</div>");
                                    $("#public").append($div);
                                })


                            }
                        });
			})

			$("#showPrivate").click(function() {
                    $.ajax({
                        url:"/showprivate",
                        type:"GET",
                        success:function (data) {
                            $("#private").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> "+"私密"+ "</span>" +
                                    "<p class=\"article-list-item-txt\"> "+ item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> "+ "日期 " + item.updatetime + "</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href=\"javascript:setPublic("+item.article.arid+");\"><span class=\" \">设为公开<!--置顶--></span></a>" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 3);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#private").append($div);
                            })

                        }
                    });
			})

            /*显示草稿*/
            $("#showDraft").click(function() {
                	$.ajax({
                        url:"/showdraft",
                        type:"GET",
                        success:function (data) {
                            $("#draft").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "草稿" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> "+ "日期 " + item.updatetime + "</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href=\"javascript:void(0);\"><span class=\" \" onclick='public("+item.article.arid+")'>发布<!--发布--></span></a>" +
                                    "<a href=\"javascript:window.open('/rjb_indexx?arid="+ item.article.arid +"')\"><span class=\" \">编辑<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 4);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#draft").append($div);
						})
						}
            	})

		});

		/*
			+$("#all").html()
		*/
		function topArticle(arid) {
            $.ajax({
                type:"GET",
                url:"/top",
                data:{arid:arid},
                async:false,
                success:function (data) {
                }
            })
            $.ajax({
                url:"/showpublic",
                type:"GET",
                async:false,
                success:function (data) {
                    $("#public").empty();
                    var articleDateList = data.articleDateList;
                    articleDateList.map(function (item, index) {
                        var $div = $("<div class=\"article-list-item\"> " +
                            "<div class=\"list-item-title\">" +
                            "<span class=\"article-list-item-tag\"> " + "公开" + "</span>" +
                            "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                            "</div>" +
                            "<div class=\"article-list-item-info\">" +
                            "<div class=\"item-info-left\">" +
                            "<span> " + "日期 " + item.updatetime +"</span>" +
                            "</div>" +
                            "<div class=\"item-info-oper\">" +
                            "<a  onclick=\"topArticle("+item.article.arid+")\"><span class=\" \">置顶<!--置顶--></span></a>" +
                            "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                            "<a href=\"javascript:del("+item.article.arid+", 2);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                        $("#public").append($div);
                    })
                }
            });
        }
        function setPublic(arid){
            $.ajax({
                type:"GET",
                url:"/setpublic",
                data:{arid:arid},
                async:false,
                success:function (data) {
                }
            })
            $.ajax({
                url:"/showprivate",
                type:"GET",
                success:function (data) {
                    $("#private").empty();
                    var articleDateList = data.articleDateList;
                    articleDateList.map(function (item, index) {
                        var $div = $("<div class=\"article-list-item\"> " +
                            "<div class=\"list-item-title\">" +
                            "<span class=\"article-list-item-tag\"> "+"私密"+ "</span>" +
                            "<p class=\"article-list-item-txt\"> "+ item.article.artitle + "</p> " +
                            "</div>" +
                            "<div class=\"article-list-item-info\">" +
                            "<div class=\"item-info-left\">" +
                            "<span> "+ "日期 " + item.updatetime + "</span>" +
                            "</div>" +
                            "<div class=\"item-info-oper\">" +
                            "<a href=\"javascript:void(0);\"><span class=\" \">设为公开<!--置顶--></span></a>" +
                            "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                            "<a href=\"javascript:del("+item.article.arid+", 3);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                        $("#private").append($div);
                    })
                }
            });
        }

		$("#btn-writeBlogs").click(function () {
			window.open("/rjb_index");

        });
	</script>
	<script type="text/javascript">
        /*提示消失时间设置函数 */
        function clear_toastr(time) {
            setTimeout(
                function() {
                    console.log("----");
                    toastr.clear();
                    console.log("****");
                }, time);
        }

        toastr.options.positionClass ='toast-top-center';

        function public(arid) {
            $("#confirm-public").css("display", "block");
            $(document).on("click","#queding-public",function(){
                $.ajax({
                    url:"/public",
                    type:"GET",
                    async:false,
                    data:{arid:arid}
                })
                $.ajax({
                    url:"/showdraft",
                    type:"GET",
                    async:false,
                    success:function (data) {
                        $("#draft").empty();
                        var articleDateList = data.articleDateList;
                        articleDateList.map(function (item, index) {
                            var $div = $("<div class=\"article-list-item\"> " +
                                "<div class=\"list-item-title\">" +
                                "<span class=\"article-list-item-tag\"> " + "草稿" + "</span>" +
                                "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                "</div>" +
                                "<div class=\"article-list-item-info\">" +
                                "<div class=\"item-info-left\">" +
                                "<span> "+ "日期 " + item.updatetime + "</span>" +
                                "</div>" +
                                "<div class=\"item-info-oper\">" +
                                "<a href=\"javascript:void(0);\"><span class=\" \" onclick='public("+item.article.arid+")'>发布<!--发布--></span></a>" +
                                "<a href=\"/updatearticlepage?arid="+ item.article.arid +"\"><span class=\" \">编辑<!--链接到具体文章--></span></a>" +
                                "<a href=\"javascript:del("+item.article.arid+", 4);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                "</div>" +
                                "</div>" +
                                "</div>");
                            $("#draft").append($div);
                        })
                    }
                })
                $("#confirm-public").css("display", "none");
                toastr.success("发布成功");
                clear_toastr(1000);
            })
            $(document).on("click","#quxiao-public",function(){
                $("#confirm-public").css("display", "none");
            })
        }

        /*//1 全部  2 公开  3 私密  4 草稿
        function del(arid, id) {
            //var r=confirm("确认删除吗");
            $("#confirm").css("display", "block");
            $("#queding").unbind("click");
            $(document).on("click","#queding",function(){
                $.ajax({
                    type:"GET",
                    url: "/del",
                    data:{arid:arid},
                    async:false,
                    success:function (data) {
                    }
                })
                if(id == 1){
                    $.ajax({
                        url:"/showall",
                        type:"GET",
                        success:function (data) {
                            $("#all").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "原创" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> " + "日期 " + item.updatetime +"</span>" +
                                    "<span>" + "阅读数 " + item.article.arbrowsenum + "</span>" +
                                    "<span>" + "评论数 " + item.article.arcommentnum + "</span> " +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 1);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#all").append($div);
                            })
                        }
                    });
                }else if(id == 2){
                    $.ajax({
                        url:"/showpublic",
                        type:"GET",
                        success:function (data) {
                            $("#public").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "公开" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> " + "日期 " + item.updatetime +"</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a  onclick=\"topArticle("+item.article.arid+")\"><span class=\" \">置顶<!--置顶--></span></a>" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 2);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#public").append($div);
                            })


                        }
                    });
                }else if(id == 3){
                    $.ajax({
                        url:"/showprivate",
                        type:"GET",
                        success:function (data) {
                            $("#private").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> "+"私密"+ "</span>" +
                                    "<p class=\"article-list-item-txt\"> "+ item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> "+ "日期 " + item.updatetime + "</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href=\"javascript:setPublic("+item.article.arid+");\"><span class=\" \">设为公开<!--置顶--></span></a>" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 3);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#private").append($div);
                            })

                        }
                    });
                }else if(id == 4){
                    $.ajax({
                        url:"/showdraft",
                        type:"GET",
                        success:function (data) {
                            $("#draft").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "草稿" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> "+ "日期 " + item.updatetime + "</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href=\"javascript:void(0);\"><span class=\" \" onclick='public("+item.article.arid+")'>发布<!--发布--></span></a>" +
                                    "<a href=\"/updatearticlepage?arid="+ item.article.arid +"\"><span class=\" \">编辑<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 4);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#draft").append($div);
                            })
                        }
                    })
                }
                toastr.success("删除成功");
                clear_toastr(1000);
                $("#confirm").css("display", "none");
            })
            $(document).on("click","#quxiao",function() {
                $("#confirm").css("display", "none");
            })
        }*/
        //1 全部  2 公开  3 私密  4 草稿
        function del(arid, id) {
            //var r=confirm("确认删除吗");
            $("#confirm").css("display", "block");
            $("#queding").unbind("click");
            $("#queding").click(function (){
                $.ajax({
                    type:"GET",
                    url: "/del",
                    data:{arid:arid},
                    async:false,
                    success:function (data) {
                    }
                })
                if(id == 1){
                    $.ajax({
                        url:"/showall",
                        type:"GET",
                        async:false,
                        success:function (data) {
                            $("#all").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "原创" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> " + "日期 " + item.updatetime +"</span>" +
                                    "<span>" + "阅读数 " + item.article.arbrowsenum + "</span>" +
                                    "<span>" + "评论数 " + item.article.arcommentnum + "</span> " +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 1);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#all").append($div);
                            })
                        }
                    });
                }else if(id == 2){
                    $.ajax({
                        url:"/showpublic",
                        type:"GET",
                        success:function (data) {
                            $("#public").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "公开" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> " + "日期 " + item.updatetime +"</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a  onclick=\"topArticle("+item.article.arid+")\"><span class=\" \">置顶<!--置顶--></span></a>" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 2);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#public").append($div);
                            })


                        }
                    });
                }else if(id == 3){
                    $.ajax({
                        url:"/showprivate",
                        type:"GET",
                        success:function (data) {
                            $("#private").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> "+"私密"+ "</span>" +
                                    "<p class=\"article-list-item-txt\"> "+ item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> "+ "日期 " + item.updatetime + "</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href=\"javascript:setPublic("+item.article.arid+");\"><span class=\" \">设为公开<!--置顶--></span></a>" +
                                    "<a href='/qwx_index?arid="+item.article.arid+"'><span class=\" \">查看<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 3);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#private").append($div);
                            })

                        }
                    });
                }else if(id == 4){
                    $.ajax({
                        url:"/showdraft",
                        type:"GET",
                        success:function (data) {
                            $("#draft").empty();
                            var articleDateList = data.articleDateList;
                            articleDateList.map(function (item, index) {
                                var $div = $("<div class=\"article-list-item\"> " +
                                    "<div class=\"list-item-title\">" +
                                    "<span class=\"article-list-item-tag\"> " + "草稿" + "</span>" +
                                    "<p class=\"article-list-item-txt\"> " + item.article.artitle + "</p> " +
                                    "</div>" +
                                    "<div class=\"article-list-item-info\">" +
                                    "<div class=\"item-info-left\">" +
                                    "<span> "+ "日期 " + item.updatetime + "</span>" +
                                    "</div>" +
                                    "<div class=\"item-info-oper\">" +
                                    "<a href=\"javascript:void(0);\"><span class=\" \" onclick='public("+item.article.arid+")'>发布<!--发布--></span></a>" +
                                    "<a href=\"/updatearticlepage?arid="+ item.article.arid +"\"><span class=\" \">编辑<!--链接到具体文章--></span></a>" +
                                    "<a href=\"javascript:del("+item.article.arid+", 4);\"><span class=\"del\">删除<!--删除文章--></span></a>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>");
                                $("#draft").append($div);
                            })
                        }
                    })
                }
                toastr.success("删除成功");
                $("#confirm").css("display", "none");
                clear_toastr(1000);
            })
            $("#quxiao").click(function () {
                $("#confirm").css("display", "none");
            })
        }

        $("#showCommentForMe").click(function() {
           var cmt = $("#commentForMe").find(".comment-list");

			$.ajax({
				type:"POST",
				url:"/showcommentforme",
				success:function (data) {
                    $(cmt).empty();
					var showCommentForMeList = data.showCommentForMeList;
                    showCommentForMeList.map(function (item, index) {
                        var $div = $("<li class=\"clearfix\"><div class=\"content-box\"><div class=\"title\">" +
                            "<span class=\"user-name\">" + item.user.uname + "</span> 在你的文章 " +
                            "<a class=\"article-title c-blue\" target=\"_blank\" href=\"/qwx_index?arid="+item.article.arid+"\">" + item.article.artitle + "</a> 有回复" +
                            "<div class=\"opt-box clearfix\">" +
                            "<a class=\"btn-txt c-blue icon-split btn-triggle-reply\">快速回复</a>" +
                            "<a class=\"btn-txt c-red\" onclick=\"delComment("+item.comment.coid+",10)\">删除</a>" +
                            "</div></div>" +
                            "<div class=\"comment-box\">" +
                            item.comment.cocontent +
                            "</div>" +
                            "<div class=\"reply-box d-n\">" +
                            "<div class=\"ipt-box\">" +
                            "<input class=\"txt txt-block\" type=\"text\" id=\"me-"+item.user.uid+"\"  placeholder=\"发表你的评论\"></div>" +
                            "<div class=\"opt-box\">" +
                            "<button class=\"btn btn-reply\" onclick=\"reply("+item.user.uid+","+item.article.arid+")\" disabled=\"false \">回复评论</button></div></div></div>" +
                            "</li>");
                        $(cmt).append($div);
					})

                }
			})
        })

        $("#showMyComment").click(function() {
            var cmt = $("#myComment").find(".comment-list");
			$.ajax({
				type:"POST",
				url:"/showmycomment",
				success:function (data) {
                    $(cmt).empty();
					var showMyCommentList = data.showMyCommentList;
                    showMyCommentList.map(function (item, index) {
                        var $div = $("<li class=\"clearfix\"><div class=\"content-box\"><div class=\"title\">" +
                            "<span class=\"user-name\">" + "我" + "</span> "+
                            "在  "  +
                            "<a class=\"article-title c-blue\" target=\"_blank\" href=\"/qwx_index?arid="+item.article.arid+"\">" + item.article.artitle + "</a>博客中" +
                            "评论了 <span class=\"author-name\">" + item.uname + "</span>"+
                            "<div class=\"opt-box clearfix\">" +
                            "<a class=\"btn-txt c-red\" onclick=\"delComment("+item.comment.coid+",11)\">删除</a>" +
                            "</div></div>" +
                            "<div class=\"comment-box\">" +
                            item.comment.cocontent +
                            "</div>" +
                            "<div class=\"reply-box d-n\">" +
                            "<div class=\"ipt-box\">" +
                            "<input class=\"txt txt-block\" type=\"text\"   placeholder=\"发表你的评论\"></div>" +
                            "<div class=\"opt-box\">" +
                            "<button class=\"btn btn-reply\" disabled=\"false \">回复评论</button></div></div></div>" +
                            "</li>");
                        $(cmt).append($div);
					})
                }
			})

        })

		/*function delComment(coid,id){
            $("#confirm").css("display", "block");
            console.log("-----");
            $("#queding").unbind("click");
            $(document).on("click","#queding",function(){
                $.ajax({
                    type:"GET",
                    url: "/delcomment",
                    data:{coid:coid},
                    async:false,
                    success:function (data) {
                    }
                })
				if(id == 10){
                    var cmt = $("#commentForMe").find(".comment-list");
                    $.ajax({
                        type:"POST",
                        url:"/showcommentforme",
                        async:false,
                        success:function (data) {
                            $(cmt).empty();
                            var showCommentForMeList = data.showCommentForMeList;
                            showCommentForMeList.map(function (item, index) {
                                var $div = $("<li class=\"clearfix\"><div class=\"content-box\"><div class=\"title\">" +
                                    "<span class=\"user-name\">" + item.user.uname + "</span> 回复了你的文章" +
                                    "<a class=\"article-title c-blue\" target=\"_blank\" href=\"/qwx_index?arid="+item.article.arid+"\">" + item.article.artitle + "</a>" +
                                    "<div class=\"opt-box clearfix\">" +
                                    "<a class=\"btn-txt c-blue icon-split btn-triggle-reply\">快速回复</a>" +
                                    "<a class=\"btn-txt c-red\" onclick=\"delComment("+item.comment.coid+",10)\">删除</a>" +
                                    "</div></div>" +
                                    "<div class=\"comment-box\">" +
                                    item.comment.cocontent +
                                    "</div>" +
                                    "<div class=\"reply-box d-n\">" +
                                    "<div class=\"ipt-box\">" +
                                    "<input class=\"txt txt-block\" type=\"text\" name=\"\" id=\"\" placeholder=\"发表你的评论\"></div>" +
                                    "<div class=\"opt-box\">" +
                                    "<button class=\"btn btn-reply\" onclick=\"reply("+item.user.uid+","+item.article.arid+")\" disabled=\"false \">回复评论</button></div></div></div>" +
                                    "</li>");
                                $(cmt).append($div);
                            })
                        }
                    })
				}else if(id == 11){
                    var cmt = $("#myComment").find(".comment-list");
                    $.ajax({
                        type:"POST",
                        url:"/showmycomment",
                        async:false,
                        success:function (data) {
                            $(cmt).empty();
                            var showMyCommentList = data.showMyCommentList;
                            showMyCommentList.map(function (item, index) {
                                var $div = $("<li class=\"clearfix\"><div class=\"content-box\"><div class=\"title\">" +
                                    "<span class=\"user-name\">" + "我" + "</span> "+
                                    "在  "  +
                                    "<a class=\"article-title c-blue\" target=\"_blank\" href=\"/qwx_index?arid="+item.article.arid+"\">" + item.article.artitle + "</a>博客中" +
                                    "评论了 <span class=\"author-name\">" + item.uname + "</span>"+
                                    "<div class=\"opt-box clearfix\">" +
                                    "<a class=\"btn-txt c-red\" onclick=\"delComment("+item.comment.coid+",11)\">删除</a>" +
                                    "</div></div>" +
                                    "<div class=\"comment-box\">" +
                                    item.comment.cocontent +
                                    "</div>" +
                                    "<div class=\"reply-box d-n\">" +
                                    "<div class=\"ipt-box\">" +
                                    "<input class=\"txt txt-block\" type=\"text\" name=\"\" id=\"\" placeholder=\"发表你的评论\"></div>" +
                                    "<div class=\"opt-box\">" +
                                    "<button class=\"btn btn-reply\" disabled=\"false \">回复评论</button></div></div></div>" +
                                    "</li>");
                                $(cmt).append($div);
                            })
                        }
                    })
				}
                toastr.success("删除成功");
                clear_toastr(1000);
                $("#confirm").css("display", "none");
            })
            $(document).on("click","#quxiao",function() {
                $("#confirm").css("display", "none");
            })
		}
*/
        function delComment(coid,id){
            $("#confirm").css("display", "block");
            console.log("-----");
            $("#queding").unbind("click");
            $("#queding").click(function () {
                $.ajax({
                    type:"GET",
                    url: "/delcomment",
                    data:{coid:coid},
                    async:false,
                    success:function (data) {
                    }
                })
                if(id == 10){
                    var cmt = $("#commentForMe").find(".comment-list");
                    $.ajax({
                        type:"POST",
                        url:"/showcommentforme",
                        async:false,
                        success:function (data) {
                            $(cmt).empty();
                            var showCommentForMeList = data.showCommentForMeList;
                            showCommentForMeList.map(function (item, index) {
                                var $div = $("<li class=\"clearfix\"><div class=\"content-box\"><div class=\"title\">" +
                                    "<span class=\"user-name\">" + item.user.uname + "</span> 在你的文章 " +
                                    "<a class=\"article-title c-blue\" target=\"_blank\" href=\"/qwx_index?arid="+item.article.arid+"\">" + item.article.artitle + "</a> 有回复" +
                                    "<div class=\"opt-box clearfix\">" +
                                    "<a class=\"btn-txt c-blue icon-split btn-triggle-reply\">快速回复</a>" +
                                    "<a class=\"btn-txt c-red\" onclick=\"delComment("+item.comment.coid+",10)\">删除</a>" +
                                    "</div></div>" +
                                    "<div class=\"comment-box\">" +
                                    item.comment.cocontent +
                                    "</div>" +
                                    "<div class=\"reply-box d-n\">" +
                                    "<div class=\"ipt-box\">" +
                                    "<input class=\"txt txt-block\" type=\"text\"  id=\"me-"+item.user.uid+"\"  placeholder=\"发表你的评论\"></div>" +
                                    "<div class=\"opt-box\">" +
                                    "<button class=\"btn btn-reply\" onclick=\"reply("+item.user.uid+","+item.article.arid+")\" disabled=\"false \">回复评论</button></div></div></div>" +
                                    "</li>");
                                $(cmt).append($div);
                            })
                        }
                    })
                }else if(id == 11){
                    var cmt = $("#myComment").find(".comment-list");
                    $.ajax({
                        type:"POST",
                        url:"/showmycomment",
                        async:false,
                        success:function (data) {
                            $(cmt).empty();
                            var showMyCommentList = data.showMyCommentList;
                            showMyCommentList.map(function (item, index) {
                                var $div = $("<li class=\"clearfix\"><div class=\"content-box\"><div class=\"title\">" +
                                    "<span class=\"user-name\">" + "我" + "</span> "+
                                    "在  "  +
                                    "<a class=\"article-title c-blue\" target=\"_blank\" href=\"/qwx_index?arid="+item.article.arid+"\">" + item.article.artitle + "</a>博客中" +
                                    "评论了 <span class=\"author-name\">" + item.uname + "</span>"+
                                    "<div class=\"opt-box clearfix\">" +
                                    "<a class=\"btn-txt c-red\" onclick=\"delComment("+item.comment.coid+",11)\">删除</a>" +
                                    "</div></div>" +
                                    "<div class=\"comment-box\">" +
                                    item.comment.cocontent +
                                    "</div>" +
                                    "<div class=\"reply-box d-n\">" +
                                    "<div class=\"ipt-box\">" +
                                    "<input class=\"txt txt-block\" type=\"text\" name=\"\"  placeholder=\"发表你的评论\"></div>" +

                                    "<div class=\"opt-box\">" +
                                    "<button class=\"btn btn-reply\" disabled=\"false \">回复评论</button></div></div></div>" +
                                    "</li>");
                                $(cmt).append($div);
                            })
                        }
                    })
                }
                toastr.success("删除成功");
                $("#confirm").css("display", "none");
                clear_toastr(1000);
            })
            $("#quxiao").click(function () {
                $("#confirm").css("display", "none");
            })
        }
        $(document).ready(function() {
            /*评论快速显示---start*/
            $("body").on("click", ".btn-triggle-reply", function() {
                var reply_box = $(this).parents(".title").next().next().attr("class")
                console.log($(".btn-triggle-reply").parents(".title").next());
                if(reply_box == "reply-box d-n") {
                    $(this).parents(".title").next().next().attr("class", "reply-box")
                }
                if(reply_box == "reply-box") {
                    $(this).parents(".title").next().next().attr("class", "reply-box d-n")
                }
            })
            /*评论快速显示---end*/

            /*回复评论按钮可操作和不可操作---start*/
            $("body").on("keyup", ".txt-block", function() {
                var input_val = $(this).val();
                if(!input_val) {
                    $(this).parent().next().children().attr("disabled", true);
                } else {
                    $(this).parent().next().children().attr("disabled", false);
                }
            });
            /*回复评论按钮可操作和不可操作---end*/

            /*这里写删除提示框的文件*/
            $("body").on("click", ".c-red", function() {
                $(".confirm-box").attr("display","block");
            });
        });
        $("#commentManage").click(function() {
            $("#commentForMe").addClass("in");
            var cmt = $("#commentForMe").find(".comment-list");
            $.ajax({
                type:"POST",
                url:"/showcommentforme",
                success:function (data) {
                    $(cmt).empty();
                    var showCommentForMeList = data.showCommentForMeList;
                    showCommentForMeList.map(function (item, index) {
                        var $div = $("<ul class=\"comment-list \"><li class=\"clearfix\"><div class=\"content-box\"><div class=\"title\">" +
                            "<span class=\"user-name\">" + item.user.uname + "</span> 在你的文章 " +
                            "<a class=\"article-title c-blue\" target=\"_blank\" href=\"/qwx_index?arid="+item.article.arid+"\">" + item.article.artitle + "</a> 有回复" +
                            "<div class=\"opt-box clearfix\">" +
                            "<a class=\"btn-txt c-blue icon-split btn-triggle-reply\">快速回复</a>" +
                            "<a class=\"btn-txt c-red\" onclick=\"delComment("+item.comment.coid+",10)\">删除</a>" +
                            "</div></div>" +
                            "<div class=\"comment-box\">" +
                            item.comment.cocontent +
                            "</div>" +
                            "<div class=\"reply-box d-n\">" +
                            "<div class=\"ipt-box\">" +
                            "<input class=\"txt txt-block\" type=\"text\"  id=\"me-"+item.user.uid+"\"  placeholder=\"发表你的评论\"></div>" +
                            "<div class=\"opt-box\">" +
                            "<button class=\"btn btn-reply\" onclick=\"reply("+item.user.uid+","+item.article.arid+")\" disabled=\"false \">回复评论</button></div></div></div>" +
                            "</li></ul>");
                        $(cmt).append($div);
                    })

                }
            })
        })



		function reply(uid, arid){
            var me = "#me-"+uid;
            var content = $(me).val();
            $.ajax({
				url:"/reply",
				type:"POST",
				data:{uid:uid, arid:arid, content:content},
				success:function (data) {
                    toastr.success("回复成功");
                    clear_toastr(1000);
                }
			})
		}
	</script>

</html>
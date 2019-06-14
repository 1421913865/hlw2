<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>wangEditor demo</title>
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/rjb_style.css" />
		<link rel="stylesheet" type="text/css" href="../css/toastr.css" />
		<!--<link rel="stylesheet" type="text/css" href="../css/bootstrap-select.min.css" />-->
	
		<style type="text/css">
			.toolbar {
				border: 1px solid #ccc;
			}
			
			.text {
				border: 1px solid #ccc;
				height: 610px;
				overflow: auto;
			}
		</style>
	</head>

	<body>
		<!--<div id="editor">
<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
</div>-->

		
		<div class="col-md-12" style="background-color: #f3f3f3;">
			<div class="col-md-2"></div>

			<div class="col-md-8" style="background-color: white;padding:0px ;">
				<div class="layout__panel layout__panel--articletitle-bar " style="width: 100%; height: 56px; overflow: inherit;">
			<div class="article-bar flex flex--row">
				<div class="article-bar__input-box">
					<input maxlength="100" id="title" value="${article.artitle}" class="article-bar__title article-bar__title--input text-input article-bar__title--focus">
				</div>
				<div class="article-bar__user-box flex flex--row">
					<button id="btn1" type="button" class="btn btn-publish">保存草稿</button>
					<div class="user-box">
						<div class="btn-userinfo">
							<div class="avatar-box">

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div id="div1" class="toolbar"></div>
				<div id="div2" class="text ">
					${article.arcontent}
				</div>
			</div>

			<div class="col-md-2"></div>

		</div>
	</body>
	<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
	<script type="text/javascript" src="../js/wangEditor.min.js"></script>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script src="../js/toastr.min.js"></script>
	<script type="text/javascript">
		var E = window.wangEditor
		var editor = new E('#div1', '#div2')
		// 或者 var editor = new E( document.getElementById('editor') )
		editor.customConfig.uploadImgShowBase64 = true // 使用 base64 保存图片
		editor.create()
	</script>
	<script type="text/javascript">
        /*提示消失时间设置函数 */
        function clear_toastr(time) {
            setTimeout(
                function() {
                    toastr.clear();
                }, time);
        }

        toastr.options.positionClass ='toast-top-center';

        function GetQueryString(name){
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
        }
        document.getElementById('btn1').addEventListener('click', function () {
            var arid = GetQueryString("arid");
            var html = editor.txt.html();
            $.ajax({
				type:"POST",
				url:"/updatearticle",
				data:{arid:arid,html: html},
				success:function (data) {
                    toastr.success("保存成功");
                    clear_toastr(1000);
                }
			})
        }, false)

	</script>
</html>
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
					<input maxlength="100" id="title" placeholder="输入文章标题" class="article-bar__title article-bar__title--input text-input article-bar__title--focus">
				</div>
				<div class="article-bar__user-box flex flex--row">
					<button id="btn1" type="button" class="btn btn-publish" data-toggle="modal" data-target="#myModal">发布文章</button>
					<div class="user-box">
						<div class="btn-userinfo">
							<div class="avatar-box">

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="switch-box ">
					<div class="form-inline">
						<input type="radio" id="isPublic" name="ispublic" value="1" checked>
							<label for="isPublic" class="lab-switch">公开</label>
						<input type="radio" id="isPrivate" name="ispublic" value="0">
							<label for="isPrivate" class="lab-switch">私密</label>

						<select class="form-control " id="categorySelect">
							<c:forEach var="item" items="${categoryList}">
								<option value="${item.caid}">${item.caname}</option>
							</c:forEach>
						</select>				
  						<input type="checkbox" id="isdraft" name="isdraft"  value="0">
  							<label for="isdraft"  class="checkbox-lab-switch"> 设为草稿</label>

					</div>
				</div>

				<div id="div1" class="toolbar"></div>
				<div id="div2" class="text ">
				</div>
			</div>

			<div class="col-md-2"></div>

		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">提醒</h4>
					</div>
					<div class="modal-body">
						您确定要发布文章吗？
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
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

        $(document).ready(function() {
            /*模态框弹出---start*/
            // 通过该方法来为每次弹出的模态框设置最新的zIndex值，从而使最新的modal显示在最前面
            $(document).on('show.bs.modal', '.modal', function(event) {
                var zIndex = 10001 + (10 * $('.modal:visible').length);
                $(this).css('z-index', zIndex);
                // setTimeout(function() {
                //     $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
                // }, 0);
            });
            /*模态框弹出---end*/
            /*发布跳转的jquery---start*/
            $(".modal-footer .btn-primary").click(function() {
                var html = editor.txt.html();
                console.log(html);
                $.ajax({
                    type: "POST",
                    url: "/insertarticle",
                    data: {
                        title: $("#title").val(),
                        html: html,
                        ispublic: $("input:radio[name='ispublic']:checked").val(),
                        isdraft: $("input:checkbox[name='isdraft']:checked").val(),
                        caid: $("#categorySelect option:selected").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        if(data.code == 200){
                            toastr.success("发布成功");
                            clear_toastr(1000);
                        }
                    }
                })

                //这里输入跳转的地址
            })
            $(".modal-footer .btn-default").click(function() {
                toastr.warning("取消发布");
                clear_toastr(1000);
                //这里什么都不干
            })

        });

	</script>
</html>
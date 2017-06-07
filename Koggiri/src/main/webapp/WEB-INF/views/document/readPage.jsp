<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<head>

<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css">
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css">


<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
</head>



<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}

.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}

.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>

<div class='popup back' style="display: none;"></div>
<div id="popup_front" class='popup front' style="display: none;">
	<img id="popup_img">
</div>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">문서게시판</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='f_id' value="${doc_BoardVO.f_id}">
					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> <input type="text"
							name='f_title' class="form-control"
							value="${doc_BoardVO.f_title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">내용</label>

						<div class="form-control"
							style="width: auto; height: 400; overflow-y: auto;"
							readonly="readonly">${doc_BoardVO.f_content}</div>


					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작성자</label> <input type="text"
							name="f_emp_id" class="form-control"
							value="${doc_BoardVO.f_emp_id}" readonly="readonly">
					</div>


					<ul class="mailbox-attachments clearfix uploadedList"></ul>

				</div>
				<!-- /.box-body -->

				<div class="box-footer">
		 			<c:if test="${doc_BoardVO.f_emp_id == mem_id or mem_id=='master'}">
							<button type="submit" class="btn btn-warning">수정하기</button>
							<button type="submit" class="btn btn-danger">삭제하기</button>
						
					</c:if>
					<button type="submit" class="btn btn-primary">목록</button>
				</div>

			</div>
			<!-- /.box -->

		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>


<!-- <script>
	var result = '${failMsg}';

	if (result == 'fail') {
		alert("다른 작성자의 글이므로 수정 및 삭제가 불가능합니다.");
		location.replace(self.location);
	}
</script> -->

<script>
	$(document).ready(
			function() {

				var formObj = $("form[role='form']");

				console.log(formObj);

				$(".btn-warning").on("click", function() {
					formObj.attr("action", "/document/modifyPage");
					formObj.attr("method", "get");
					formObj.submit();
				});

				$(".btn-danger").on("click", function() {
					formObj.attr("action", "/document/removePage");
					formObj.submit();
				});

				$(".btn-primary").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/document/list");
					formObj.submit();
				});

				var f_id = $
				{
					doc_BoardVO.f_id
				}
				;
				var template = Handlebars.compile($("#templateAttach").html());

				$.getJSON("/document/getAttach/" + f_id, function(list) {
					$(list).each(function() {

						var fileInfo = getFileInfo(this);

						var html = template(fileInfo);

						$(".uploadedList").append(html);

					});
				});

				$("#removeBtn").on("click", function() {

					var arr = [];
					$(".uploadedList li").each(function(index) {
						arr.push($(this).attr("data-src"));
					});

					if (arr.length > 0) {
						$.post("/deleteAllFiles", {
							files : arr
						}, function() {

						});
					}

					formObj.attr("action", "/document/removePage");
					formObj.submit();
				});

				$(".uploadedList").on("click", ".mailbox-attachment-info a",
						function(event) {

							var fileLink = $(this).attr("href");

							if (checkImageType(fileLink)) {

								event.preventDefault();//기본이벤트 해제.

								var imgTag = $("#popup_img"); // 현재 클릭한 이미지의 경로를 id속성값이 popup_img인 요소에 추가.
								imgTag.attr("src", fileLink);

								console.log(imgTag.attr("src"));

								$(".popup").show('slow'); // 추가된 뒤 화면에 보이도록 jQuery의 show호출.
								imgTag.addClass("show"); // 필요한 CSS추가.	
							}
						});

				$("#popup_img").on("click", function() {

					$(".popup").hide('slow'); //화면에 원본 이미지가 보여진 후 다시 한 번 클릭하면 이미지가 사라지는 효과

				});
			});
</script>













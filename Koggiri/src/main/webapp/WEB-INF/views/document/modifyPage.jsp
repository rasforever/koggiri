<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/plugins/ckeditor/ckeditor.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>

<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="#">전자 문서</a>  &gt;  <strong>문서함</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu02"><span>전자문서</span></strong>
      <ul>
                <li class="menu01">
                    <a href="#">업무보고</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/chart/listAll">전자결재</a>
                    <ul>
                      <li class="sub01 "><a href="#">보낸결재</a></li>
                      <li class="sub02 "><a href="#">받은결재</a></li>
                      <li class="sub03 "><a href="#">결제입력</a></li>
                    </ul>
                </li>
                 <li class="menu03 ">
                    <a href="/chart/listAll">문서함</a>
  					<ul></ul>
                </li>
           </ul>
   </div>
</div>

<div id="sub_content" align="center">
<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">글 수정</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group" align="left" style="font-size: 14px">
							<label for="exampleInputEmail1">글번호</label><br><br>
							<input type="text"
								name='f_id' class="form-control" value="${doc_BoardVO.f_id}"
								readonly="readonly">
						</div>

						<div class="form-group" align="left" style="font-size: 14px">
							<label for="exampleInputEmail1">제목</label><br><br> 
							<input type="text"
								name='f_title' class="form-control"
								value="${doc_BoardVO.f_title}">
						</div>
						<div class="form-group" align="left" style="font-size: 14px">
							<label for="exampleInputPassword1">내용</label><br><br>
							<textarea class="form-control" name="f_content" rows="3">${doc_BoardVO.f_content}</textarea>
							<script type="text/javascript">
								CKEDITOR
										.replace(
												'f_content',
												{
													'filebrowserUploadUrl' : '/ckeditor/upload.jsp?'
															+ 'realUrl=http://www.localhost.com/서버업로드될디렉토리명'
															+ '&realDir=서버업로드될디렉토리명'
												});
							</script>
						</div>
						<div class="form-group" align="left" style="font-size: 14px">
							<label for="exampleInputEmail1">작성자</label><br><br>
							<input type="text"
								name="f_emp_id" class="form-control"
								value="${doc_BoardVO.f_emp_nm}" readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">파일첨부하기</label><br><br>
							<div class="fileDrop"></div>
						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<div>
							<hr>
						</div>

						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>

						<button type="submit" class="btn btn-primary">수정하기</button>
						<button type="submit" class="btn btn-warning">취소</button>

					</div>
				</form>

				<script type="text/javascript" src="/resources/js/upload.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

				<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>

				<script>
					$(document)
							.ready(
									function() {

										var formObj = $("form[role='form']");

										formObj
												.submit(function(event) {
													event.preventDefault();

													var that = $(this);

													var str = "";
													$(".uploadedList .delbtn")
															.each(
																	function(
																			index) {
																		str += "<input type='hidden' name='files["
																				+ index
																				+ "]' value='"
																				+ $(
																						this)
																						.attr(
																								"href")
																				+ "'> ";
																	});

													that.append(str);

													console.log(str);

													that.get(0).submit();
												});

										$(".btn-warning")
												.on(
														"click",
														function() {
															self.location = "/document/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
																	+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
														});

									});

					var template = Handlebars.compile($("#template").html());

					$(".fileDrop").on("dragenter dragover", function(event) {
						event.preventDefault();
					});

					$(".fileDrop").on("drop", function(event) {
						event.preventDefault();

						var files = event.originalEvent.dataTransfer.files;

						var file = files[0];

						//console.log(file);

						var formData = new FormData();

						formData.append("file", file);

						$.ajax({
							url : '/uploadAjax',
							data : formData,
							dataType : 'text',
							processData : false,
							contentType : false,
							type : 'POST',
							success : function(data) {

								var fileInfo = getFileInfo(data);

								var html = template(fileInfo);

								$(".uploadedList").append(html);
							}
						});
					});

					$(".uploadedList").on("click", ".delbtn", function(event) {

						event.preventDefault();

						var that = $(this);

						$.ajax({
							url : "/deleteFile",
							type : "post",
							data : {
								fileName : $(this).attr("href")
							},
							dataType : "text",
							success : function(result) {
								if (result == 'deleted') {
									that.closest("li").remove();
								}
							}
						});
					});

					var f_id = ${doc_BoardVO.f_id};
					var template = Handlebars.compile($("#template").html());

					$.getJSON("/document/getAttach/" + f_id, function(list) {
						$(list).each(function() {

							var fileInfo = getFileInfo(this);

							var html = template(fileInfo);

							$(".uploadedList").append(html);

						});
					});

					$(".uploadedList").on("click",
							".mailbox-attachment-info a", function(event) {

								var fileLink = $(this).attr("href");

								if (checkImageType(fileLink)) {

									event.preventDefault();

									var imgTag = $("#popup_img");
									imgTag.attr("src", fileLink);

									console.log(imgTag.attr("src"));

									$(".popup").show('slow');
									imgTag.addClass("show");
								}
							});

					$("#popup_img").on("click", function() {

						$(".popup").hide('slow');

					});
				</script>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	</div>


</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>



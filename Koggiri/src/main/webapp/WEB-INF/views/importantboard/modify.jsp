<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/plugins/ckeditor/ckeditor.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

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
<h1><img src="/resources/img/s_menu02.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/noticeboard/listPage">공지</a>  &gt;  <strong>알립니다</strong></span>
</div>
</div>


<div id="lnb">
      <div class="lnb01">
      <strong class="menu01"><span>공지</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="/noticeboard/listPage">공지사항</a>
                    <ul>
                      <li class="sub01 "><a href="/noticeboard/listPage">공지사항 목록</a></li>
                      <c:if test="${Imp_BoardVO.i_EMP_ID == mem_id or mem_aut_cd == 'A'}"><!-- A등급이 아닐경우 안보임 -->
                      <li class="sub02 "><a href="/noticeboard/register">공지사항 작성</a></li> 
                  	 </c:if>
                    </ul>
                </li>
                <li class="menu02 ">
                    <a href="/importantboard/listPage">알립니다</a>
                    <ul>
                      <li class="sub01 "><a href="/importantboard/listPage">알립니다 목록</a></li>
                      <c:if test="${Imp_BoardVO.i_EMP_ID == mem_id or mem_aut_cd == 'A'}"><!-- A등급이 아닐경우 안보임 -->
                      <li class="sub02 "><a href="/importantboard/register">알립니다 작성</a></li>
                   </c:if>
                    </ul>
                </li>
           </ul>
   </div>
</div>

<div id="sub_content">

<!-- 본문 시작 -->
<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<!-- <div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div> -->
				<!-- /.box-header -->

				<form role="form" action="modify" method="post">

					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					
					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">글번호<br><br></label> <input type="text"
								name='I_ID' class="form-control" value="${Imp_BoardVO.i_ID}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">제목<br><br></label> <input type="text"
								name='I_TITLE' class="form-control" value="${Imp_BoardVO.i_TITLE}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">내용<br><br></label>
							<textarea class="form-control" name="I_CONTENT" rows="3">${Imp_BoardVO.i_CONTENT}</textarea>			
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">작성자<br><br></label> <input
								type="text" name="I_EMP_ID" class="form-control"
								value="${Imp_BoardVO.i_EMP_ID}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">파일 첨부<br><br></label>
							<div class="fileDrop" style="margin-left: 0px; width: 970px;"></div>
						</div>
						
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer">
					
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
						
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
															 self.location = "/importantboard/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
																	 +"&searchType=${cri.searchType}&keyword=${cri.keyword}";
														});

										/* $(".btn-primary").on("click",
												function() {
													formObj.submit();
												}); */

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

					var i_ID = $
					{
						Imp_BoardVO.i_ID
					};
					var template = Handlebars.compile($("#template").html());

					$.getJSON("/importantboard/getAttach/" + i_ID, function(list) {
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
<br><br>
</div>
	</div>

<!-- 본문 끝 -->
</div>


</div>
</div>

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>

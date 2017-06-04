<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script type="text/javascript"
	src="/resources/plugins/ckeditor/ckeditor.js"></script>
<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${search.page}"> <input
						type='hidden' name='perPageNum' value="${search.perPageNum}">
					<input type='hidden' name='searchType' value="${search.searchType}">

					<div class="box-body">

						<div id="approval" align="center">
							<h3>Approval</h3>
							<br> <br> <input type="hidden" name="dept_cd"
								value="${einfo.dept_id }"> <input type="hidden"
								name="draft_emp_id" value="k15010201"> <input type="hidden"
								name="app_id" value="${approvalVO.app_id }">

							<table width="1100" id="app_table" align="center">
								<tr>
									<th>사번</th>
									<td><input type="text" name="draft_emp_id"
										value="${einfo.emp_id }" disabled></td>
									<th>이름</th>
									<td><input type="text" name="draft_emp_nm"
										value="${einfo.emp_nm }" disabled></td>
								</tr>
								<tr>
									<th>소속</th>
									<td><input type="text" name="dept_nm"
										value="${einfo.dept_nm }" disabled></td>
									<th>직급</th>
									<td><input type="text" name="pos_nm"
										value="${einfo.pos_nm }" disabled></td>
								</tr>
								<tr>
									<th>기안일</th>
									<td><input type="text" name="draft_dt" class="datepicker"
										value="${approvalVO.draft_dt }" disabled></td>
									<th>신청종류</th>
									<td><input type="text" name="app_type_nm"
										value="${approvalVO.app_type_nm }" disabled></td>
								</tr>
								<tr>
									<th>결재자</th>
									<td><input type="text" name="app_emp_id"
										value="${approvalVO.app_emp_id }"></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" name="app_title"
										value="${approvalVO.app_title }"></td>

								</tr>

							</table>
						</div>
						<br>
						<div align="center" id="app_text">
							<textarea rows="20" cols="70" id="app_context" name="app_context">
							${approvalVO.app_context }
	 						</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">File DROP Here</label>
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

						<button type="submit" class="btn btn-primary">SAVE</button>
						<button type="submit" class="btn btn-warning">CANCEL</button>

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
															self.location = "/approval/lists?page=${search.page}&perPageNum=${search.perPageNum}"
																	+ "&searchType=s&app_pro_cd=${search.app_pro_cd}"
																	+ "&search_app_id=${search.search_app_id}"
															+ "&app_type=${search.app_type}"
															+ "&draft_emp_id=${search.draft_emp_id}"
															+ "&app_emp_id=${search.app_emp_id}"
															+ "&draft_s_dt=${search.draft_s_dt}"
															+ "&draft_e_dt=${search.draft_e_dt}";
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

					var app_id = $
					{
						approvalVO.app_id
					};
					var template = Handlebars.compile($("#template").html());

					$.getJSON("/approval/getAttach/" + app_id, function(list) {
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
	<!-- /.row -->
</section>
<!-- /.content -->
</div>

<script type="text/javascript">
	CKEDITOR.replace('app_context', {
		'filebrowserUploadUrl' : '/resources/plugins/ckeditor/upload.jsp?'
				+ 'realUrl=http://www.localhost.com/서버업로드될디렉토리명'
				+ '&realDir=서버업로드될디렉토리명'
	});
</script>



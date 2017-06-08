<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript"
	src="/resources/plugins/ckeditor/ckeditor.js"></script>

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

				<form role="form" action="modify" method="post">

					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					
					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">BNO</label> <input type="text"
								name='N_ID' class="form-control" value="${Noti_BoardVO.n_ID}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name='N_TITLE' class="form-control" value="${Noti_BoardVO.n_TITLE}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="N_CONTENT" rows="3">${Noti_BoardVO.n_CONTENT}</textarea>			
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input
								type="text" name="N_EMP_ID" class="form-control"
								value="${Noti_BoardVO.n_EMP_ID}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">File DROP Here</label>
							<div class="fileDrop"></div>
						</div>
						
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer">
					
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
						
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
															 self.location = "/noticeboard/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
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

					var n_ID = $
					{
						Noti_BoardVO.n_ID
					};
					var template = Handlebars.compile($("#template").html());

					$.getJSON("/noticeboard/getAttach/" + n_ID, function(list) {
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

<!-- /.content-wrapper -->



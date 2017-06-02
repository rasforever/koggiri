<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="/resources/plugins/ckeditor/ckeditor.js"></script>



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

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">BNO</label> <input type="text"
								name='f_id' class="form-control" value="${doc_BoardVO.f_id}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name='f_title' class="form-control" value="${doc_BoardVO.f_title}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
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
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input
								type="text" name="f_emp_id" class="form-control"
								value="${doc_BoardVO.f_emp_id}" readonly="readonly">
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>

				<script>
					$(document)
							.ready(
									function() {

										var formObj = $("form[role='form']");

										console.log(formObj);

										$(".btn-warning")
												.on(
														"click",
														function() {
															self.location = "/document/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
														});

										$(".btn-primary").on("click",
												function() {
													formObj.submit();
												});

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
<!-- /.content-wrapper -->



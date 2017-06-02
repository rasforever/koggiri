<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<h3 class="box-title">문서 게시판</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='f_title' class="form-control" placeholder="제목을 입력하세요...">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label> <input type="text"
								name="f_emp_id" class="form-control" placeholder="작성자를 입력하세요...">
						</div>


						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" name="f_content" rows="3"
								placeholder="내용을 입력하세요..."></textarea>
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

					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">등록하기</button>
					</div>
				</form>


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

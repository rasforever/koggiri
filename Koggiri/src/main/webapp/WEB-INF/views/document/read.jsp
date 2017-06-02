<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post">

					<input type='hidden' name='f_id' value="${doc_BoardVO.f_id}">

				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> <input type="text"
							name='f_title' class="form-control" value="${doc_BoardVO.f_title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">내용</label>
						<textarea class="form-control" name="f_content" rows="3"
							readonly="readonly">${doc_BoardVO.f_content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작성자</label> <input type="text"
							name="f_emp_id" class="form-control" value="${doc_BoardVO.f_emp_id}"
							readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-warning">Modify</button>
					<button type="submit" class="btn btn-danger" onclick="fn();">REMOVE</button>
					<button type="submit" class="btn btn-primary">LIST ALL</button>
				</div>


			<script>
					
					$(document).ready(function() {

						var formObj = $("form[role='form']");

						console.log("byunghwibyunghwi" + formObj);

						$(".btn-warning").on("click", function() {
							formObj.attr("action", "/document/modify");
							formObj.attr("method", "get");
							formObj.submit();
						});

						$(".btn-danger").on("click", function() {//삭제하기
							formObj.attr("action", "/document/remove");
							formObj.submit();
						});

						$(".btn-primary").on("click", function() {//리스트페이지가기
							self.location = "/document/listAll";
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

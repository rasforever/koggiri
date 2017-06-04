<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<!-- Main content -->
<section class="content">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY TASK</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">

				
					<div class="box-body">

		<div class="form-group">
			<label for="exampleInputEmail1">글번호</label>
			<input type="text" name='ta_seq' class="form-control" value="${taskVO.ta_seq}"
				readonly="readonly">
		</div>

		<div class="form-group">
			<label for="ta_date">업무기간</label> <input type="text"
				name='ta_date' class="form-control" value="${taskVO.ta_date}">
		</div>
		<div class="form-group">
			<label for="ta_weekresult">금주업무실적</label>
			<textarea class="form-control" name="ta_weekresult" rows="3">${taskVO.ta_weekresult}</textarea>
		</div>
		<div class="form-group">
			<label for="ta_nextresult">차주업무계획</label>
			<textarea class="form-control" name="ta_nextresult" rows="3">${taskVO.ta_nextresult}</textarea>
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
														self.location = "/task/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
													});

									$(".btn-primary").on("click", function() {
										formObj.submit();
									});

								});
			</script>




		</div>
		<!-- /.box -->
	</div>
	<!--/.col (left) -->

	<!-- /.row -->
</section>
<!-- /.content -->
<!-- /.content-wrapper -->


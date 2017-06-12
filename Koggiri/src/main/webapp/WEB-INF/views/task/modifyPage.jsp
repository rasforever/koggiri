<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript"
	src="/resources/plugins/ckeditor/ckeditor.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu03.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/">홈</a> <span> &gt; </span> <strong>업무
						보고</strong></span>
			</div>
		</div>


		<div id="lnb">
			<div class="lnb01">
				<strong class="menu02"><span>전자결재</span></strong>
				<ul>
					<li class="menu01"><a href="/task/list">업무보고</a>
						<ul>
						</ul></li>
					<li class="menu02 "><a href="/approval/lists">전자결재</a>
						<ul>
							<li class="sub01 "><a href="/approval/lists">보낸 결재</a></li>
							<li class="sub02 "><a href="/approval/listr">받은 결재</a></li>
							<li class="sub03 "><a href="/approval/register">결재 입력</a></li>
						</ul></li>
					<li class="menu03 "><a href="/document/list">문서함</a>
						<ul></ul></li>
				</ul>
			</div>
		</div>

		<div id="sub_content" align="center">
			<!-- Main content -->
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">업무 수정</h3>
					</div>
					<!-- /.box-header -->

					<form role="form" action="modifyPage" method="post">

						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">

						<div class="box-body">

							<div class="form-group">
								<label for="exampleInputEmail1">글번호</label> <input type="text"
									name='ta_seq' class="form-control" value="${taskVO.ta_seq}"
									readonly="readonly">
							</div>




							<div class="form-group">
								<label for="emp_id">작성자</label> <br> <input type="text"
									name='emp_id' class="form-control" value="${taskVO.emp_nm}"
									size="23" readonly="readonly">
							</div>

							<div class="form-group">
								<label for="ta_date">업무기간</label> <input type="text"
									name='ta_date' class="form-control" value="${taskVO.ta_date}"
									readonly="readonly">
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

					<div>

						<div class="box-footer">
							<button type="submit" class="btn btn-primary">SAVE</button>
							<button type="submit" class="btn btn-warning">CANCEL</button>
						</div>

						<c:if test="emp_id=='${mem_id}">
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">SAVE</button>
								<button type="submit" class="btn btn-warning">CANCEL</button>
							</div>
						</c:if>

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
																	self.location = "/task/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
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

				<!-- /.row -->
			</div>
		</div>
	</div>
</div>

<!-- /.content -->
<!-- /.content-wrapper -->

<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>
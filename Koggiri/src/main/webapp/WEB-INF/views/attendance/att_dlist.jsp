<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">	
<%@ include file="../include/header.jsp"%>

<%@ include file="../sidebar/approval_sidebar.jsp"%>


<!-- Main content -->


	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">나의 근태 기록</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>근무일</th>
							<th>출근시간</th>
							<th>퇴근시간</th>
						</tr>

						<c:forEach items="${list}" var="approvalVO">

							<tr>
								<td><a
									href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>
										${approvalVO.app_id} </a></td>
								<td><a
									href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.draft_dt}</a></td>
								<td><a
									href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.app_type_nm}</a></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="listr${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.search.page == idx?'class =active':''}"/>>
									<a href="listr${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="listr${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->

<!-- /.content -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
</script>

<script>

	$(document).ready(
		function() {
			$('#searchBtn').on(
				"click",
				function(event) {
					var ck_app_type_cd;
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}
					if ($('#app_pro_cd').val() == "") {
						ck_app_type_cd = "%20";
					} else {
						ck_app_type_cd = $('#app_pro_cd').val();
					}

					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#AllsearchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "%20";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#a_searchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "0";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#c_searchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "1";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#n_searchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "2";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
		});

	function dis_chg(obj) {
		if (obj.checked == true) {
			if ($(obj).val() == "app_id") {
				$('#search_app_id').attr("disabled", false);
			} else if ($(obj).val() == "app_type_cd") {
				$('#app_type').attr("disabled", false);
			} else if ($(obj).val() == "dept_cd") {
				$('#dept_cd').attr("disabled", false);
			} else if ($(obj).val() == "draft_emp_id") {
				$('#draft_emp_id').attr("disabled", false);
			} else if ($(obj).val() == "draft_dt") {
				$('#draft_s_dt').attr("disabled", false);
				$('#draft_e_dt').attr("disabled", false);
			}

		} else if (obj.checked == false) {
			if ($(obj).val() == "app_id") {
				$('#search_app_id').attr("disabled", true);
			} else if ($(obj).val() == "app_type_cd") {
				$('#app_type').attr("disabled", true);
			} else if ($(obj).val() == "dept_cd") {
				$('#dept_cd').attr("disabled", true);
			} else if ($(obj).val() == "draft_emp_id") {
				$('#draft_emp_id').attr("disabled", true);
			} else if ($(obj).val() == "draft_dt") {
				$('#draft_s_dt').attr("disabled", true);
				$('#draft_e_dt').attr("disabled", true);
			}
		}
	}
</script>


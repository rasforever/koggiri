<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Board List</h3>
				</div>

				<div class='box-body'>

					 <tr>
						<td><input type="checkbox" name="area" value="app_id"
							onclick="dis_chg(this)">결재문서번호</input></td>
						<td><input type="text" name="search_app_id" id="search_app_id"
							size="30" disabled></input></td>
						<td><input type="checkbox" name="area" value="app_type_cd"
							onclick="dis_chg(this)">결재구분</input></td>
						<td><select id="app_type_cd" name="app_type_cd" disabled>
								<c:forEach var="apptypeVO" items="${applist}">
									<option value="${apptypeVO.app_type_cd}">${apptypeVO.app_type_nm}
									</option>
								</c:forEach>
						</select></td>
						<td><input type="checkbox" name="area" value="dept_id"
							onclick="dis_chg(this)">관리부서</input></td>
						<td><select id="dept_id" name="dept_id" disabled>
								<c:forEach var="deptVO" items="${deptlist}">
									<option value="${deptVO.dept_id}">${deptVO.dept_nm}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="area" value="draft_emp_id"
							onclick="dis_chg(this)">기안자</td>
						<td><input type="text" name="draft_emp_id"
								id="draft_emp_id" size="30" disabled></td>
						<td><input type="checkbox" name="area" value="app_emp_id"
							onclick="dis_chg(this)">결재자</td>
						<td><input type="text" name="app_emp_id"
							id="app_emp_id" size="30" disabled></td>
						<td><input type="checkbox" name="area" value="draft_dt"
							onclick="dis_chg(this)">제안일</td>
						<td><input type="text" name="draft_s_dt" id="draft_s_dt"
							class="datepicker" disabled size="14"> ~ <input
							type="text" name="draft_e_dt" id="draft_e_dt" class="datepicker"
							disabled size="14"></td>
					</tr>								
					<button id='searchBtn'>Search</button>
				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>결재문서번호</th>
							<th>제안일</th>
							<th>결재구분</th>
							<th>관리부서</th>
							<th>기안자</th>
							<th>결재자</th>
							<th>진행상태</th>
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
								<td><a
									href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.dept_nm}</a></td>
								<td><a
									href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.draft_emp_nm}</a></td>
								<td><a
									href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.app_emp_nm}</a></td>
								<td><a
									href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.app_pro_nm}</a></td>


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
</section>
<!-- /.content -->


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

							self.location = "listr"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType=r"
									+ "&app_pro_cd="+
									+ "&search_app_id=" + $('#keywordInput').val();
									+ "&app_type=" + $('#keywordInput').val();
									+ "&draft_emp_id=" + $('#keywordInput').val();
									+ "&app_emp_id=" + $('#keywordInput').val();
									+ "&draft_s_dt=" + $('#keywordInput').val();
									+ "&draft_e_dt=" + $('#keywordInput').val();

						});				
			});
	function dis_chg(obj) {
		if (obj.checked == true) {
			if ($(obj).val() == "app_id") {
				$('#app_id').attr("disabled", false);
			} else if ($(obj).val() == "app_type_cd") {
				$('#app_type_cd').attr("disabled", false);
			} else if ($(obj).val() == "dept_id") {
				$('#dept_id').attr("disabled", false);
			} else if ($(obj).val() == "draft_emp_id") {
				$('#draft_emp_id').attr("disabled", false);
			} else if ($(obj).val() == "app_emp_id") {
				$('#app_emp_id').attr("disabled", false);
			} else if ($(obj).val() == "draft_dt") {
				$('#draft_s_dt').attr("disabled", false);
				$('#draft_e_dt').attr("disabled", false);
			}

		} else if (obj.checked == false) {
			if ($(obj).val() == "app_id") {
				$('#app_id').attr("disabled", true);
			} else if ($(obj).val() == "app_type_cd") {
				$('#app_type_cd').attr("disabled", true);
			} else if ($(obj).val() == "dept_id") {
				$('#dept_id').attr("disabled", true);
			} else if ($(obj).val() == "draft_emp_id") {
				$('#draft_emp_id').attr("disabled", true);
			} else if ($(obj).val() == "app_emp_id") {
				$('#app_emp_id').attr("disabled", true);
			} else if ($(obj).val() == "draft_dt") {
				$('#draft_s_dt').attr("disabled", true);
				$('#draft_e_dt').attr("disabled", true);
			}
		}
	}
</script>


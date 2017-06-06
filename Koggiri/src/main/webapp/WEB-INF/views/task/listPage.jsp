<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Task List</h3>
				</div>
				<div class='box-body'>
					<button id='newBtn'>New Task</button>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered" border="1">
						<tr>
							<th style="width: 10px">글번호</th>
							<th>제목</th>
							<th>금주업무실적</th>
							<th>차주업무계획</th>
							<th>작성일</th>
							<th style="width: 40px">조회수</th>
						</tr>


						<c:forEach items="${list}" var="TaskVO">

							<tr>
								<td>${TaskVO.ta_seq}</td>
								<td><a href='/task/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&ta_seq=${TaskVO.ta_seq}'>
								${TaskVO.ta_date}</a></td>
								<td>${TaskVO.ta_weekresult}</td>
								<td>${TaskVO.ta_nextresult}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${TaskVO.ta_regdate}" /></td>
								<td><span class="badge bg-red">${TaskVO.ta_hitcount }</span></td>
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
									href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
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

<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>


<script>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}

	$(".pagination li a").on("click", function(event) {

		event.preventDefault();

		var targetPage = $(this).attr("href");

		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/task/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>

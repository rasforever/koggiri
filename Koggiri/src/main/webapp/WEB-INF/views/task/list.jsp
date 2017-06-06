<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


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

						<input type="text" name='keyword' id="keyword_search"
							class="week-picker" placeholder="업무기간을 선택하세요"
							value='${cri.keyword }'>
						<button id='searchBtn' class="pagination">검색</button>
						<button id='newBtn' class="pagination">글 작성</button>

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
				<th>업무일자</th>
				<th>금주업무실적</th>
				<th>차주업무계획</th>
				<th>작성일자</th>
				<th style="width: 40px">조회수</th>
			</tr>

			<c:forEach items="${list}" var="taskVO">


				<tr>
					<td>${taskVO.ta_seq}</td>
					<td><a
						href='/task/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&ta_seq=${taskVO.ta_seq}'>
							${taskVO.ta_date} </a></td>
					<td>${taskVO.ta_weekresult}</td>
					<td>${taskVO.ta_nextresult}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${taskVO.ta_regdate}" /></td>
					<td><span class="badge bg-red">${taskVO.ta_hitcount }</span></td>
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
						href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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

	if (result == 'success') {
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

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>


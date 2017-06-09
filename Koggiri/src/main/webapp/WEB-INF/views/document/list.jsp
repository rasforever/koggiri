<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<%@ include file="../include/header.jsp"%>


<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 



<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="sub_top">   
     <span><a href="/main">홈</a>  <span> &gt; </span> <a href="#">전자 문서</a>  &gt;  <strong>문서함</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu05"><span>회사 정보</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="#">업무보고</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/chart/listAll">전자결재</a>
                    <ul>
                      <li class="sub01 "><a href="#">보낸결재</a></li>
                      <li class="sub02 "><a href="#">받은결재</a></li>
                      <li class="sub03 "><a href="#">결제입력</a></li>
                    </ul>
                </li>
                 <li class="menu03 ">
                    <a href="/chart/listAll">문서함</a>
  					<ul></ul>
                </li>
           </ul>
   </div>
</div>

<div id="sub_content" align="center">

<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">문서게시판</h3>
				</div>


				<div class='box-body'>

					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자</option>

					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn' class="pagination">검색</button>
					<button id='newBtn' class="pagination">글 작성</button>

				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">글목록</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th style="width: 40px">조회수</th>
						</tr>

						<c:forEach items="${list}" var="boardVO">

							<tr>
								<td>${boardVO.f_id}</td>
								<td><a
									href='/document/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&f_id=${boardVO.f_id}'>
										${boardVO.f_title} </a></td>
								<td>${boardVO.f_emp_nm}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.f_date}" /></td>
								<td><span class="badge bg-red">${boardVO.f_hit}</span></td>
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
<!-- 본문 -->

	</div>


</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>




<!-- Main content -->

<section class="content">

	
	<!-- /.row -->
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






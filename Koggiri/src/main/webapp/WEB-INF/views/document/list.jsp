<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />




<%@ include file="../include/header.jsp"%>


<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 



<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu05.png"/></h1>
<div class="sub_top">   
     <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/task/list">전자 문서</a>  &gt;  <strong>문서함</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu02"><span>전자결재</span></strong>
      <ul>
                <li class="menu01">
                    <a href="/task/list">업무보고</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/approval/lists">전자결재</a>
                    <ul>
                      <li class="sub01 "><a href="/approval/lists">보낸 결재</a></li>
                      <li class="sub02 "><a href="/approval/listr">받은 결재</a></li>
                      <li class="sub03 "><a href="/approval/register">결재 입력</a></li>
                    </ul>
                </li>
                 <li class="menu03 ">
                    <a href="/document/list">문서함</a>
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
					<h3 class="box-title" align="left" style="font-size: 16px"><strong>문서게시판</strong></h3><br><br><br>
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
					<h3 class="box-title" align="left" style="font-size: 14px">글목록</h3>
				</div>
				<div class="box-body" style="text-align: center;">
					<table class="table table-bordered">
						<tr>
							<th style="width: 60px;">글번호</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">작성자</th>
							<th style="text-align: center;">작성일</th>
							<th style="width: 60px">조회수</th>
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
					
					<a href=windowopen(b.html)>

<<<<<<< HEAD
					<div>
						<iframe src="http://106.242.203.68:8082"
							style="width: 400px; height: 500px;"></iframe>

					</div>
=======
>>>>>>> branch 'master' of https://github.com/rasforever/koggiri
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






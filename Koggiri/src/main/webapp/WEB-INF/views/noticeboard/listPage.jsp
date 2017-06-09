<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="side.jsp"%> --%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	
<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="breadcrumb">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="#">회사정보</a>  &gt;  <strong>조직도</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu05"><span>회사 정보</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="#">Koggiri란?</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/chart/listAll">조직도</a>
                    <ul>
                      <li class="sub01 "><a href="/chart/list?dept_id=MM">경영팀</a></li>
                      <li class="sub02 "><a href="/chart/list?dept_id=PL">인사팀</a></li>
                      <li class="sub03 "><a href="/chart/list?dept_id=MT">관리팀</a></li>
                      <li class="sub01 "><a href="/chart/list?dept_id=SN">솔루션팀</a></li>
                      <li class="sub02 "><a href="/chart/list?dept_id=BS">영업팀</a></li>
                      <li class="sub03 "><a href="/chart/list?dept_id=MG">마게팅팀</a></li>
                    </ul>
                </li>
           </ul>
   </div>
</div>

<div id="content">

<!-- 본문 내용 -->

<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
				
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
				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	</tr>


<c:forEach items="${list}" var="Noti_BoardVO">

	<tr>
		<td>${Noti_BoardVO.n_ID}</td>
		<td><a href='/noticeboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&n_ID=${Noti_BoardVO.n_ID}'>${Noti_BoardVO.n_TITLE}</a></td>
		<td>${Noti_BoardVO.n_EMP_ID}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				value="${Noti_BoardVO.n_DATE}" /></td>
		<td><span class="badge bg-red">${Noti_BoardVO.n_HIT }</span></td>
	</tr>

</c:forEach>

</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">Footer</div>
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="listPage${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="listPage${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="listPage${ pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->
	<!-- /.row -->
<!-- /.content-wrapper -->
<script>
    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>   
<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "listPage"
									+ '${pageMaker.makerQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>



       
</div>

<!-- 본문 끝 -->

<div class="footer_wrap" style="background-color: #ffffff;">
<%@ include file="../include/footer.jsp"%>
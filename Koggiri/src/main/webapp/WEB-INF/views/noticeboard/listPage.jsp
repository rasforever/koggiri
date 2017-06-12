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
<h1><img src="/resources/img/s_menu01.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/noticeboard/listPage">공지</a>  &gt;  <strong>공지사항</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu01"><span>회사 정보</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="/noticeboard/listPage">공지사항</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/importantboard/listPage">알립니다</a>
                </li>
           </ul>
   </div>
</div>

<div id="sub_content">

<!-- 본문 내용 시작 -->

<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box" style="border-top: 0px;">
				<!-- <div class="box-header with-border">
					<h3 class="box-title"></h3>
				</div> -->
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
					<button id='searchBtn' class="pagination" style="border: 1px solid #bdbdbd; padding: 4px">검색</button>
					<c:if test="${emp_nm=='master'}">
					<button id='newBtn' class="pagination" style="border: 1px solid #bdbdbd; padding: 4px">글 작성</button>
					</c:if>

				</div>

<table class="table table-bordered">
	<tr>
		<th style="text-align: center; width: 60px">글번호</th>
		<th style="text-align: center;">TITLE</th>
		<th style="text-align: center;">WRITER</th>
		<th style="text-align: center;">REGDATE</th>
		<th style="text-align: center; width: 70px">VIEWCNT</th>
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
	
<!-- 본문 내용  끝-->
	
</div>
       
</div>
</div>


<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>
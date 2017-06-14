<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="side.jsp"%> --%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu10.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/main">홈</a> <span> &gt; </span> <a href="#">사원관리</a>
					<span> &gt; </span> <strong>사원등록</strong></span>
			</div>
		</div>


		<div id="lnb">
			<div class="lnb01">
				<strong class="menu05"><span>관리자</span></strong>
				<ul>
					<li class="menu02 "><a href="/admin_emp/manager">사원관리</a></li>
					<li class="menu02 "><a href="/attendance/att_alldlist">근태확인</a>
						<ul>
							<li class="sub01 "><a href="/attendance/att_mlist">월
									근태내역</a></li>
							<li class="sub01 "><a href="/attendance/att_dlist">일
									근태내역</a></li>
							<li class="sub01 "><a href="#">휴가등록</a></li>

							<ul></ul>
						</ul></li>
				</ul>
			</div>
		</div>

		<div id="sub_content" align="center">


			<div id="sub_content" align="center">
				<div id="joinus" align="left">

					<input type="button" id="join" value="입사발령" style="cursor: pointer" />
					<input type="button" id="ch_Personnel" value="인사이동"
						style="cursor: pointer" /> <input type="button"
						id="modifyInformation" value="사원정보/추가/변경" style="cursor: pointer" />
					<input type="button" id="resign" value="퇴사처리"
						style="cursor: pointer" /> <input type="button" id="temp"
						value="임시비밀번호 부여" style="cursor: pointer" /> <br>
					<form action="manager" method="post">
						<select name="area">
							<option value="">검색옵션</option>
							<option value="emp_id">사번</option>
							<option value="emp_nm">이름</option>
							<option value="dept_nm">부서</option>
							<option value="pos_nm">직급</option>
						</select> <input type="text" name="searchKey" size="30px"> <input
							type="submit" value="검색" id="manager_search_btn"
							style="cursor: pointer">

					</form>
					<table class="manager_table_title" style="margin-bottom: 0px;">
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>부서</th>
							<th>직급</th>
						</tr>
					</table>
					<div class="manager_t"
						style="width: 970px; height: 300px; overflow: auto;">
						<table id="manager_table" style="table-layout: fixed;">

							<!-- 밑에는 내용 뿌려줄것 -->

						<c:set var="n" value="0" />
							<c:forEach var="SearchedEmpVO" items="${list }">
								<tr align="center">
									<td><a href='javascript:getVal("${n}");'>${SearchedEmpVO.emp_id }</a></td>
									<td>${SearchedEmpVO.emp_nm }</td>
									<td>${SearchedEmpVO.dept_nm }</td>
									<td>${SearchedEmpVO.pos_nm }</td>
								</tr>
							<c:set var="n" value="${n+1}" />
							</c:forEach>
						</table>
					</div>
					<br>
					<br>
					<br>
				</div>
			</div>
			<div id="joindiv">
				<c:if test="${mem_pw!=null }">
					<br>사번 '${id }' 님의 임시비밀번호는 '${mem_pw }' 로 부여 되었습니다.
				</c:if>
			</div>

			<br> <br> <br>

		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#join").click(function() {
			$.ajax({
				type : 'get',
				url : 'joinus',
				dataType : 'text',
				success : function(data) {

					if ($("#joindiv").children().length == 0) {
						$("#joindiv").html(data);
					} else if ($("#joindiv").children().length > 0) {
						$("#joindiv").empty().html(data);
					}

				}
			});
		});
		
		$("#ch_Personnel").click(function() {
			$.ajax({
				type : 'get',
				url : 'ch_Personnel',
				dataType : 'text',
				success : function(data) {

					if ($("#joindiv").children().length == 0) {
						$("#joindiv").html(data);
					} else if ($("#joindiv").children().length > 0) {
						$("#joindiv").empty().html(data);
					}

				}
			});
		});
		

		$("#modifyInformation").click(function() {
			$.ajax({
				type : 'get',
				url : 'modifyInformation',
				dataType : 'text',
				success : function(data) {

					if ($("#joindiv").children().length == 0) {
						$("#joindiv").html(data);
					} else if ($("#joindiv").children().length > 0) {
						$("#joindiv").empty().html(data);
					}

				}
			});
		});
		
		$("#resign").click(function() {
			$.ajax({
				type : 'get',
				url : 'resign',
				dataType : 'text',
				success : function(data) {

					if ($("#joindiv").children().length == 0) {
						$("#joindiv").html(data);
					} else if ($("#joindiv").children().length > 0) {
						$("#joindiv").empty().html(data);
					}

				}
			});
		});

		$("#temp").click(function() {
			$.ajax({
				type : 'get',
				url : 'temppass',
				dataType : 'text',
				success : function(data) {

					if ($("#joindiv").children().length == 0) {
						$("#joindiv").html(data);
					} else if ($("#joindiv").children().length > 0) {
						$("#joindiv").empty().html(data);
					}

				}
			});
		});

	})



</script>
<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>
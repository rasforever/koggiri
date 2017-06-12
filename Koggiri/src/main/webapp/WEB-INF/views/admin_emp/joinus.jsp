<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="side.jsp"%> --%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

	<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu10.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/main">홈</a> <span> &gt; </span> <a href="#">사원관리</a>  <span> &gt; </span> <strong>사원등록</strong></span>
			</div>
		</div>


		<div id="lnb">
			<div class="lnb01">
				<strong class="menu05"><span>관리자</span></strong>
				<ul>
					<li class="menu02 "><a href="/admin_emp/joinus">사원관리</a>
						<ul>
							<li class="sub01 "><a href="#">사원등록</a></li>
							<li class="sub01 "><a href="#">인사이동</a></li>
							<li class="sub01 "><a href="#">사원정보 추가/변경</a></li>
							<li class="sub01 "><a href="#">퇴사</a></li>
							<ul></ul>
						</ul></li>
						<li class="menu02 "><a href="/attendance/att_alldlist">근태확인</a>
						<ul>
							<li class="sub01 "><a href="/attendance/att_mlist">월 근태내역</a></li>
							<li class="sub01 "><a href="/attendance/att_dlist">일 근태내역</a></li>
							<li class="sub01 "><a href="#">휴가등록</a></li>

							<ul></ul>
						</ul></li>
				</ul>
			</div>
		</div>

<div id="sub_content" align="center">
<div id="joinus" align="left">
	<form action="joinus" method="post" id="insertform">
	<table id="joinus_table">
	<tr>
	<th align="left">이름</th>
	<td><input type="text" name="emp_nm" placeholder="ex)유승현" size="37px"></td>
	</tr>
	<tr>
	<th align="left">직급</th>
	<td>		<select name="pos_id" style="cursor:pointer">
				<option value="">직급선택</option>
    			<option value="10">CEO</option>
   				<option value="11">이사</option>
    			<option value="12">부장</option>
    			<option value="13">차장</option>
				<option value="14">과장</option>
				<option value="15">대리</option>
				<option value="16">사원</option>
			</select></td>
	</tr>
	<tr>
	<th align="left">부서</th>
	<td><select name="dept_id" style="cursor:pointer">
				<option value="">부서선택</option>
    			<option value="MM">경영진</option>
   				<option value="PL">인사팀</option>
    			<option value="MT">관리팀</option>
    			<option value="SN">솔루션팀</option>
				<option value="BS">영업팀</option>
				<option value="SE">서비스팀</option>
				<option value="MG">마케팅팀</option>
			</select></td>
	</tr>
		<tr>
	<th align="left">입사일</th>
	<td><input type="text" size="37px" class="datepicker" name="join_dt" /></td>
	</tr>
			<tr>
	<th align="left">성별</th>
	<td><select name="sex_id" style="cursor:pointer">
				<option value="">성별선택</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select></td>
	</tr>
	<th align="left">국적</th>
	<td><select name="nation_id" style="cursor:pointer">
				<option value="">국적선택</option>
				<option value="KR">한국</option>
				<option value="JP">일본</option>
				<option value="US">미국</option>
			</select></td>
	</tr>
			<tr>
	<th align="left">주민등록번호</th>
	<td><input type="text"  size="37px"name="res_no" placeholder=" ' - '없이 입력하세요"></td>
	</tr>
	<tr>
	<br>
	<td colspan="2" align="center"><input type="submit" value="추가" id="joinus_btn" style="cursor:pointer"></td>
	</tr>
	</table>
		
	</form>
</div>
	</div>


</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript">
$(function(){

	$(".datepicker").datepicker({

	dateFormat : "yy/mm/dd"

	});

});


</script>
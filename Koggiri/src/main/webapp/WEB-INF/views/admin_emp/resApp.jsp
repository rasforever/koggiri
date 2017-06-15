<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<table class="resApp_table_title" border="1">
	<tr>
		<th>사원ID</th>
		<th>성명</th>
		<th>부서명</th>
		<th>직급 이름</th>
		<th>퇴사일</th>
		<th>퇴사 사유</th>

	</tr>

	<c:forEach var="Res_AppVO" items="${list }">
		<tr align="center">
			<td>${Res_AppVO.emp_id}</td>
			<td>${Res_AppVO.emp_nm }</td>
			<td>${Res_AppVO.dept_nm }</td>
			<td>${Res_AppVO.pos_nm }</td>
			<td>${Res_AppVO.expire_dt }</td>
			<td>${Res_AppVO.res_name }</td>
		</tr>
	</c:forEach>
</table>

<form action ="resApp" method="post">
사번검색:
<input type="text" name='searchKey' class="keywordInput">
<input type="submit" value="검색" id="search_btn"
							style="cursor: pointer">
</form>


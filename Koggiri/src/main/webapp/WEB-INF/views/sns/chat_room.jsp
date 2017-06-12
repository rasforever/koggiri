<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<table class="table table-bordered" border="1">
	<tr>
		<th>방id</th> <!-- 히든 -->
		<th>사번</th> <!-- 히든 -->
		<th>입력내용</th>
		<th>입력시간</th> <!-- 히든 -->
	</tr>
	<%-- ${ck_emp_id} --%>
	<c:forEach items="${roomlist}" var="roomVO">
		<tr>
			<td>${roomVO.room_id }</td>
			<td>${roomVO.emp_id }</td>
			<td>${roomVO.input_text }</td>
			<td>${roomVO.input_date }</td>
		</tr>
	</c:forEach>



</table>
<!-- /.box-body -->


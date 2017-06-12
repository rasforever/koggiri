<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<input type='hidden' id='room_id' value="${ck_room_id }">
<input type='hidden' id='emp_id' value="${ck_emp_id }">
<input type='hidden' id='n_emp_id' value="${ck_n_emp_id }">


<%-- ${ck_emp_id} --%>
<table class="table table-bordered">
	<c:forEach items="${roomlist}" var="roomVO">	
		<c:if test="${roomVO.emp_id == ck_emp_id}">
			<div style="text-align: right">
				<input type="text" value="${roomVO.input_text }"><br>
			</div>
		</c:if>
		<c:if test="${roomVO.emp_id == ck_n_emp_id}">
			<div style="text-align: left">
				<input type="text" value="${roomVO.input_text }"><br>
			</div>
		</c:if>



	</c:forEach>
</table>



<!-- /.box-body -->


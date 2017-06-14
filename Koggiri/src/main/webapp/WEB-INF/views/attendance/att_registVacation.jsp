<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script type="text/javascript"
	src="/resources/plugins/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker({
			altField : '#getdate',
			dateFormat : "yy/mm/dd",
			minDate : 0
		});
		$(".datepicker").datepicker({
			altField : '#setdate',
			dateFormat : "yy/mm/dd",
			minDate : 0
		});
	});
	
</script>

<table class="att_registVacation" >
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>부서</th>
		<th>직급</th>
	</tr>

	<!-- 밑에는 내용 뿌려줄것 -->

	<c:forEach var="Att_EmpVO" items="${list }">
		<tr align="center">
			<td>${Att_EmpVO.emp_id }</td>
			<td>&nbsp;&nbsp;&nbsp;${Att_EmpVO.emp_nm }</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Att_EmpVO.dept_nm }</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Att_EmpVO.pos_nm }</td>
		</tr>
	</c:forEach>
</table>
<table id="resign_table">

	<tr>
		<td>사번 &nbsp;&nbsp;&nbsp; <input type="text" name="area"
			style="height: 25px; width: 150px; margin-right: 60px" disabled></td>
		<td>이름 &nbsp;&nbsp;&nbsp; <input type="text" name="area"
			style="height: 25px; width: 150px" disabled></td>
	</tr>
	<tr>
		<td>직급 &nbsp;&nbsp;&nbsp; <input type="text" name="area"
			style="height: 25px; width: 150px" disabled></td>
		<td>부서 &nbsp;&nbsp;&nbsp; <input type="text" name="area"
			style="height: 25px; width: 150px" disabled></td>
	</tr>
	<tr>
	<td>시작일 <input type="text" name="start_vacation"  id="getdate" class="datepicker"></td>
    <td>종료일 <input type="text" name="end_vacation" id="setdate"  class="datepicker"> <input type="button" id="temp"
						value="등록" style="cursor: pointer" /></td>

	</tr>

</table>


<br>
<br>
<br>
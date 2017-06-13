<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>

</head>
<body>
	
	<br>
	<div data-role="content" data-position="fixed">
		<table class="table table-bordered" border="1">
			<tr>
				<th>이름</th>
				<th>부서</th>
				<th>직급</th>
			</tr>



			<c:forEach items="${list}" var="SnsVO">
				<tr>
					<td><a
						href='/sns/chat_room?emp_id=${emp_id}&n_emp_id=${SnsVO.emp_id}'>
							${SnsVO.emp_nm}</a></td>
					<td>${SnsVO.dept_nm}</td>
					<td>${SnsVO.pos_nm}</td>
				</tr>
			</c:forEach>

		</table>
</div>
		<!-- /.box-body -->
		<div data-role="footer" >
			<h2></h2>
		</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<link rel="stylesheet"
	href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<%@ include file="../include/header.jsp"%>

<%@ include file="../sidebar/approval_sidebar.jsp"%>


<!-- Main content -->


<div class="row">
	<!-- left column -->
	<div class="col-md-12">
		<!-- general form elements -->


		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">나의 근태 기록</h3>
			</div>
			<div class="box-body">
				<h3>${emp_InfoVO.emp_nm} ${emp_InfoVO.pos_nm}</h3>
				<table class="table table-bordered">
					<tr>
						<th>근무일</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
					</tr>

					<c:forEach items="${list}" var="attendanceVO">

						<tr>
							<td>${attendanceVO.att_dt}</td>
							<td>${attendanceVO.att_time}</td>
							<td>${attendanceVO.lev_time}</td>
						</tr>

					</c:forEach>

				</table>
			</div>
			<!-- /.box-body -->
			<div class="box-footer"></div>
			<!-- /.box-footer-->
		</div>
	</div>
	<!--/.col (left) -->

</div>
<!-- /.row -->                   

<!-- /.content -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>




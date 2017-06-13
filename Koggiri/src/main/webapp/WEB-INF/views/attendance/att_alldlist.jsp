<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->


<script type="text/javascript" src="/resources/js/approval.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css">
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<%@ include file="../include/header.jsp"%>


<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu10.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/main">홈</a> <span> &gt; </span> <strong>근태확인</strong></span>
			</div>
		</div>


		<div id="lnb">
			<div class="lnb01">
				<strong class="menu05"><span>관리자</span></strong>
				<ul>
					<li class="menu02 "><a href="#">사원관리</a>
						<ul>
							<li class="sub01 "><a href="/admin_emp/manager">사원등록</a></li>
							<li class="sub01 "><a href="#">인사이동</a></li>
							<li class="sub01 "><a href="#">사원정보 추가/변경</a></li>
							<li class="sub01 "><a href="#">퇴사</a></li>
							<ul></ul>
						</ul></li>
						<li class="menu02 "><a href="/attendance/att_alldlist">근태확인</a>
						<ul>
							<li class="sub01 "><a href="/attendance/att_mlist">월 근태내역</a></li>
							<li class="sub01 "><a href="/attendance/att_alldlist">일 근태내역</a></li>
							<li class="sub01 "><a href="#">휴가등록</a></li>

							<ul></ul>
						</ul></li>
				</ul>
			</div>
		</div>

		<div id="sub_content" align="center">
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->


					<div class="box" align="left">
						<div class="box-header with-border">
							현재일 : ${ att_day } <br>
						</div>
						<div class='box-body'>
							조회일: <input type="text" name="att_dd" id="att_dd"
								class="datepicker" size="14">
							<button id='searchBtn'>Search</button>
						</div>
						<div class="box-body">
							<h3></h3>
							<table class="table table-bordered">

								<tr>
									<th>사번</th>
									<th>사원</th>
									<th>부서</th>
									<th>직급</th>
									<th>출근시간</th>
									<th>퇴근시간</th>
								</tr>

								<c:forEach items="${alldlist}" var="attendanceVO">
									<tr>
										<td>${attendanceVO.emp_id}</td>
										<td>${attendanceVO.emp_nm}</td>
										<td>${attendanceVO.dept_nm}</td>
										<td>${attendanceVO.pos_nm}</td>
										<td>${attendanceVO.att_time}</td>
										<td>${attendanceVO.lea_time}</td>
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
		</div>
	</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>

		<script>
			$(document).ready(
				function() {
					$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "att_alldlist"
							+ "?att_dd=" + $('#att_dd').val();
		
						});
		
				});
		</script>
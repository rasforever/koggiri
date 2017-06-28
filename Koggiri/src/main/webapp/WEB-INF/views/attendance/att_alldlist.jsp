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
<script type="text/javascript">
	$(document).ready(function() {
		$('.aut').click(function(event) {
			event.preventDefault();
			var mem_aut_cd = '${mem_aut_cd}';
			var ck_emp_id = '${mem_id}';
			if (mem_aut_cd == 'A' && ck_emp_id =='master') {
				location.href = "../admin_emp/authority";
			} else {
				alert("접근 권한이 없습니다.");
			}
		});
	});
</script>

<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu12.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/main">홈</a> <span> &gt; </span> <a
					href="/attendance/att_alldlist">근태관리</a> <span> &gt; </span> <strong>일
						근태내역</strong></span>
			</div>
		</div>


		<div id="lnb">
			<div class="lnb01">
				<strong class="menu05"><span>회사 정보</span></strong>
				<ul>
					<li class="menu01 "><a href="/admin_emp/manager">사원관리</a>
						<ul>
							<li class="sub01 "><a href="/admin_emp/manager"> 사원관리</a></li>
							<li class="sub01 "><a href="/admin_emp/perApp"> 인사이동내역</a></li>
							<li class="sub01 "><a href="/admin_emp/resApp"> 퇴직내역</a></li>
							<li class="aut "><a href="/admin_emp/authority"> 권한부여</a></li>
						</ul></li>
					<li class="menu02 "><a href="/attendance/att_alldlist">근태관리</a>
						<ul>
							<li class="sub01 "><a href="/attendance/att_mlist">월
									근태내역</a></li>
							<li class="sub01 "><a href="/attendance/att_alldlist">일
									근태내역</a></li>
							<li class="sub01 "><a href="/attendance/att_vactionlist ">휴가내역</a></li>
							<li class="sub01 "><a href="/attendance/att_registVaction">휴가등록</a></li>

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
						<br>
						<div class='box-body'>
							조회일: <input type="text" name="att_dd" id="att_dd"
								class="datepicker" size="14">
							<button id='searchBtn'>Search</button>
						</div>
						<br>
						<br>
						<div class="box-body">
							<h3></h3>
							<table class="table table-bordered" >

								<tr>
									<th style="text-align: center" >사번</th>
									<th style="text-align: center">사원</th>
									<th style="text-align: center">부서</th>
									<th style="text-align: center">직급</th>
									<th style="text-align: center">출근시간</th>
									<th style="text-align: center">퇴근시간</th>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css">
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<%@ include file="../include/header.jsp"%>


<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu12.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/main">홈</a> <span> &gt; </span> <a href="/attendance/att_alldlist">근태확인</a>  <span> &gt; </span> <strong>내 근태기록</strong></span>
			</div>
		</div>


		<div id="lnb">
   <div class="lnb01">
      <strong class="menu05"><span>회사 정보</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="/admin_emp/manager">사원관리</a>
                    <ul> </ul>
                </li>
      						<li class="menu02 "><a href="/attendance/att_alldlist">근태확인</a>
						<ul>
							<li class="sub01 "><a href="/attendance/att_mlist">월 근태내역</a></li>
							<li class="sub01 "><a href="/attendance/att_alldlist">일 근태내역</a></li>
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
				<h3 class="box-title">나의 근태 기록</h3><br>
			</div>
			<div class="box-body">
				<h3>${einfo.emp_nm} ${einfo.pos_nm}</h3>
				<table class="table table-bordered">
					<tr>
						<th style="text-align: center">근무일</th>
						<th style="text-align: center">출근시간</th>
						<th style="text-align: center">퇴근시간</th>
					</tr>

					<c:forEach items="${list}" var="attendanceVO">

						<tr>
							<td>${attendanceVO.att_dt}</td>
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

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>







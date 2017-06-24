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

<script>
	$(function() {
		$(".datepicker1").datepicker({
			altField : '#att_st_dt',
			dateFormat : "yy/mm/dd",
			minDate : 0
		});
		$(".datepicker2").datepicker({
			altField : '#att_ed_dt',
			dateFormat : "yy/mm/dd",
			minDate : 0
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
					href="/attendance/att_alldlist">근태확인</a> <span> &gt; </span> <strong>휴가내역</strong></span>
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
							<li class="sub01 "><a href="/admin_emp/authority"> 권한부여</a></li>
						</ul></li>
					<li class="menu02 "><a href="/attendance/att_alldlist">근태확인</a>
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
						<div class="box-body">
							<h3></h3>

							<table class="att_registVacation" style="margin-bottom: 0px;">
								<tr>
									<th style="text-align: center">사번</th>
									<th style="text-align: center"> 이름</th>
									<th style="text-align: center">부서</th>
									<th style="text-align: center">직급</th>
									<th style="text-align: center">휴가일</th>
								</tr>
							</table>
							<div class="att_registVacation_t"
								style="width: 970px; height: 300px; overflow: auto;">
								<table id="att_Vacationlist_table" style="table-layout: fixed;">
									<!-- 밑에는 내용 뿌려줄것 -->
									<c:set var="n" value="0" />
									<c:forEach var="Att_EmpVO" items="${list }">
										<tr align="center">
											<td><a href="/attendance/att_deleteVact?v_emp_id=${Att_EmpVO.emp_id}&vat_dt=${Att_EmpVO.vat_dt}">${Att_EmpVO.emp_id }</td>
											<td>${Att_EmpVO.emp_nm }</td>
											<td>${Att_EmpVO.dept_nm }</td>
											<td>${Att_EmpVO.pos_nm }</td>
											<td>${Att_EmpVO.vat_dt }</td>
										</tr>
										<c:set var="n" value="${n+1}" />
									</c:forEach>
								</table>
							</div>
							
							
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
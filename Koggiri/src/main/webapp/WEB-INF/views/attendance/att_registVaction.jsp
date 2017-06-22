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
					href="/attendance/att_alldlist">근태확인</a> <span> &gt; </span> <strong>일
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
						</ul></li>
					<li class="menu02 "><a href="/attendance/att_alldlist">근태확인</a>
						<ul>
							<li class="sub01 "><a href="/attendance/att_mlist">월
									근태내역</a></li>
							<li class="sub01 "><a href="/attendance/att_alldlist">일
									근태내역</a></li>
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
									<th>사번</th>
									<th>이름</th>
									<th>부서</th>
									<th>직급</th>
								</tr>
							</table>
							<div class="att_registVacation_t"
								style="width: 970px; height: 300px; overflow: auto;">
								<table id="att_registVacation_table" style="table-layout: fixed;">
									<!-- 밑에는 내용 뿌려줄것 -->
									<c:set var="n" value="0" />
									<c:forEach var="Att_EmpVO" items="${list }">
										<tr align="center">
											<td><a href='javascript:getVal("${n}");'>${Att_EmpVO.emp_id }</td>
											<td>${Att_EmpVO.emp_nm }</td>
											<td>${Att_EmpVO.dept_nm }</td>
											<td>${Att_EmpVO.pos_nm }</td>
										</tr>
										<c:set var="n" value="${n+1}" />
									</c:forEach>
								</table>
							</div>
							<form id="att_registVaction" action="att_registVaction"
								method="post">
								<table id="resign_table">
									<input type="hidden" id="emp_id" name="emp_id" value="">
									<tr>
										<td>사번 &nbsp;&nbsp;&nbsp; <input type="text" name="emp"
											id="emp"
											style="height: 25px; width: 150px; margin-right: 60px"
											disabled></td>
										<td>이름 &nbsp;&nbsp;&nbsp; <input type="text" id="emp_nm"
											name="emp_nm" style="height: 25px; width: 150px" disabled></td>
									</tr>
									<tr>
										<td>직급 &nbsp;&nbsp;&nbsp; <input type="text" id="dept_nm"
											name="dept_nm" style="height: 25px; width: 150px" disabled></td>
										<td>부서 &nbsp;&nbsp;&nbsp; <input type="text" id="pos_nm"
											name="pos_nm" style="height: 25px; width: 150px" disabled></td>
									</tr>
									<tr>
										<td>시작일 <input type="text" name="att_st_dt"
											id="att_st_dt" class="datepicker1"></td>
										<td>종료일 <input type="text" name="att_ed_dt"
											id="att_ed_dt" class="datepicker2"> <input
											type="submit" id="temp" value="등록" style="cursor: pointer" /></td>

									</tr>

								</table>
							</form>
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

<script type="text/javascript">
	var tr = $("#att_registVacation_table tr");
	var td_id = [];
	var td_name = [];
	var td_dept = [];
	var td_pos = [];
	for (var i = 0; i < tr.length; i++) {
		var temp = $("td", tr.eq(i));
		var tempArr_id = [];
		var tempArr_name = [];
		var tempArr_dept = [];
		var tempArr_pos = [];
		tempArr_id.push(temp.eq(0).text());
		tempArr_name.push(temp.eq(1).text());
		tempArr_dept.push(temp.eq(2).text());
		tempArr_pos.push(temp.eq(3).text());
		td_id[i] = tempArr_id;
		td_name[i] = tempArr_name;
		td_dept[i] = tempArr_dept;
		td_pos[i] = tempArr_pos;
	}
	var getVal = function(key) {
		var id = td_id[key];
		var name = td_name[key];
		var dept = td_dept[key];
		var pos = td_pos[key];
		$('#emp_id').val(id);
		$('#emp').val(id);
		$('#emp_nm').val(name);
		$('#dept_nm').val(dept);
		$('#pos_nm').val(pos);

		return false;
	};
</script>

<!-- 본문 끝 -->

<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>
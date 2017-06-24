<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="side.jsp"%> --%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu11.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/main">홈</a> <span> &gt; </span> <a href="#">사원관리</a>
					<span> &gt; </span> <strong>권한부여</strong></span>
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

							<table class="att_authority" style="margin-bottom: 0px;">
								<tr>
									<th style="text-align: center">사번</th>
									<th style="text-align: center">이름</th>
									<th style="text-align: center">부서</th>
									<th style="text-align: center">직급</th>
									<th style="text-align: center">등급</th>
								</tr>
							</table>
							<div class="att_registVacation_t"
								style="width: 970px; height: 300px; overflow: auto;">
								<table id="att_authority_table" style="table-layout: fixed;">
									<!-- 밑에는 내용 뿌려줄것 -->
									<c:set var="n" value="0" />
									<c:forEach var="EmpVO" items="${list }">
										<tr align="center">
											<td><a href='javascript:getVal("${n}");'>${EmpVO.emp_id }</td>
											<td>${EmpVO.emp_nm }</td>
											<td>${EmpVO.dept_nm }</td>
											<td>${EmpVO.pos_nm }</td>
											<td>${EmpVO.mem_aut_cd }</td>
										</tr>
										<c:set var="n" value="${n+1}" />
									</c:forEach>
								</table>
							</div>

							<form id="authority" action="authority" method="post">
								<br> <br>
								<h2 style="font-size: 20px">권한 부여</h2>
								<br> <br>
								<table id="authority_table">
									<input type="hidden" id="emp_id" name="emp_id" value="">
									<tr>
										<th style="width: 150px; text-align: center">사번</th>
										<td><input type="text" name="emp" id="emp"
											style="height: 25px;" disabled></td>
										<th style="width: 150px; text-align: center">이름</th>
										<td><input type="text" id="emp_nm" name="emp_nm"
											style="height: 25px;" disabled></td>
									</tr>
									<tr>
										<th style="width: 150px; text-align: center">직급</th>
										<td><input type="text" id="dept_nm" name="dept_nm"
											style="height: 25px;" disabled></td>
										<th style="width: 150px; text-align: center">부서</th>
										<td><input type="text" id="pos_nm" name="pos_nm"
											style="height: 25px;" disabled></td>
									</tr>
									<tr>
										<th style="width: 150px; text-align: center">권한등급</th>
										<td colspan=3><select id="mem_aut_cd" name="mem_aut_cd">
												<c:forEach items="${memlist}" var="memactVO">
													<option value="${memactVO.mem_aut_cd }">${memactVO.mem_aut_cd }
													</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td colspan="4"><input type="submit" id="temp" value="등록"
											style="cursor: pointer; width: 100px; height: 40px" /></td>
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
	var tr = $("#att_authority_table tr");
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


<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>
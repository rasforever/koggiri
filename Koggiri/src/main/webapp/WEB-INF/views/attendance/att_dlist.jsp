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
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <strong>근태확인</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu05"><span>회사 정보</span></strong>
      <ul>
                <li class="menu02 ">
                    <a href="/chart/listAll">근태확인</a>
                    <ul>
                      <li class="sub01 "><a href="/chart/list?dept_id=MM">근태확인</a></li>
    					<ul></ul>
                    </ul>
                </li>
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
	</div>
</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>







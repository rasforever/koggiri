<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Koggiri</title>

<!-- script link -->

<script type="text/javascript"
	src="../resources/Scripts/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../resources/Scripts/ui.js"></script>
<script type="text/javascript"
	src="../resources/Scripts/jquery-ui-min.js"></script>
<script type="text/javascript"
	src="../resources/Scripts/jquery.easing.1.3.js"></script>
	
<!--  approval -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">	
<!--  approval -->

<!--  css link -->
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon"
	href="http://s.nx.com/S2/billing/pcbang/real/common/favicon.ico" />
<link rel="stylesheet"
	href="../resources/Content/themes/real/ui_main.css" />
<link rel="stylesheet"
	href="../resources/Content/themes/real/common.css" />

</head>
<!-- ----------------------------------------------------------------------- -->

<!-- ----------------------------------------------------------------------- -->




	<!-- ************************************* -->
	<h1 class="hidden">Koggiri 메인 페이지</h1>
	<div class="header_wrap">
		<div id="container">
			<div class="my_information">
				<a class="my_name">${emp_nm} 님이 접속하셨습니다.</a> │ <a class="my_modify"
					href="../login/passcheck">내 정보 수정</a> │ <a class="log_out"
					href="../login/logout">로그아웃</a>
			</div>
			<!-- skipNavi : s -->
			<div id="skipNavi">
				<a href="#header">주메뉴 바로가기</a><a href="#container">본문 바로가기</a>
			</div>
			<!-- skipNavi : e -->

			<!-- header : s -->
			<div id="header">
				<div class="logo" style="padding-top: 13px;">
					<a class="back_for_main" href="#"><img
						src="../resources/img/koggiri.PNG" style="width: 200px;"><span
						class="hidden">코끼리 로고</span></a>
				</div>
				<div class="gnb">
					<ul>
						<!-- 1depth : s -->
						<li class="menu01 "><a href="#" class="menu_a"
							style="padding-top: 10px;">공지</a> <!-- 2depth : s -->
							<ul>
								<li class=""><a href="sub_notice.jsp">공지 사항</a></li>
								<li class=""><a href="#">알립니다</a></li>
							</ul></li>
						<!-- 1depth : s -->
						<li class="menu02 "><a href="#" class="menu_a"
							style="padding-top: 10px;">전자문서</a> <!-- 2depth : s -->
							<ul>
								<li class=""><a href="../task/list">업무 보고</a></li>
								<li class=""><a href="../approval/lists">전자 결제</a>
									<div>
										<span><img
											src="http://s.nx.com/S2/billing/pcbang/real/homepage/common/img_depth3_arrow.png"
											alt="" /></span>
										<ul>
											<li class=""><a href="../approval/lists">보낸 결재</a></li>
											<li class=""><a href="../approval/listr">받은 결재</a></li>
											<li class=""><a href="../approval/register">결재 입력</a></li>
										</ul>
									</div></li>
								<li class=""><a href="../document/list">문서함</a></li>
							</ul></li>
						<!-- 1depth : s -->
						<li class="menu03 "><a href="#" class="menu_a"
							style="padding-top: 10px;">일정</a> <!-- 2depth : s -->
							<ul>
								<li class=""><a href="calendar">일정</a></li>
							</ul></li>
						<!-- 1depth : s -->
						<li class="menu04 "><a href="#" class="menu_a"
							style="padding-top: 10px;">메일</a> <!-- 2depth : s -->
							<ul>
								<li class=""><a href="sub_mail.jsp">메일쓰기</a></li>
								<li class=""><a href="#">메일함</a>
									<div>
										<span><img
											src="http://s.nx.com/S2/billing/pcbang/real/homepage/common/img_depth3_arrow.png"
											alt="" /></span>
										<ul>
											<li class=""><a href="#">받은 메일함</a></li>
											<li class=""><a href="#">보낸 메일함</a></li>
										</ul>
									</div></li>
							</ul></li>
						<li class="menu05 "><a href="#" class="menu_a"
							style="padding-top: 10px;">회사정보</a> <!-- 2depth : s -->
							<ul>
								<li class=""><a href="sub_information.jsp">Koggiri란?</a></li>
								<li class=""><a href="../chat/list">조직도</a></li>
							</ul></li>

					</ul>
				</div>
			</div>
		</div>
		<hr />
	</div>





	<!-- <script type="text/javascript" src="resources/Scripts/common.js"></script> -->
	<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script> -->

	<!-- <script type="text/javascript" src="resources/Scripts/common.js"></script> -->
	<!-- <script src="http://js.nx.com/s1/da/playlog.min.js" type="text/javascript"></script> -->

	<!-- <script type="text/javascript" src="Scripts/common.formatNumber-1.0.0.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.unobtrusive.min.js"></script> -->
	<!-- <script type="text/javascript" src="Scripts/jquery-ui.min.js"></script> -->
	<!-- <script type="text/javascript" src="Scripts/jquery.bxslider.min.js"></script> -->
	<!-- <script type="text/javascript" src="Scripts/jquery.paging.min.js"></script> -->
	<!-- <script type="text/javascript" src="Scripts/ajaxOverSsl.js"></script> -->
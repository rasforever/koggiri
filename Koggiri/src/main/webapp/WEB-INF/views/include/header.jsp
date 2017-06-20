<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<!--  css link -->
<link rel="stylesheet"
	href="../resources/Content/themes/real/ui_sub.css" />
<link href="../resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon"
	href="http://s.nx.com/S2/billing/pcbang/real/common/favicon.ico" />
<link rel="stylesheet"
	href="../resources/Content/themes/real/ui_main.css" />
<link rel="stylesheet"
	href="../resources/Content/themes/real/common.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$('.admin_page').click(function(event) {
			event.preventDefault();
			var mem_aut_cd = '${mem_aut_cd}';
			if (mem_aut_cd == 'A') {
				location.href = "../admin_emp/manager";
			} else {
				alert("넌 아웃이야 관리자 아님!케케켘케");
			}
		});
	});
</script>
</head>

<!-- ----------------------------------------------------------------------- -->
<body class="main">


	<!-- ************************************* -->
	<h1 class="hidden">Koggiri 메인 페이지</h1>
	<div class="header_wrap">
		<div id="container">
			<div class="my_information">

				<a href="javascript:;"
					onclick="window.open('../msg/msg_emplist','count_button','width=500, height=640, toolbar=no, menubar=no, scrollbars=no, resizable=no')"><img
					src="../resources/img/msg_check_.png">${msg_count}</a> │ <a
					class="my_name">${emp_nm} 님이 접속하셨습니다.</a> │ <a class="my_modify"
					href="../login/passcheck">내 정보 수정</a> │ <a class="log_out"
					href="../login/logout" >로그아웃</a>
			</div>
			<!-- skipNavi : s -->
			<div id="skipNavi" >

				<a href="#header">주메뉴 바로가기</a><a href="#container">본문 바로가기</a>
			</div>
			<!-- skipNavi : e -->

			<!-- header : s -->
			<div id="header" >
				<div class="logo" style="padding-top: 13px;">
					<a class="back_for_main" href="/"><img
						src="../resources/img/koggiri.PNG"
						style="width: 200px; position: relative; top: -20px;"><span
						class="hidden">코끼리 로고</span></a>
				</div>
				<div class="gnb">
					<ul>
						<!-- 1depth : s -->
						<li class="menu01 "><a href="#" class="menu_a"
							style="padding-top: 10px;">공지</a> <!-- 2depth : s -->
							<ul>
								<li class=""><a href="../noticeboard/listPage">공지 사항</a></li>
								<li class=""><a href="../importantboard/listPage">알립니다</a></li>
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
								<li class=""><a href="../calendar/index">일정</a></li>
							</ul></li>
						<!-- 1depth : s -->
						<li class="menu04 "><a href="#" class="menu_a"
							style="padding-top: 10px;">회의</a> <!-- 2depth : s -->
							<ul>
								<li class=""><a href="/imageRoom/list">그림 회의</a></li>
								<li class=""><a href="#">화상 회의</a>
							</ul></li>
						<li class="menu05 "><a href="#" class="menu_a"
							style="padding-top: 10px;">회사정보</a> <!-- 2depth : s -->
							<ul>
								<li class="admin_page"><a href="/attendance/att_alldlist">관리자설정</a>
									<div>
										<span><img
											src="http://s.nx.com/S2/billing/pcbang/real/homepage/common/img_depth3_arrow.png"
											alt="" /></span>
										<ul>
											<li class=""><a href="../admin_emp/manager">사원 관리</a></li>
											<li class=""><a href="../attendance/att_alldlist">근태
													확인</a></li>
										</ul>
									</div></li>
								<!-- 일단 여기에 해놨음. -->

								<li class=""><a href="../chart/listAll">조직도</a></li>
							</ul></li>

					</ul>
				</div>
			</div>
		</div>
		<hr />
	</div >
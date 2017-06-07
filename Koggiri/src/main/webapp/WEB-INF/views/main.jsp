

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance();

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);

	} else {

	}
	//년도/월 셋팅
	cal.set(year, month, 1);

	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="resources/Content/themes/real/cal.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="robots" content="index,follow" />
<meta name="subject" content="NEXON PC방 홈페이지에 오신것을 환영합니다." />
<meta name="author" content="NEXON Networks" />
<meta name="keywords" content="NEXON PC방, NEXON, PC방 " />
<meta name="copyright" content="copyrights 2011 NEXON Networks" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Koggiri</title>


<script type="text/javascript"
	src="resources/Scripts/jquery-1.11.2.min.js"></script>
<!-- <script type="text/javascript" src="Scripts/jquery-ui.min.js"></script> -->
<script type="text/javascript"
	src="resources/Scripts/jquery.easing.1.3.js"></script>
<!-- <script type="text/javascript" src="Scripts/jquery.bxslider.min.js"></script> -->
<!-- <script type="text/javascript" src="Scripts/jquery.paging.min.js"></script> -->
<!-- <script type="text/javascript" src="Scripts/ajaxOverSsl.js"></script> -->
<script type="text/javascript" src="resources/Scripts/common.js"></script>
<!-- <script type="text/javascript" src="Scripts/common.formatNumber-1.0.0.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.unobtrusive.min.js"></script> -->
<link rel="shortcut icon" type="image/x-icon"
	href="http://s.nx.com/S2/billing/pcbang/real/common/favicon.ico" />
<link rel="stylesheet" href="resources/Content/themes/real/ui_main.css" />
<script src="http://js.nx.com/s1/da/playlog.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="resources/Scripts/ui.js"></script>
<link href="resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
</head>

<body class="main">
	<div id="main_header">
		<jsp:include page="header.jsp" />
	</div>

	<!-- 본문 시작 -->

	<h2 class="hidden">본문</h2>
	<div class="container_wrap">
		<!-- container : s -->

		<div id="container">

			<div id="wrap">
				<!-- ************************************* -->

			</div>
			<hr />
			<div id="content">
				<div class="service">

					<h3 class="hidden">고객센터</h3>

					<!-- ************************************* -->
					<div class="customer_center">

						<ul>
							<li><a href="#"> ${mem_id}</a></li>
						</ul>
						<ul>
							<li><a href="#">사진</a></li>
						</ul>
						<ul>
							<li><a href="#">${empVO.emp_nm}</a></li>
						</ul>
						<ul>
							<li><a href="#">${empVO.pos_nm }</a></li>
						</ul>
						<ul>
							<li><a href="#">${empVO.dept_nm }</a></li>
						</ul>
						<ul>
							<li><a href="#">${empVO.tel_no }</a></li>
						</ul>

						<ul>
							<li><a href="#">를 불러와야 합니다.^^*</a></li>
						</ul>
					</div>
					<!-- ************************************* -->

					<div class="remote_support"
						style="width: 226px; height: 206px; background: white;"
						align="center">

						<input type="submit" class="on_btn" value=""
							style="margin: 20px 0px 5px 0px;"> <input type="submit"
							class="off_btn" value="" style="margin: 7px;"> <input
							type="submit" value="근태확인"
							style="width: 120px; height: 35px; border: 0px; background: gray; margin: 7px;">
					</div>

					<h3 class="hidden">고객센터</h3>
					<div class="event_apply">
						<a href="/Promotion/Event/Ing"><span>이벤트신청 진행 중인 이벤트를
								확인 및 신청하실 수 있습니다.</span></a>
					</div>
					<hr />

					<div class="notice">
						<img src="resources/img/notice_t.png" style="margin-bottom: 10px">
						<ul>

							<li><a href="/HelpDesk/Notify/Detail?sn=2456">서든어택 네트워크
									공격 행위(일명 ‘누킹’) 66차~69차 대응 안내 <img
									src="http://s.nx.com/S2/billing/pcbang/real/homepage/ico/ico_new.gif"
									alt="새글" />
							</a><span>2017-05-29</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2455">테일즈런너
									넥슨PC방 서비스 종료 안내</a><span>2017-05-22</span></li>


							<li><a href="/HelpDesk/Notify/EventDetail?sn=484">서든어택
									PC방 대회 06월 대상 매장</a><span>2017-05-17</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2454">(완료)
									05/09(화) 가상계좌 결제 서비스 오류 안내(수정)</a><span>2017-05-09</span></li>

						</ul>
						<span class="more"><a href="/HelpDesk/Notify"><img
								src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_more.gif"
								alt="더보기" /></a></span>
					</div>

					<h3 class="hidden">받은 메일함</h3>
					<div class="notice">
						<img src="resources/img/receive_mail.png"
							style="margin-bottom: 10px">
						<ul>

							<li><a href="/HelpDesk/Notify/Detail?sn=2456">서든어택 네트워크
									공격 행위(일명 ‘누킹’) 66차~69차 대응 안내 <img
									src="http://s.nx.com/S2/billing/pcbang/real/homepage/ico/ico_new.gif"
									alt="새글" />
							</a><span>2017-05-29</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2455">테일즈런너
									넥슨PC방 서비스 종료 안내</a><span>2017-05-22</span></li>


							<li><a href="/HelpDesk/Notify/EventDetail?sn=484">서든어택
									PC방 대회 06월 대상 매장</a><span>2017-05-17</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2454">(완료)
									05/09(화) 가상계좌 결제 서비스 오류 안내(수정)</a><span>2017-05-09</span></li>

						</ul>
						<span class="more"><a href="/HelpDesk/Notify"><img
								src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_more.gif"
								alt="더보기" /></a></span>
					</div>
					<div class="game_play">
						<a href="/MyPC/Usage/ChargeHistory"><span>게임이용조회 게임 이용
								내역을 확인하실 수 있습니다.</span></a>
					</div>
				</div>


			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$('.main #content div>a').on({
						mouseenter : function() {
							$(this).stop().animate({
								'top' : '-206px'
							}, 500, "easeInOutCubic");
						},
						mouseleave : function() {
							$(this).stop().animate({
								'top' : '0px'
							}, 500, "easeInOutCubic");
						},
					});
				});
			</script>
			<div class="weather">
				<input type="text" value="날씨 api 가져오기"
					style="position: relative; bottom: 669px;">
			</div>
			<div class="calendar_main">
				<form name="calendarFrm" id="calendarFrm" action="" method="post">
					<div class="cal_all">

						<div class="cal_top">

							<!--날짜 네비게이션  -->
							<table class="table_top">
								<tr>
									<td align="center"><%=year%>년 <%=month + 1%>월</td>
								</tr>
							</table>
						</div>
						<div class="cal_content">
							<table class="table_content" border="0" cellspacing="1"
								cellpadding="1" bgcolor="#FFFFFF">
								<THEAD>
									<TR bgcolor="#EEF1F2">
										<TD>
											<DIV align="center">
												<font color="red">일</font>
											</DIV>
										</TD>
										<TD>
											<DIV align="center">월</DIV>
										</TD>
										<TD>
											<DIV align="center">화</DIV>
										</TD>
										<TD>
											<DIV align="center">수</DIV>
										</TD>
										<TD>
											<DIV align="center">목</DIV>
										</TD>
										<TD>
											<DIV align="center">금</DIV>
										</TD>
										<TD>
											<DIV align="center">
												<font color="#529dbc">토</font>
											</DIV>
										</TD>
									</TR>
								</THEAD>
								<TBODY>
									<TR>
										<%
											String color = "#000000";
											//처음 빈공란 표시
											for (int index = 1; index < start; index++) {
												out.println("<TD >&nbsp;</TD>");
												newLine++;
											}

											for (int index = 1; index <= endDay; index++) {

												if (newLine == 0) {
													color = "RED";
												} else if (newLine == 6) {
													color = "#529dbc"; //파랑색
												} else {
													color = "BLACK";
												} ;

												String sUseDate = Integer.toString(year);

												sUseDate += Integer.toString(month + 1).length() == 1
														? "0" + Integer.toString(month + 1)
														: Integer.toString(month + 1);
												sUseDate += Integer.toString(index).length() == 1
														? "0" + Integer.toString(index)
														: Integer.toString(index);

												int iUseDate = Integer.parseInt(sUseDate);

												String backColor = "#F9F9F9";

												if (iUseDate == intToday) {
													backColor = "#2D0087";
													color = "#ffffff";
												}
												out.println("<TD bgcolor='" + backColor + "' nowrap>");
										%>
										<font color='<%=color%>'> <%=index%>
										</font>

										<%
											//기능 제거	
												out.println("</TD>");
												newLine++;

												if (newLine == 7) {
													out.println("</TR>");
													if (index <= endDay) {
														out.println("<TR>");
													}
													newLine = 0;
												}
											}
											//마지막 공란 LOOP
											while (newLine > 0 && newLine < 7) {
												out.println("<TD>&nbsp;</TD>");
												newLine++;
											}
										%>
									</TR>

								</TBODY>
							</TABLE>
						</div>
					</div>
				</form>
			</div>
		</div>
		<hr />

		<!-- 본문 끝 -->
	</div>
	<div id="main_footer">
		<jsp:include page="footer.jsp" />
	</div>

	<script type="text/javascript">
	<!--
		$(document)
				.ready(
						function() {
							$
									.ajax({
										type : "post",
										dataType : "json",
										data : {},
										url : "/Home/FooterGameList",
										success : function(data) {
											var gamelist = "";
											$(".relation_site > ul").empty();

											for (var i = 0; i < data.length; i++) {
												gamelist += "<li><a onclick=\"javascript:goLink('"
														+ data[i].Link
														+ "', '"
														+ data[i].GameName
														+ "');\" title=\"새 창 열림\">"
														+ data[i].GameName
														+ "</a></li>";
											}

											$(".relation_site > ul").append(
													gamelist);
										}
									});

							// 원격 지원 팝업 지원
							$("#lnb a,.gnb a,.sitemap a,.remote_support a")
									.filter(
											function() {
												return $(this).attr("href")
														.toLowerCase() == "/helpdesk/remote";
											})
									.click(
											function() {
												window
														.open("https://113366.com/nexonnetworks");

												return false;
											});

							// Tab 첫번째 항목 Background 없애기
							$('.tab>ul>li:first, .tab3>ul>li:first').css(
									'background', 'none');
						});

		function goLink(link, gameName) {
			$("#linkName").text(gameName);
			$("#linkUrl").attr("href", link);
			$(".relation_site > ul").css("display", "none");
		}

		$("#imgPrivacyAgreement").click(
				function() {
					openPopupFocus("/Home/PrivacyAgreement",
							"PrivacyAgreement", 720, 650, "yes");

					return false;
				});

		$("#imgServiceAgreement").click(
				function() {
					openPopupFocus("/Home/ServiceAgreement",
							"ServiceAgreement", 720, 580, "yes");

					return false;
				});

		$(window).resize(function() {
			var docH = $(document).height();
			$('.faq_wrap').css('height', docH - 100);
			$('.search_result_wrap').css('height', docH - 258);
			$('.search_result, .search_faq_best').css('height', docH - 258);
		}).resize();

		//    $("#btnAlliance").click(function () {
		//        openPopup("/Home/Alliance", "Alliance", 650, 700);

		//        return false;
		//    });

		//    $(".fsGo > a").click(function () {
		//        if ($("#ddlGameLink").val() != "") {
		//            var value = $("#ddlGameLink option:selected").val();
		//            var text = $("#ddlGameLink option:selected").text();
		//            window.open(value).focus();
		//        }

		//        return false;
		//    });
	//-->
	</script>

</body>
</html>
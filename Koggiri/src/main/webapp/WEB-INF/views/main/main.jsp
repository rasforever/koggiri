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


<!-- html start -->
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="robots" content="index,follow" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Koggiri</title>
<!-- script link -->
<!-- 메뉴바 플러그인 js -->
<script type="text/javascript" src="resources/Scripts/jquery-1.11.2.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>


<!--  퀵메뉴 플러그인 js -->
<script type="text/javascript" src="resources/Scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="resources/Scripts/jquery-ui-min.js"></script>



<!-- --------------------------------------------------------------------------------------------------------------- -->
<!-- css link -->
<link href="resources/Content/themes/real/clock.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="resources/Content/themes/real/cal.css" />
<link rel="shortcut icon" type="image/x-icon" href="http://s.nx.com/S2/billing/pcbang/real/common/favicon.ico" />
<link rel="stylesheet" href="resources/Content/themes/real/ui_main.css" />
<link href="resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="resources/Content/themes/real/common.css" />
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

					<h3 class="hidden">마이 페이지</h3>

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
					
					<h3 class="hidden">출,퇴근 근태확인</h3>
					
					<div class="remote_support"
						style="width: 226px; height: 206px; background: white;"
						align="center">

						<input type="submit" class="on_btn" value=""
							style="margin: 20px 0px 5px 0px;"> <input type="submit"
							class="off_btn" value="" style="margin: 7px;"> <input
							type="submit" value="근태확인"
							style="width: 120px; height: 35px; border: 0px; background: gray; margin: 7px;">
					</div>

					<h3 class="hidden">업무</h3>
					<div class="event_apply">
						<a href="#"></a> <!--  업무 리스트로 이동 -->
					</div>
					<hr />

						<h3 class="hidden">공지사항</h3>
					<div class="notice">
						<img src="resources/img/notice_t.png" style="margin-bottom: 10px">
						<ul>

							<li><a href="/HelpDesk/Notify/Detail?sn=2456">공지합니다 <img
									src="http://s.nx.com/S2/billing/pcbang/real/homepage/ico/ico_new.gif"
									alt="새글" />
							</a><span>2017-05-29</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2455"> 공지사항 세션을 넣어주세요</a><span>2017-05-22</span></li>


							<li><a href="/HelpDesk/Notify/EventDetail?sn=484">글번호가 제일 높은 순서대로 나열</a><span>2017-05-17</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2454">하시면 될것 같아요</a><span>2017-05-09</span></li>

						</ul>
						<span class="more"><a href="#"><img src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_more.gif"
								alt="더보기" /></a></span> <!-- + 버튼 누르면 공지사항 리트스 바로가기 -->
					</div>

					<h3 class="hidden">받은 메일함</h3>
					<div class="notice">
						<img src="resources/img/receive_mail.png"
							style="margin-bottom: 10px">
						<ul>

							<li><a href="/HelpDesk/Notify/Detail?sn=2456">받은 메일함 입니다,<img
									src="http://s.nx.com/S2/billing/pcbang/real/homepage/ico/ico_new.gif"
									alt="새글" />
							</a><span>2017-05-29</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2455"> 받은 메일 순서대로 나열</a><span>2017-05-22</span></li>


							<li><a href="/HelpDesk/Notify/EventDetail?sn=484">하시면 될것 같아요</a><span>2017-05-17</span></li>


							<li><a href="/HelpDesk/Notify/Detail?sn=2454">받은 메일 세션을 넣어주세요</a><span>2017-05-09</span></li>

						</ul>
						
						<span class="more"><a href="#"><img src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_more.gif"
								alt="더보기" /></a></span> <!-- + 버튼 누르면 받은 메일함 바로가기  -->
					</div>
					
					<h3 class="hidden">결재</h3>
					<div class="game_play">
						<a href="#"></a> <!-- 결제 리스트로 이동 -->
					</div>
				</div>


			</div>
			<!-- ----------------------------------------------------------------------- -->
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

			<!-- ------------------------------------------------------------------------ -->
			
			<!-- 시계 script -->
			<script type="text/javascript">
				$(document).ready(
						function() {
							// Create two variable with the names of the months and days in an array
							var monthNames = [ "January", "February", "March",
									"April", "May", "June", "July", "August",
									"September", "October", "November",
									"December" ];
							var dayNames = [ "Sunday", "Monday", "Tuesday",
									"Wednesday", "Thursday", "Friday",
									"Saturday" ]

							// Create a newDate() object
							var newDate = new Date();
							// Extract the current date from Date object
							newDate.setDate(newDate.getDate());
							// Output the day, date, month and year   
							$('#Date').html(
									dayNames[newDate.getDay()] + " "
											+ newDate.getDate() + ' '
											+ monthNames[newDate.getMonth()]
											+ ' ' + newDate.getFullYear());

							setInterval(function() {
								// Create a newDate() object and extract the seconds of the current time on the visitor's
								var seconds = new Date().getSeconds();
								// Add a leading zero to seconds value
								$("#sec").html(
										(seconds < 10 ? "0" : "") + seconds);
							}, 1000);

							setInterval(function() {
								// Create a newDate() object and extract the minutes of the current time on the visitor's
								var minutes = new Date().getMinutes();
								// Add a leading zero to the minutes value
								$("#min").html(
										(minutes < 10 ? "0" : "") + minutes);
							}, 1000);

							setInterval(function() {
								// Create a newDate() object and extract the hours of the current time on the visitor's
								var hours = new Date().getHours();
								// Add a leading zero to the hours value
								$("#hours").html(
										(hours < 10 ? "0" : "") + hours);
							}, 1000);
						});
			</script>

			<!-- ------------------------------------------------------------------------------------------- -->
			
			<div class="weather">
			<!--  이곳에 api 적용하면 됩니다 -->
				<input type="text" value="날씨 api 가져오기" style="position: relative; bottom: 669px;">
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
												}
												;

												String sUseDate = Integer.toString(year);

												sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
														: Integer.toString(month + 1);
												sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
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
			<div class="clock">
				<div id="Date"></div>

				<br>
				<div id="clock_c">
					<label id="hours"></label> <label id="point">:</label> <label
						id="min"></label> <label id="point">:</label> <label id="sec"></label>
				</div>


			</div>

		</div>


		<hr />

		<!-- 본문 끝 -->
	</div>
	<div id="main_footer">
		<jsp:include page="footer.jsp" />
	</div>


</body>
</html>




<!-- <script type="text/javascript" src="resources/Scripts/ui.js"></script> -->
<!-- <script type="text/javascript" src="resources/Scripts/common.js"></script> -->
<!-- <script src="http://js.nx.com/s1/da/playlog.min.js" type="text/javascript"></script> -->
 <<!-- script type="text/javascript" src="Scripts/common.formatNumber-1.0.0.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script >
<script type="text/javascript" src="Scripts/jquery.validate.unobtrusive.min.js"></script>

 <script type="text/javascript" src="Scripts/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.paging.min.js"></script>
<script type="text/javascript" src="Scripts/ajaxOverSsl.js"></script> -->

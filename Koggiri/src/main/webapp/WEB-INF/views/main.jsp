
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

<%@ include file="include/header.jsp"%>
<link href="../resources/Content/themes/real/clock.css" rel="stylesheet"
   type="text/css" />
<link type="text/css" rel="stylesheet"
   href="../resources/Content/themes/real/cal.css" />

<script type="text/javascript">
   $(document).ready(
         function() {
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
            window.open('http://localhost:8081/sns/listAll', 'Javis',
                  "width:550px, height=640px, resizable=no, scrollbars=yes")
         });
</script>

<!-- ------------------------------------------------------------------------ -->

<!-- 본문 시작 -->
<!-- 본문 시작 -->
<div class="container_wrap" style="background-color: #eef1f2;">
   <div id="container" style="height: 700px; padding-top: 40px;">


      <div id="wrap">
         <!-- ************************************* -->

      </div>
      <hr />
      <div id="content">
         <div class="service">

            <h3 class="hidden">마이 페이지</h3>

            <!-- ************************************* -->
            <div class="customer_center">
               <div class="customer_img">
                  <label
                     style="font-size: 30px; color: white;">사진크기 <br> 150 * 180</label>
               </div>
               <div class="customer_info">
                  <ul
                     style="position: relative; left: 255px; top: -143px; height: 0px; width: 469px; font-size: 17px; font-weight: bold;">


                     <li><a><strong>${mem_id}</strong></a></li>
                     <br>
                     <li><a><strong style="font-size: 20px">${empVO.dept_nm }</strong></a></li>
                     <li><a>${empVO.pos_nm } <strong style="font-size: 25px">${empVO.emp_nm}</strong></a></li><br>
                     <li><a><strong>H.P : ${empVO.tel_no }</strong></a></li>
                     <li><a><strong>E.M : ${empVO.tel_no }</strong></a></li>

                  </ul>
               </div>

            </div>

            <!-- ************************************* -->

            <h3 class="hidden">출,퇴근 근태확인</h3>

            <div class="remote_support"
               style="width: 226px; height: 206px; background: white;"
               align="center">
               <form method='post' action='att'>
                  <input type="submit" class="on_btn" id="att_btn" value=""
                     style="margin: 20px 0px 5px 0px;">
               </form>
               <form method='post' action='leave'>
                  <input type="submit" class="off_btn" id="leave_btn" value=""
                     style="margin: 7px;">
               </form>
               <form method='get' action='attendance/att_dlist'>
                  <input type="submit" value="근태확인" class="att_list"
                     style="width: 120px; height: 35px; border: 0px; background: gray; margin: 7px;">
               </form>
            </div>
            <!-- *************************************** -->
            <h3 class="hidden">업무</h3>
            <div class="event_apply">
               <a href="task/list"></a>
               <!--  업무 리스트로 이동 -->
            </div>
            <hr />

            <h3 class="hidden">공지사항</h3>
            <div class="notice">
               <img src="../resources/img/notice_t.png"
                  style="margin-bottom: 10px">
               <ul>
                  <c:forEach items="${list_notice}" var="h_NoticeVO">
                     <li><a href="/noticeboard/readPage?n_ID=${h_NoticeVO.n_id}">
                           ${h_NoticeVO.n_title} <%--    <c:if test="${h_NoticeVO.n_date.substring(0,10) == sysdate}">
                     <img
                        src="http://s.nx.com/S2/billing/pcbang/real/homepage/ico/ico_new.gif"
                        alt="새글" />
                     </c:if> --%>
                     </a><span>${h_NoticeVO.n_date.substring(0,10)}</span></li>


                  </c:forEach>
               </ul>
               <span class="more"><a href="noticeboard/listPage"><img
                     src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_more.gif"
                     alt="더보기" /></a></span>
               <!-- + 버튼 누르면 공지사항 리트스 바로가기 -->
            </div>

            <h3 class="hidden">받은 메일함</h3>
            <div class="notice">
               <img src="../resources/img/receive_mail.png"
                  style="margin-bottom: 10px">
               <ul>

                  <c:forEach items="${list_important}" var="h_ImpartantVO">
                     <li><a
                        href="/importantboard/readPage?i_ID=${h_ImpartantVO.i_id}">
                           ${h_ImpartantVO.i_title} <%--    <c:if test="${h_NoticeVO.n_date.substring(0,10) == sysdate}">
                     <img
                        src="http://s.nx.com/S2/billing/pcbang/real/homepage/ico/ico_new.gif"
                        alt="새글" />
                     </c:if> --%>
                     </a><span>${h_ImpartantVO.i_date.substring(0,10)}</span></li>
                  </c:forEach>
               </ul>

               <span class="more"><a href="#"><img
                     src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_more.gif"
                     alt="더보기" /></a></span>
               <!-- + 버튼 누르면 받은 메일함 바로가기  -->
            </div>

            <h3 class="hidden">결재</h3>
            <div class="game_play">
               <a href="approval/listr"></a>
               <!-- 결제 등록으로 이동 -->
               <!-- 결제 리스트로 이동 -->
            </div>
         </div>


      </div>
      <!-- ----------------------------------------------------------------------- -->


      <!-- 시계 script -->
      <script type="text/javascript">
         $(document)
               .ready(
                     function() {
                        // Create two variable with the names of the months and days in an array
                        var monthNames = [ "January", "February",
                              "March", "April", "May", "June",
                              "July", "August", "September",
                              "October", "November", "December" ];
                        var dayNames = [ "Sunday", "Monday", "Tuesday",
                              "Wednesday", "Thursday", "Friday",
                              "Saturday" ]

                        // Create a newDate() object
                        var newDate = new Date();
                        // Extract the current date from Date object
                        newDate.setDate(newDate.getDate());
                        // Output the day, date, month and year   
                        $('#Date')
                              .html(
                                    dayNames[newDate.getDay()]
                                          + " "
                                          + newDate.getDate()
                                          + ' '
                                          + monthNames[newDate
                                                .getMonth()]
                                          + ' '
                                          + newDate.getFullYear());

                        setInterval(function() {
                           // Create a newDate() object and extract the seconds of the current time on the visitor's
                           var seconds = new Date().getSeconds();
                           // Add a leading zero to seconds value
                           $("#sec")
                                 .html(
                                       (seconds < 10 ? "0" : "")
                                             + seconds);
                        }, 1000);

                        setInterval(function() {
                           // Create a newDate() object and extract the minutes of the current time on the visitor's
                           var minutes = new Date().getMinutes();
                           // Add a leading zero to the minutes value
                           $("#min")
                                 .html(
                                       (minutes < 10 ? "0" : "")
                                             + minutes);
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

      <!-- <div class="container_wrap_main"
   style="background-color: #eef1f2; width: 100%; height: 100%; margin: 0 auto;"> -->
      <div class="weather">
         <!--  이곳에 api 적용하면 됩니다 -->
         <!-- weather widget start -->
         <div class="weather_table"
            style="position: relative; top: -679px; height: 206px;">
            <table cellpadding=0 cellspacing=0 width=500 height="216px"
               style="font-family: Verdana; font-size: 14px;">
               <tr>
                  <td
                     style="padding-top: 0px; padding-bottom: 0px; position: relative; top: 6px;">
                     <table width=100% cellpadding=0 cellspacing=0>
                        <tr height="56px">
                           <td width=8 height=30
                              background="https://rp5.ru/informer/htmlinfa/topshl.png"
                              bgcolor=#20a5fe></td>
                           <td width=* align=center
                              background="https://rp5.ru/informer/htmlinfa/topsh.png"
                              bgcolor=#20a5fe><a
                              style="color: #ffffff; font-family: Verdana; font-size: 18px; text-decoration: none;"
                              href="https://rp5.ru/5483/ko"><b>서울</b></a></td>
                           <td width=8 height=30
                              background="https://rp5.ru/informer/htmlinfa/topshr.png"
                              bgcolor=#20a5fe> </td>
                        </tr>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td valign=top style="padding: 0; height: 140px"><iframe
                        src="https://rp5.ru/htmla.php?id=12514&lang=ko&um=00000&bg=%23ffffff&ft=%23ffffff&fc=%23209efe&c=%23000000&f=Arial&s=12&sc=2"
                        width=100% height=146 frameborder=0 scrolling=no
                        style="margin: 0; border: 0px;"></iframe></td>
               </tr>
            </table>
         </div>
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
      <div class="cal_view">
         <!-- 오늘 일정 뷰 -->
         <ul>
            <li style="font-size: 20px; margin-left: 20px; font-weight: bold; padding-left: 15px; padding-bottom: 5px; border-bottom: 2px solid black; width: 300px;">
            <a href="#">오늘 일정</a></li>
         </ul>
         <br> <br>
         <ul>
            <hr>
            <c:forEach items="${list_calendar}" var="h_CalendarVO">
               <li style="font-size: 16px; font-weight: bold; padding-left: 25px; vertiacl-align: middle; height: 20px;"><a
                  href="/calendar/index"><span style="color:red; font-size: 13px; ">* &nbsp;&nbsp;</span> ${h_CalendarVO.title} 
                  <%--    <c:if test="${h_NoticeVO.n_date.substring(0,10) == sysdate}">
                     <img
                        src="http://s.nx.com/S2/billing/pcbang/real/homepage/ico/ico_new.gif"
                        alt="새글" />
                     </c:if> --%>
               </a></li>
            </c:forEach>

         </ul>

      </div>
      <hr />

      <!-- 본문 끝 -->
   </div>
</div>

<div class="footer_wrap" style="background-color: #eef1f2;">
   <div id="footer">
      <%@ include file="include/footer.jsp"%>
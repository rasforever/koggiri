<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
<div align="center">
<div id="main_header" align="center">
      <jsp:include page="../Main/header.jsp" />
   </div>
<div class="chart" align="center"> --%>

<!-- 부서 별 -->   

 <div id="Tabss">
 <div id="a">
 <ul>
    <li><a href="#MM">경영진</a></li>
   	<li><a href="#PL">인사팀</a></li>
    <li><a href="#MT">관리팀</a></li>
    <li><a href="#SN">솔루션팀</a></li>
    <li><a href="#BS">영업팀</a></li>
    <li><a href="#MG">마게팅팀</a></li>
</ul>
</div>
     <br><br><br>
<div class="tabs-spacer"></div>
   <div id="MM" class="tab_content">
      <c:forEach var = "Chart" items = "${list}">
         <c:if test="${Chart.dept_id == 'MM'}"><tr><td>
            <a  class="member_m" href="detail.ch?emp_nm=${Chart.emp_nm }#MM"> ${Chart.emp_nm } ${Chart.pos_nm } </a>
         </td></tr></c:if>
      </c:forEach>
   </div>
   
   <div id="PL" class="tab_content">
      <c:forEach var = "Chart" items = "${list}">
         <c:if test="${Chart.dept_id == 'PL'}"><tr><td>
            <a class="member_m" href="detail.ch?emp_nm=${Chart.emp_nm }#PL"> ${Chart.emp_nm } ${Chart.pos_nm } </a>
         </td></tr></c:if>
      </c:forEach>
   </div>

   <div id="MT" class="tab_content">
      <c:forEach var = "Chart" items = "${list}">
         <c:if test="${Chart.dept_id == 'MT'}"><tr><td>
            <a  class="member_m" href="detail.ch?emp_nm=${Chart.emp_nm }#MT"> ${Chart.emp_nm } ${Chart.pos_nm } </a>
         </td></tr></c:if>
      </c:forEach>
   </div>
   
   <div id="SN" class="tab_content">
      <c:forEach var = "Chart" items = "${list}">
         <c:if test="${Chart.dept_id == 'SN'}"><tr><td>
            <a  class="member_m" href="detail.ch?emp_nm=${Chart.emp_nm }#SN"> ${Chart.emp_nm } ${Chart.pos_nm } </a>
         </td></tr></c:if>
      </c:forEach>
   </div>
   
   <div id="BS" class="tab_content">
      <c:forEach var = "Chart" items = "${list}">
         <c:if test="${Chart.dept_id == 'BS'}"><tr><td>
            <a  class="member_m" href="detail.ch?emp_nm=${Chart.emp_nm }#BS"> ${Chart.emp_nm } ${Chart.pos_nm } </a>
         </td></tr></c:if>
      </c:forEach>
   </div>
   
   <div id="SE" class="tab_content">
      <c:forEach var = "Chart" items = "${list}">
         <c:if test="${Chart.dept_id == 'SE'}"><tr><td>
            <a  class="member_m" href="detail.ch?emp_nm=${Chart.emp_nm }#SE"> ${Chart.emp_nm } ${Chart.pos_nm } </a>
         </td></tr></c:if>
      </c:forEach>
   </div>   
   
   <div id="MG" class="tab_content">
      <c:forEach var = "Chart" items = "${list}">
         <c:if test="${Chart.dept_id == 'MG'}"><tr><td>
            <a  class="member_m" href="detail.ch?emp_nm=${Chart.emp_nm }#MG"> ${Chart.emp_nm } ${Chart.pos_nm } </a>
         </td></tr></c:if>
      </c:forEach>
   </div>
      
</div>
     <br><br><br>
<!-- 사원 상세정보 -->
<div id="chart_detail" align="left">
   <table>
   ${chart.emp_nm}<br>
   ${chart.emp_id}<br>
   ${chart.sex_nm}<br>
   ${chart.pos_nm}<br>
   ${chart.tel_no}<br>
   ${chart.e_mail}<br>
   ${chart.join_dt}
   </table>
</div>
</div>
</div>
<br><br><br>

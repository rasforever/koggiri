<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="side.jsp"%> --%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/information/index">회사정보</a>  &gt;  <strong>조직도</strong></span>
</div>
</div>


<div id="lnb">
     <div class="lnb01">
      <strong class="menu05"><span>회사 정보</span></strong>
      <ul>

                <li class="menu02 ">
                    <a href="/chart/listAll">조직도</a>
                    <ul>
                      <li class="sub01 "><a href="/chart/list?dept_id=MM">경영팀</a></li>
                      <li class="sub02 "><a href="/chart/list?dept_id=PL">인사팀</a></li>
                      <li class="sub03 "><a href="/chart/list?dept_id=MT">관리팀</a></li>
                      <li class="sub01 "><a href="/chart/list?dept_id=SN">솔루션팀</a></li>
                      <li class="sub02 "><a href="/chart/list?dept_id=BS">영업팀</a></li>
                      <li class="sub03 "><a href="/chart/list?dept_id=MG">마케팅팀</a></li>
                    </ul>
                </li>
                <ul> </ul>
           </ul>
   </div>
</div>

<div id="sub_content" align="center">

	<a href="/chart/read?emp_id=k17030101" align="left" ><img src="/resources/img/chart_CEO.png" style="width: 170px;"></a>
	<br><br>
	<a style="font-size: 24px; font: bold;">CEO</a> <a style="font-size: 22px;">고 병휘</a>
	<br><br>
	<img src="/resources/img/chart_line.png" align="center" style="width: 815px; height: 150px;">
	<br>
	
	<a class="dept_nm" href="/chart/list?dept_id=MM"><br>경<br><br>영<br><br>팀</a>
	<a class="dept_nm"href="/chart/list?dept_id=PL"><br>인<br><br>사<br><br>팀</a>
	<a class="dept_nm"href="/chart/list?dept_id=MT"><br>관<br><br>리<br><br>팀</a>
	<a class="dept_nm"href="/chart/list?dept_id=SN">솔<br><br>루<br><br>션<br><br>팀</a>
	<a class="dept_nm"href="/chart/list?dept_id=BS"><br>영<br><br>업<br><br>팀</a>
	<a class="dept_nm"href="/chart/list?dept_id=MG">마<br><br>케<br><br>팅<br><br>팀</a>
	
</div>


</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>

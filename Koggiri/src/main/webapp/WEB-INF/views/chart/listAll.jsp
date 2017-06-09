<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="side.jsp"%> --%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 


<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu03.png"/></h1>
<div class="breadcrumb">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="#">업무</a>  &gt;  <strong>업무 보고</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu02"><span>전자문서</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="#">업무보고</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="#">전자결재</a>
                    <ul>
                      <li class="sub01 "><a href="#">기안서 작성</a></li>
                      <li class="sub02 "><a href="#">보낸결재</a></li>
                      <li class="sub03 "><a href="#">받은결재</a></li>
                    </ul>
                </li>
                <li class="menu03 ">
                    <a href="#">문서함</a>
                    <ul> </ul>
                </li>
           </ul>
   </div>
</div>

<div id="content">

	<a href="/chart/list?dept_id=MM">경영팀</a>
	<a href="/chart/list?dept_id=PL">인사팀</a>
	<a href="/chart/list?dept_id=MT">관리팀</a>
	<a href="/chart/list?dept_id=SN">솔루션팀</a>
	<a href="/chart/list?dept_id=BS">영업팀</a>
	<a href="/chart/list?dept_id=MG">마게팅팀</a>

       
</div>




<!-- 본문 끝 -->

<%@ include file="../include/footer.jsp"%>

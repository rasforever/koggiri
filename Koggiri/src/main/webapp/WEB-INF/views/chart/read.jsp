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

<div id="sub_content">

<!-- 본문 내용 시작 -->

<form role="form" method="get">
	<input type='hidden' name='emp_id' value="${chartVO.emp_id}">
</form>
	
	<a style="font-size: 20px">▶${chartVO.dept_nm}</a> <br><br><br>
	
	<div>
	<table>
		<tr><td rowspan="4"  width=" 180px"><img alt="사진" src="/displayFile?fileName=/emp/${chartVO.filename }" width="170" height="190" ></td>
		<th>이름</th><td width="630px" style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.emp_nm}</a></td></tr>
		<th>사번</th><td  style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.emp_id}</a></td></tr>
		<th>성별</th><td  style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.sex_nm}</a></td></tr>
		<th>직급</th><td style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.pos_nm}</a></td></tr>
		<tr><th colspan="2" >Tel</th><td style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.tel_no}</a></td></tr>
		<tr><th colspan="2">Email</th><td style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.e_mail}</a></td></tr>
		<tr><th colspan="2">주소</th><td style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.addr}</a></td></tr>
		<tr><th colspan="2">입사일</th><td style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<a>${chartVO.join_dt}</a></td></tr>

		</table>
	</div>
	
<!-- 본문 내용  끝-->
	
</div>
       
</div>
</div>


<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>
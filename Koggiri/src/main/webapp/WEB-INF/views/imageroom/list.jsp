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
<h1><img src="/resources/img/s_menu13.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="imageRoom/list">회의</a>  &gt;  <strong>그림 회의</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu04"><span>회의</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="/imageRoom/list">그림회의</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="#">화상회의</a>
                </li>
           </ul>
   </div>
</div>

<!-- 본문 내용  -->

<iframe id="your-frame-id" name="testIframe" width="970" height="1040" src="http://106.242.203.68:8082/imageroom/lobby?emp_id=${mem_id }" frameborder="1" scrolling="no" ></iframe>
<!-- 본문 끝 -->
</div>
</div>

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>
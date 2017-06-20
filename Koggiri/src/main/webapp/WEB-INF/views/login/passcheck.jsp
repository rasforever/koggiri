<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span>  <strong>내 정보수정</strong></span>
</div>
</div>


<div id="lnb">
     <div class="lnb01">
      <strong class="menu05"><span>내 정보수정</span></strong>
      <ul>

                <li class="menu02 ">
                    <a href="/login/passcheck">내 정보수정</a>
                    <ul>
     
                    </ul>
                </li>
                <ul> </ul>
           </ul>
   </div>
</div>

<div id="sub_content">

	<form action="/login/passcheck" method="post">
		<label>아이디 : ${mem_id }</label>
		<input type="password" name="mem_pw" maxlength="15" placeholder="비밀번호를 입력하세요" class="idpw_pw">
		<input type="submit" value="확인" id="pw_btn">
	</form>

</div>
</div>

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>

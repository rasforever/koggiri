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
<h1><img src="/resources/img/s_menu15.png"/></h1>
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
           </ul>
   </div>
</div>

<div id="sub_content" align="center">



<br><br><br><br><br><br>
	<form action="/login/passcheck" method="post">
		<label style="font-size: 18px; position: relative; left: -100px">아이디 : ${mem_id }</label><br><br>
		<input type="password" name="mem_pw" maxlength="15" placeholder="비밀번호를 입력하세요" class="idpw_pw" 
			style="width: 250px; height: 40px">
		<input type="submit" value="확인" id="pw_btn" style="width: 100px; height: 40px">
	</form><br><br><br>
<h4>내 정보수정을 위해 본인 확인 절차가 필요합니다. 비밀번호를 입력해 주세요 </h4>
	</div>


</div>
</div>
<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>

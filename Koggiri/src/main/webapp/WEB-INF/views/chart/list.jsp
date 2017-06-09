<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>


 <form role="form" action="read" method="get">
    <input type='hidden' name='emp_id' value ="${ChartVO.emp_id}">
 </form>
 
<form role="form" method="get">
    <input type='hidden' name='dept_id' value ="${ChartVO.dept_id}">
 </form>

<!-- 본문 시작 -->
<!-- <div id="content">
                   
<h1><img src="img/s_menu10.png"/></h1>
<div class="breadcrumb">	
    <span><a href="main.jsp">홈</a>  <span> &gt; </span> <a href="#">회사 정보</a>   &gt;  <strong>조직도</strong></span>
</div> -->

<!-- 본문 내용 -->              

<table>
      <c:forEach var = "ChartVO" items = "${list}">
       <%-- <c:if test="${ChartVO.dept_id} == ${dept_id}"> --%>
         <tr><td>
            <a href='/chart/read?emp_id=${ChartVO.emp_id}'> ${ChartVO.emp_nm } ${ChartVO.pos_nm } </a>
         </td></tr>
        <%--  </c:if> --%>
      </c:forEach>
</table>

<!-- 본문 끝 -->

<%@ include file="../include/footer.jsp"%>



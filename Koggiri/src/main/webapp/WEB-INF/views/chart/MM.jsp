<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

 <form role="form" action="read" method="get">
    <input type='hidden' name='emp_id' value ="${ChartVO.emp_id}">
 </form>  
 
<table>
      <c:forEach var = "ChartVO" items = "${list}">
         <tr><td>
            <a href='/chart/read?emp_id=${ChartVO.emp_id}'> ${ChartVO.emp_nm } ${ChartVO.pos_nm } </a>
         </td></tr>
      </c:forEach>
</table>

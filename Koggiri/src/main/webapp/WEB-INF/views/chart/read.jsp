<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form role="form" method="get">
    <input type='hidden' name='emp_id' value ="${ChartVO.emp_id}">
 </form> 
a =${emp_id}
${ChartVO.emp_id}
<table>
<tr><td>

<label>이름: </label><a>${ChartVO.emp_nm}</a><br>
<label>사번: </label><a>${ChartVO.emp_id}</a><br>
<label>성별: </label><a>${ChartVO.sex_nm}</a><br>
<label>직급: </label><a>${ChartVO.pos_nm}</a><br>
<label>Tel: </label><a>${ChartVO.tel_no}</a><br>
<label>Email: </label><a>${ChartVO.e_mail}</a><br>
<label>입사일: </label><a>${ChartVO.join_dt}</a>

</td></tr>
</table>
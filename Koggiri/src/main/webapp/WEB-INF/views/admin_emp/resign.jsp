<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<table id="resign_table">

<tr >
<td >
사번 &nbsp;&nbsp;&nbsp;
<input type="text" name="area" style="height:25px; width:150px; margin-right:60px" disabled></td>
<td >
이름 &nbsp;&nbsp;&nbsp;
<input type="text" name="area" style="height:25px; width:150px" disabled></td>
</tr>
<tr >
<td >
직종 &nbsp;&nbsp;&nbsp;
<input type="text" name="area" style="height:25px; width:150px" disabled></td>
<td >
부서 &nbsp;&nbsp;&nbsp;
<input type="text" name="area" style="height:25px; width:150px" disabled></td>
</tr>
<tr >
<td>
사유 &nbsp;&nbsp;&nbsp;
<select id="selectbox" name="selectbox"  style="height:25px; width:150px" > <option value="">퇴사 사유 선택</option>
<option value="그냥">그냥</option></select></td>
<td >
퇴사일 
<input type="text" name="area" style="height:25px; width:150px" ></td>
</tr>
</table>
<table>
<tr>
<td><input type="text" name="start_vacation" class="datepicker"></td>
<td><input type="text" name="end_vacation" class="datepicker"></td>
</tr>
</table>
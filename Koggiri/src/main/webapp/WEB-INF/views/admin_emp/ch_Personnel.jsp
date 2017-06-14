<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<table id="ch_Personnel_table">

<tr >
<td > 
<input type="checkbox" name="area" style="height:12px; width:12px">직급변경</td>
</tr>
<tr >
<td >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재직급 
<input type="text" name="area" style="height:25px; width:70px" disabled></td>
<td >
&nbsp;&nbsp;&nb[]sp;&nbsp;&nbsp;변경직급
<input type="text" name="area" style="height:25px; width:70px" ></td>
</tr>
</table>
<table style="margin-top:15px">
<tr >
<td > 
<input type="checkbox" name="area" style="height:12px; width:12px">부서변경</td>
</tr>
<tr >
<td >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재부서 
<input type="text" name="area" style="height:25px; width:70px" disabled></td>
<td >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변경부서
<input type="text" name="area" style="height:25px; width:70px" ></td>
</tr>
</table>


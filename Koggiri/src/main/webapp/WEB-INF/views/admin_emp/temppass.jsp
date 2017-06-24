<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<h2 align="left">비밀번호 변경</h2>
<br>
<form action="/admin_emp/temppass" method="post">
<table>
	<tr>
	<td>
	<input type="text" name="mem_id" size="40px" placeholder="사번을 입력하세요" style=" width: 300px; height: 40px; margin-right: 10px">
	<input type="submit" value="비밀번호 생성" id="re_pass" style="cursor: pointer; width: 100px; height: 50px"></td>
	</tr>
</table>
</form>
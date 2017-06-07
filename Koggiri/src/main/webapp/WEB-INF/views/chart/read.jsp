<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form role="form" method="get">
	<input type='hidden' name='emp_id' value="${chartVO.emp_id}">
</form>
<table>
	<tr>
		<td><label>이름: </label><a>${chartVO.emp_nm}</a><br> <label>사번:
		</label><a>${chartVO.emp_id}</a><br> <label>성별: </label><a>${chartVO.sex_nm}</a><br>
			<label>직급: </label><a>${chartVO.pos_nm}</a><br> <label>Tel:
		</label><a>${chartVO.tel_no}</a><br> <label>Email: </label><a>${chartVO.e_mail}</a><br>
			<label>입사일: </label><a>${chartVO.join_dt}</a></td>
	</tr>
</table>
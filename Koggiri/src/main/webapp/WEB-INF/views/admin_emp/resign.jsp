<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<h2 align="left">퇴사 처리</h2>
<br>
<form action="resign" method="post">
	<table id="resign_table">
			<input type="hidden" id="emp_id"
				name="emp_id" value="">
				<tr>
			<th>사번 </th> <td><input type="text" id="emp" name="emp"
				style="height: 25px; width: 150px;" disabled></td>
			<th>이름</th><td> <input type="text" id="emp_nm"
				name="emp_nm" style="height: 25px; width: 150px" disabled></td>
		</tr>
		<tr>
			<th>부서 </th><td> <input type="text" id="dept_nm"
				name="dept_nm" style="height: 25px; width: 150px" disabled></td>
			<th>직급 </th> <td><input type="text" id="pos_nm"
				name="pos_nm" style="height: 25px; width: 150px" disabled></td>
		</tr>
		<tr>
			<th>사유</th>
			<td> <select id="res_type" name="res_type" style=" width: 163px;">
					<c:forEach items="${reslist}" var="res_TypeVO">
						<option value="${res_TypeVO.res_type }">${res_TypeVO.res_name }
						</option>
					</c:forEach>
			</select></td>
			<th>퇴사일 </th>
			<td><input type="text" name="expire_dt" class="datepicker"
				style="height: 25px; width: 150px"></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit" value="변경"
				id="ch_personnel_btn" style="cursor: pointer; width: 100px; height: 40px"></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	var tr = $("#manager_table tr");
	var td_id = [];
	var td_name = [];
	var td_dept = [];
	var td_pos = [];
	for (var i = 0; i < tr.length; i++) {
		var temp = $("td", tr.eq(i));
		var tempArr_id = [];
		var tempArr_name = [];
		var tempArr_dept = [];
		var tempArr_pos = [];
		tempArr_id.push(temp.eq(0).text());
		tempArr_name.push(temp.eq(1).text());
		tempArr_dept.push(temp.eq(2).text());
		tempArr_pos.push(temp.eq(3).text());
		td_id[i] = tempArr_id;
		td_name[i] = tempArr_name;
		td_dept[i] = tempArr_dept;
		td_pos[i] = tempArr_pos;
	}
	var getVal = function(key) {
		var id = td_id[key];
		var name = td_name[key];
		var dept = td_dept[key];
		var pos = td_pos[key];
		$('#emp_id').val(id);
		$('#emp').val(id);
		$('#emp_nm').val(name);
		$('#dept_nm').val(dept);
		$('#pos_nm').val(pos);

		return false;
	};
	$(function() {

		$(".datepicker").datepicker({
			dateFormat : "yy/mm/dd"
		});

	});
</script>


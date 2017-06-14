<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<table id="modifyInformation_table">

	<tr>
		<td>사번 &nbsp;&nbsp;&nbsp; <input type="text" id="emp_id" name="emp_id"
			style="height: 25px; width: 150px;" disabled></td>
		<td>이름 &nbsp;&nbsp;&nbsp; <input type="text" id="emp_nm"  name="emp_nm"
			style="height: 25px; width: 150px" disabled></td>
	</tr>
	<tr>
		<td>부서 &nbsp;&nbsp;&nbsp; <input type="text" id="dept_nm"  name="dept_nm"
			style="height: 25px; width: 150px" disabled></td>
		<td>직급 &nbsp;&nbsp;&nbsp; <input type="text" id="pos_nm"  name="pos_nm"
			style="height: 25px; width: 150px" disabled></td>
	</tr>
	<tr>
		<td  colspan="2">주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
			type="text" name="area" style="height: 25px; width: 387px"></td>
	</tr>
	<tr>
		<td  colspan="2">전화번호 <input type="text" name="area"
			style="height: 25px; width: 250px;"></td>
	</tr>
	<tr>
		<td  colspan="2">이메일 &nbsp;&nbsp;&nbsp; <input type="text" name="area"
			style="height: 25px; width: 250px"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="변경" id="mod_information_btn" style="cursor:pointer"></td>
	</tr>
</table>

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
		$('#emp_nm').val(name);
		$('#dept_nm').val(dept);
		$('#pos_nm').val(pos);
		
		return false;
	};
</script>
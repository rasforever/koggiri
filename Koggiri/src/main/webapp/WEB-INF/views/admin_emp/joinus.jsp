<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {

		$(".datepicker").datepicker({
			dateFormat : "yy/mm/dd"
		});

	});
</script>
<br>
<br>
<br>
<div id="joinus" align="left">
	<h2>입사 발령 입력</h2>
	<form action="joinus" method="post" id="insertform">
		<table id="joinus_table">
			<tr>
				<th align="center" width="150px">이름</th>
				<td><input type="text" name="emp_nm" placeholder="ex)유승현"
					style="width: 290px;"></td>
			</tr>
			<tr>
				<th align="center">직급</th>
				<td><select name="pos_id"
					style="cursor: pointer; width: 300px;">
						<option value="">직급선택</option>
						<option value="10">CEO</option>
						<option value="11">이사</option>
						<option value="12">부장</option>
						<option value="13">차장</option>
						<option value="14">과장</option>
						<option value="15">대리</option>
						<option value="16">사원</option>
				</select></td>
			</tr>
			<tr>
				<th align="center">부서</th>
				<td><select name="dept_id"
					style="cursor: pointer; width: 300px;">
						<option value="">부서선택</option>
						<option value="MM">경영진</option>
						<option value="PL">인사팀</option>
						<option value="MT">관리팀</option>
						<option value="SN">솔루션팀</option>
						<option value="BS">영업팀</option>
						<option value="SE">서비스팀</option>
						<option value="MG">마케팅팀</option>
				</select></td>
			</tr>
			<tr>
				<th align="center">입사일</th>
				<td><input type="text" style="width: 290px;" class="datepicker"
					name="join_dt" /></td>
			</tr>
			<tr>
				<th align="center">성별</th>
				<td><select name="sex_id"
					style="cursor: pointer; width: 300px;">
						<option value="">성별선택</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select></td>
			</tr>
			<th align="center">국적</th>
			<td><select name="nation_id"
				style="cursor: pointer; width: 300px;">
					<option value="">국적선택</option>
					<option value="KR">한국</option>
					<option value="JP">일본</option>
					<option value="US">미국</option>
			</select></td>
			</tr>
			<tr>
				<th align="center">주민등록번호</th>
				<td><input type="text" style="width: 290px;" name="res_no"
					placeholder=" ' - '없이 입력하세요"></td>
			</tr>
			<tr>
				<br>
				<td colspan="2" align="center"><input type="submit" value="추가"
					id="joinus_btn" style="cursor: pointer; width: 100px; height: 40px"></td>
			</tr>
		</table>

	</form>
</div>
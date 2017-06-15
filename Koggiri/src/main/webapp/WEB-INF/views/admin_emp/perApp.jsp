<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

	<table class="manager_table_title" border="1">
						<tr>
							<th>사원ID</th>
							<th>성명</th>
							<th>변경일</th>
							<th>인사발령명</th>
							<th>변경 직급</th>
							<th>변경 부서</th>
							
						</tr>
					
							<c:forEach var="Per_AppVO" items="${list }">
								<tr align="center">
									<td>${Per_AppVO.emp_id}</td>
									<td>${Per_AppVO.emp_nm }</td>
									<td>${Per_AppVO.per_dt }</td>
									<td>${Per_AppVO.per_nm }</td>
									<td>${Per_AppVO.pos_nm }</td>
									<td>${Per_AppVO.dept_nm }</td>
								</tr>
							</c:forEach>
						</table>
						
						사번검색:<input type="text" name='searchKey' >
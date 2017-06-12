<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

							<table class="table table-bordered" border="1">
								<tr>
									<th>이름</th>
									<th>부서</th>
									<th>직급</th>
								</tr>



								<c:forEach items="${list}" var="SnsVO">
										<tr>
											<td>${SnsVO.emp_nm}</td>
											<td>${SnsVO.dept_nm}</td>
											<td>${SnsVO.pos_nm}</td>
										</tr>
								</c:forEach>

							</table>
						<!-- /.box-body -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>



<script>
	function timer() {

		location.reload();
	};
	window.onload = function timerStart() {
		tid = setInterval('timer()', 1000);

	};
</script>



	<section>
		<%-- ${ck_emp_id} --%>
		<c:forEach items="${roomlist}" var="roomVO">
			<c:if test="${roomVO.emp_id == emp_id}">
				<div class="clear"></div>
				<div class="from-me" style="text-align: right">
					<c:if test="${roomVO.input_text !=null}">
						<p>${roomVO.input_text }</p>
					</c:if>
				</div>

			</c:if>


			<c:if test="${roomVO.n_emp_id == n_emp_id}">
				<div class="clear"></div>
				<div class="emp_name">사원이름</div>
				<div class="from-them" style="text-align: left">
					<c:if test="${roomVO.input_text !=null}">
						<p>${roomVO.input_text }</p>
					</c:if>
				</div>
			</c:if>
		</c:forEach>
	</section>

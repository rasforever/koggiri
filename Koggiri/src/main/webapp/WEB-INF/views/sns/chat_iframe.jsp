<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<style type="text/css">
body { overflow:hidden; }
</style>
 

<link rel="stylesheet" href="../resources/Content/themes/real/sns.css">
<script>
	function timer() {
		location.reload();
	}
	;
	window.onload = function timerStart() {
		tid = setInterval('timer()', 10000);

	};
</script>

<body>
<div id="sns_chat" class="sns_chat"
	style="overflow-y: scroll; height: 600px">
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


			<c:if test="${roomVO.emp_id == n_emp_id}">
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
</div>
</body>
<script type="text/javascript">
	var objDiv = document.getElementById("sns_chat");
	objDiv.scrollTop = objDiv.scrollHeight;
</script>

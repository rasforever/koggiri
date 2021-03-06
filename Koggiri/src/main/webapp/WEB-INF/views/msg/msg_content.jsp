<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet" href="../resources/Content/themes/real/msg.css">

</head>


<body>
	<div>
		<div id="msg_context" class="msg_context"
			style="overflow-y: scroll; height: 430px">
			<section>
				<%-- ${ck_emp_id} --%>
				<c:forEach items="${msglist}" var="msgVO">
					<c:if test="${msgVO.emp_id == emp_id}">
						<div class="clear"></div>
						<div class="from-me" style="text-align: right">
							<c:if test="${msgVO.input_text !=null}">
								<p>${msgVO.input_text }</p>
							</c:if>
						</div>

					</c:if>


					<c:if test="${msgVO.emp_id == n_emp_id}">
						<div class="clear"></div>
						<div class="emp_name">${msgVO.emp_nm }</div>
						<div class="from-them" style="text-align: left">
							<c:if test="${msgVO.input_text !=null}">
								<p>${msgVO.input_text }</p>
							</c:if>
						</div>
					</c:if>
				</c:forEach>

			</section>
		</div>

		<div class="msg_header">
			<br> <img src="../resources/img/koggiri_talk.png">

			<a class="msg_back" href="../msg/msg_emplist">목록</a>

		</div>
		<div class="msg_contextBox">
			<form action="msg_content" method="post">
				<input type="hidden" name="emp_id" value="${emp_id }"> <input
					type="hidden" name="msg_id" value="${msg_id }"> <input
					type="hidden" name="n_emp_id" value="${n_emp_id }">
				<textarea rows="3" cols="40" name="input_text"></textarea>
				<input type="submit" value="전송">
			</form>
		</div>

	</div>
	
	<script type="text/javascript">
		var objDiv = document.getElementById("msg_context");
		objDiv.scrollTop = objDiv.scrollHeight;
	</script>

</body>



<!-- /.box-body -->


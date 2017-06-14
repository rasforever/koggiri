<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet" href="../resources/Content/themes/real/sns.css">

</head>



<body>

<div>
	<div class="sns_chat" style="overflow-y: scroll; height: 600px">
		<section>
			<%-- ${ck_emp_id} --%>
			<c:forEach items="${roomlist}" var="roomVO">
				<c:if test="${roomVO.emp_id == ck_emp_id}">
					<div class="clear"></div>
					<div class="from-me" style="text-align: right">
						<c:if test="${roomVO.input_text !=null}">
							<p>${roomVO.input_text }</p>
						</c:if>
					</div>

				</c:if>


				<c:if test="${roomVO.emp_id == ck_n_emp_id}">
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

	<div class="sns_header">
		<br> <img src="../resources/img/koggiri_talk.png"> <br>
	</div>ㄴ
	<div class="sns_chatBox">
	<textarea rows="3" cols="50"></textarea>
	<input type="submit" value="전송">
	</div>
</div>



</body>

</body>

</body>



<!-- /.box-body -->


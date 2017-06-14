<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet" href="../resources/Content/themes/real/sns.css">

<style>
body {
  font-family: "Helvetica Neue";
  font-size: 15px;
  font-weight: normal;
}

section {
  max-width: 450px;
  margin: 50px auto;
}
section div {
  max-width: 255px;
  word-wrap: break-word;
  margin-bottom: 8px;
  line-height: 24px;
}

.clear {
  clear: both;
}

.from-me {
  position: relative;
  padding: 5px 20px;
  color: white;
  background: #0B93F6;
  border-radius: 25px;
  float: right;
}
.from-me:before {
  content: "";
  position: absolute;
  z-index: -1;
  bottom: -2px;
  right: -7px;
  height: 20px;
  border-right: 20px solid #0B93F6;
  border-bottom-left-radius: 16px 14px;
  -webkit-transform: translate(0, -2px);
}
.from-me:after {
  content: "";
  position: absolute;
  z-index: 1;
  bottom: -2px;
  right: -56px;
  width: 26px;
  height: 20px;
  background: white;
  border-bottom-left-radius: 10px;
  -webkit-transform: translate(-30px, -2px);
}

.from-them {
  position: relative;
  padding: 5px 20px;
  background: #E5E5EA;
  border-radius: 25px;
  color: black;
  float: left;
}
.from-them:before {
  content: "";
  position: absolute;
  z-index: 2;
  bottom: -2px;
  left: -7px;
  height: 20px;
  border-left: 20px solid #E5E5EA;
  border-bottom-right-radius: 16px 14px;
  -webkit-transform: translate(0, -2px);
}
.from-them:after {
  content: "";
  position: absolute;
  z-index: 3;
  bottom: -2px;
  left: 4px;
  width: 26px;
  height: 20px;
  background: white;
  border-bottom-right-radius: 10px;
  -webkit-transform: translate(-30px, -2px);
}

.chat_inputform{
	position: fixed;
	top: 360px;
	


}

</style>

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


<div class="chat_inputform">
<%@ include file="../include/chat_footer.jsp"%>
</div>

<!-- /.box-body -->


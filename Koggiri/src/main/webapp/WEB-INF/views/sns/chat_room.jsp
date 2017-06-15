<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<style>
#iframe {
	position: fixed;
	top: 100px;
}
</style>


<head>
<link rel="stylesheet" href="../resources/Content/themes/real/sns.css">
</head>



<body>
	<div>
		<div id="sns_chat" class="sns_chat"
			style="overflow-y: scroll; height: 600px">
			<iframe
				src='http://localhost:8081/sns/chat_iframe?emp_id=${emp_id }&n_emp_id=${n_emp_id }&room_id=${room_id }'
				id="iframe" width="600" height="400"></iframe>

			<div class="sns_header">
				<br> <img src="../resources/img/koggiri_talk.png"> <br>
			</div>
			<div class="sns_chatBox">
				<form action="chat_room" method="post">
					<input type="hidden" name="emp_id" value="${emp_id }"> <input
						type="hidden" name="room_id" value="${room_id }"> <input
						type="hidden" name="n_emp_id" value="${n_emp_id }">
					<textarea rows="3" cols="50" name="input_text"></textarea>
					<input type="submit" value="전송">
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var objDiv = document.getElementById("sns_chat");
		objDiv.scrollTop = objDiv.scrollHeight;
	</script>

</body>

<!-- /.box-body -->
<script type="text/javascript">
	var objDiv = document.getElementById("sns_chat");
	objDiv.scrollTop = objDiv.scrollHeight;
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<head>
<script type="text/javascript"
	src="../resources/Scripts/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" href="../resources/Content/themes/real/msg.css">

</head>

<body>
	<div>
		<div id="jobis_context" class="jobis_context"
			style="overflow-y: scroll; height: 600px">
			<section>
				<%-- ${ck_emp_id} --%>
				<br> <br> <br> <br> <br>
			
				<div>
					<c:if test="${my_text != null}">
						<p style="text-align: left">${my_text}</p>
						<br>
					</c:if>
				</div>


			</section>
		</div>

		<div class="msg_header">
			<br> <img src="../resources/img/koggiri_talk.png"> <br>
		</div>

		<div class="jobis_contextBox">

			<textarea rows="3" cols="50" id="input_text"></textarea>
			<input type="submit" id="submit" value="전송">

		</div>

	</div>

	<script type="text/javascript">
		var objDiv = document.getElementById("jobis_context");
		objDiv.scrollTop = objDiv.scrollHeight;

		$('#submit').click(
				function() {

					var input_text = $("#input_text").val();

					alert("ㅣ어ㅗ리몾ㄷ로미졸ㅇ러씨씨ㅣ빨빨빠리ㅏ빠씨ㅏㅃ라ㅣ씨빨");

					$.ajax({
						url : '/jobis/jobis_page',
						
						data : {
							a : input_text
						},
						type : 'post',
						success : function(data) {
							
							$('#jobis_context').append(input_text + "<br>")
									.css("text-align", "left");
							$('#jobis_context').append(data + "<br>").css("text-align", "right");
							$('#input_text').val("");
							

							
						}

					});

					/* 		var text = '${aa}';
							$(".aa").append(text+"<br>");
					 */
					/* $.ajax({
						url : '/jobis/jobis_page',
						dataType : 'text',
						data : {
							a : $("textarea[name=a]").val()
						},
						type : 'POST',
						success : function(data) {
							$('.jobis_context').append(a+"<br>").css("text-align","right");
							$("textarea[name=a]").val("");
							
						}
					}); */
				});
	</script>

</body>



<!-- /.box-body -->

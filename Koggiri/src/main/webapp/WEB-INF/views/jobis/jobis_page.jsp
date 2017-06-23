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
		<div id="jobis_context" class="msg_context" style="overflow-y: scroll; height: 470px">
			<section>
				<%-- ${ck_emp_id} --%>
			</section>
		</div>

		<div class="msg_header">
			<br> <img src="../resources/img/koggiri_jobis.png"> <br>
		</div>

		<div class="jobis_contextBox">

			<textarea rows="3" cols="55" id="input_text" style="position: relative; left: 20px;" ></textarea>
			<input type="submit" id="submit" value="전송">

		</div>

	</div>
	



	<script type="text/javascript">
		var objDiv = document.getElementById("jobis_context");
		objDiv.scrollTop = objDiv.scrollHeight;
	
		
		$('#submit').click(
				function() {

					var input_text = $("#input_text").val();

					
					$.ajax({
						url : '/jobis/jobis_page',

						data : {
							a : input_text
						},
						type : 'post',
						success : function(data) {
							
							if(input_text != " "){
							$('#jobis_context').append("<div class='clear'></div>");
							$('#jobis_context').append("<div class='from-me' align='right'>" + input_text + "</div>")
							$('#jobis_context').append("<div class='clear'></div>");
							$('#jobis_context').append("<div class='from-them' align='left'>" + data + "</div>");
							$('#input_text').val("");
							}
							else{
								alert("공백은 입력할 수 없습니다.");
							}

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

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
				<div class="clear" style="text-align: left;"></div>
				<div class="aa" style="text-align: left;"></div>
				<div class="from-me" style="text-align: left">
					<c:if test="${input_text !=null}">
						<c:if test="${input_text !=null}">
							<p name="a" ></p>
						</c:if>
						<p name="input_text">${input_text}</p>

					</c:if>
				</div>

			</section>
		</div>

		<div class="msg_header">
			<br> <img src="../resources/img/koggiri_talk.png"> <br>
		</div>
		
		<div class="jobis_contextBox">
		<form id="submit" action="/jobis/jobis_page" method="POST">
			<textarea rows="3" cols="50" name="a"></textarea>
			<input type="button" id="submit_button" value="전송">
		</form>	
		</div>

	</div>

	<script type="text/javascript">
		var objDiv = document.getElementById("jobis_context");
		objDiv.scrollTop = objDiv.scrollHeight;

 	$(function() {
	
 			$("#submit_button").click(function() {
 				$("#submit").submit();
				var a = $("textarea[name=a]").val();
				$('.jobis_context').append(a+"<br>").css("text-align","right");
				$("textarea[name=a]").val("");
				
				
				var text = '${aa}';
				$(".aa").append(text+"<br>");
				
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
		}); 
	</script>

</body>



<!-- /.box-body -->

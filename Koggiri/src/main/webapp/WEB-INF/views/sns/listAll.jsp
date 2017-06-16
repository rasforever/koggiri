<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>


<link rel="stylesheet" href="../resources/Content/themes/real/sns.css">
</head>
<body >
	<div id="header" >
				
	<br>

	<div data-role="content" data-position="fixed">
	<div class="sns_header">
		<br>
		<img src="../resources/img/koggiri_talk.png">
		<br>
	</div>
	</div>
	</div>
		<div align="center">
	<div class="sns_contain">
		<div>
			<table  class="sns_table" style="width: 100%">
				<c:forEach items="${list}" var="Msg_EmpVO">
				
					<tr>
					<td style="width: 150px; padding-bottom: 10px;">
					
					<ul>
			
						<li><span class="sns_font">${Msg_EmpVO.dept_nm}<span><br>
									<a style="font-size: 25px;">
										${Msg_EmpVO.emp_nm}&nbsp;<span class="sns_font">${Msg_EmpVO.pos_nm}<span>
								</a> </li>
					</ul>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='/sns/chat_room?emp_id=${emp_id}&n_emp_id=${Msg_EmpVO.emp_id}'>
					<img src="../resources/img/talk.png" ></a>
					</c:forEach>
					</td>
					
					</tr>

			</table>

			<!-- /.box-body -->
		</div>
</div>
</div>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/login/passcheck" method="post">
		<label>아이디 : ${mem_id }</label>
		<input type="password" name="mem_pw" maxlength="15" placeholder="비밀번호를 입력하세요" class="idpw_pw">
		<input type="submit" value="확인" id="pw_btn">
	</form>
</body>
</html>
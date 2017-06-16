<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<head>
<title>Insert title here</title>
</head>
<body>
<textarea id="testchat" rows="10" cols="51" style="resize: none; border-color: blue;" ></textarea><button id="send_chat">보내기</button>

</body>


<script type="text/javascript">

$("#send_chat").click(function(){
	alert($("#testchat").val());

	$.ajax("#testchat")
	
})


</script>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Koggiri</title><!-- script link -->

<script type="text/javascript" src="../resources/Scripts/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../resources/Scripts/ui.js"></script>
<script type="text/javascript" src="../resources/Scripts/jquery-ui-min.js"></script>
<script type="text/javascript" src="../resources/Scripts/jquery.easing.1.3.js"></script>


<!--  css link -->
<link rel="stylesheet" href="../resources/Content/themes/real/ui_sub.css" />
<link href="../resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="http://s.nx.com/S2/billing/pcbang/real/common/favicon.ico" />
<link rel="stylesheet" href="../resources/Content/themes/real/ui_main.css" />
<link rel="stylesheet" href="../resources/Content/themes/real/common.css" />
<script type="text/javascript">
function sendCheckValue(id){ 
    // 회원가입 화면의 ID입력란에 값을 전달
    $("#draft_emp_id",parent.opener.document).val(id);
        
    if (opener != null) {
        opener.chkForm = null;
        self.close();
    }    
}   
</script>

</head>


<!-- ----------------------------------------------------------------------- -->
<body class="main">
	<form action= "emp" method="post">
		 <input	type="text" name="emp_id" id="emp_id" ><input type="submit" value="검색" >	
	</form>
	<div>
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
			</tr>
			<c:forEach items="${emplist}" var="empVO">
				<tr>
					<td onclick="sendCheckValue('${empVO.emp_id }')">${empVO.emp_id }</td>
					<td id="emp_nm">${empVO.emp_nm }</td>					
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>
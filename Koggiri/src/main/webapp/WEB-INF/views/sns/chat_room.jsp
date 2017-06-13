<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<head>
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
</style>
</head>
<body>
<section>
<%-- ${ck_emp_id} --%>
	<c:forEach items="${roomlist}" var="roomVO">	
		<c:if test="${roomVO.emp_id == ck_emp_id}">
		   <div class="clear"></div>
			<div class="from-me"  style="text-align: right">
				<p>${roomVO.input_text }</p>
			</div>
		</c:if>
		<c:if test="${roomVO.emp_id == ck_n_emp_id}">
		 <div class="clear"></div>
			<div class="from-them" style="text-align: left">
				<p>${roomVO.input_text }</p>
			</div>
		</c:if>
	</c:forEach>
</section>
</body>


<!-- /.box-body -->


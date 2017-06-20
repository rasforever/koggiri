<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span>  <strong>내 정보수정</strong></span>
</div>
</div>


<div id="lnb">
     <div class="lnb01">
      <strong class="menu05"><span>내 정보수정</span></strong>
      <ul>

                <li class="menu02 ">
                    <a href="/login/passcheck">내 정보수정</a>
                    <ul>
     
                    </ul>
                </li>
                <ul> </ul>
           </ul>
   </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						//document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
	
	
	
	
	
</script>
</head>
<body>
	<form method="post" action="/login/modify" name="form">
		<label>아이디 : ${mem_id}</label><br> <label>비밀번호: <input
			type="password" id="password" name="mem_pw" maxlength="50"
			placeholder="새 비밀번호를 입력하세요">
		</label><br> <label>비밀번호 확인: <input type="password"
			name="passwordcheck" maxlength="50" placeholder="비밀번호 확인"></label><br>
		<label>E-Mail: <input type="text" name="e_mail1"
			maxlength="50" value="" placeholder="이메일 아이디"> @ &nbsp;<select
			name="e_mail2" id="e_mail2">
				<option value="@naver.com">naver.com</option>
				<option value="@gmail.com">gmail.com</option>
				<option value="@daum.net">daum.net</option>
				<option value="@nate.com">nate.com</option>
		</select></label><br> <label>핸드폰번호: <select id="telno1" name="telno1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
		</select> <input type="input" name="telno2" id="telno2" maxlength="4"
			style="width: 45px"> - <input type="input" name="telno3"
			id="telno3" maxlength="4" style="width: 45px">
		</label><br> <input type="button" onclick="sample6_execDaumPostcode()"
			value="주소 찾기"><br> <input type="text" id="addr1"
			name="addr1" placeholder="주소"> <input type="text" id="addr2"
			name="addr2" placeholder="상세주소"> <br><input type="submit"
			value="수정" /> <input type="button" value="취소"
			onclick="history.go(-2)" />
	</form>

</div>
</div>

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>
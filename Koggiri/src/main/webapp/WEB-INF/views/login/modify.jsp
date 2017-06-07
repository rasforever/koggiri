<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var fullAddr = ''; // ���� �ּ� ����
						var extraAddr = ''; // ������ �ּ� ����

						// ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
						if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
							fullAddr = data.roadAddress;

						} else { // ����ڰ� ���� �ּҸ� �������� ���(J)
							fullAddr = data.jibunAddress;
						}

						// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
						if (data.userSelectedType === 'R') {
							//���������� ���� ��� �߰��Ѵ�.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// �ǹ����� ���� ��� �߰��Ѵ�.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						//document.getElementById('sample6_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
						document.getElementById('addr1').value = fullAddr;

						// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
	
	
	
	
	
</script>
</head>
<body>
	<form method="post" action="/login/modify" name="form">
		<label>���̵� : ${mem_id}</label><br> <label>��й�ȣ: <input
			type="password" id="password" name="mem_pw" maxlength="50"
			placeholder="�� ��й�ȣ�� �Է��ϼ���">
		</label><br> <label>��й�ȣ Ȯ��: <input type="password"
			name="passwordcheck" maxlength="50" placeholder="��й�ȣ Ȯ��"></label><br>
		<label>E-Mail: <input type="text" name="e_mail1"
			maxlength="50" value="" placeholder="�̸��� ���̵�"> @ &nbsp;<select
			name="e_mail2" id="e_mail2">
				<option value="@naver.com">naver.com</option>
				<option value="@gmail.com">gmail.com</option>
				<option value="@daum.net">daum.net</option>
				<option value="@nate.com">nate.com</option>
		</select></label><br> <label>�ڵ�����ȣ: <select id="telno1" name="telno1">
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
			value="�ּ� ã��"><br> <input type="text" id="addr1"
			name="addr1" placeholder="�ּ�"> <input type="text" id="addr2"
			name="addr2" placeholder="���ּ�"> <input type="submit"
			value="����" /> <input type="button" value="���"
			onclick="history.go(-2)" />
	</form>
</body>
</html>
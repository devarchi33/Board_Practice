<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Donghoon's Model1 Board - Text_Input_Form</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
		<p align="center">
			���� : <input type="text" name="title"
				style="height: 30px; width: 150px"><br> �ۼ��� :<input
				type="text" name="writer"
				style="height: 30px; width: 150px; left: auto"><br> ����
			:
			<textarea name="content" cols="20" rows="10"
				style="height: 200px; width: 150px; list-style-type: circle; cursor: text"></textarea>
			<br> ��¥ : <input type="text" name="regdate"
				style="height: 30px; width: 150px"><br> <input
				type="submit" name="����" style="height: 30px; width: 80px">
		</p>
	</form>
	<script>
		function formCheck() {

			var title = document.forms[0].title.value; // ����ϱ� ������ ������ �����Ͽ� ����ְ�,
			var writer = document.forms[0].writer.value;
			var regdate = document.forms[0].regdate.value;
			//var content = document.forms[0].content.value;   

			if (title == null || title == "") { // null���� ���� ��
				alert('������ �Է��ϼ���'); // ���â�� ����
				document.forms[0].title.focus(); // �ش��±׿� ��Ŀ���� �ص�
				return false; // false�� �����մϴ�.
			}

			if (writer == null || writer == "") {
				alert('�ۼ��ڸ� �Է��ϼ���');
				document.forms[0].writer.focus();
				return false;
			} else if (writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null) {
				alert('�̸��� �������� �Է��ϼ���');
				document.forms[0].writer.focus();
				return false;
			}

			if (regdate == null || regdate == "") {

				alert('��¥�� �Է��ϼ���');
				document.forms[0].regdate.focus();
				return false;

			} else if (regdate.match(/^\d\d\d\d\d\d+$/ig) == null) {
				alert('���� ����(6�ڸ�)���� �Է��ϼ���');
				document.forms[0].regdate.focus();
				return false;
			}

		} // function end
	</script>
</body>
</html>




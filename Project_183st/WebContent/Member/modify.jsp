<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<form action="/Project_183st/memberController?type=modify_go" method="post">
		아이디 <input type="text" name="id" value="${member.id }" readonly><br><br>
		비밀번호 <input type="text" id="pwd" name="pwd"><br><br>
		비밀번호 확인 <input type="text" id="pwdchk"><br><br>
		이름 <input type="text" name="name" value="${member.name }" readonly><br><br>
		이메일 <input type="text" name="email" value="${member.email }"><br><br>
		주소 <input type="text" name="addr" value="${member.addr }"><br><br>
		전화번호 <input type="text" name="phone" value="${member.phone }"><br><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>
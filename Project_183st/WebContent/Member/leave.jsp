<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script>
</script>
</head>
<body>
	
	<form action="/Project_183st/memberController?type=leave" method="post">
		비밀번호 <input type="text" name="pwdchk">
		<input type="submit" value="회원 탈퇴">
	</form>
</body>
</html>
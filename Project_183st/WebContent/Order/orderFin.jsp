<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<script>
	function gotoMain(){
		location.href="main.jsp";
	}
</script>
</head>
<body>
	<h1>주문이 성공적으로 처리되었습니다</h1>
	<input type="button" value="메인으로 돌아가기" onclick="gotoMain()">
</body>
</html>